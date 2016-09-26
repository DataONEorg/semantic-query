'''
Python script to set or update a field in the CN solr index.

Update the variables in the main section of the script below.
'''

import logging
import requests
import cachecontrol
import json


class SolrClient(object):

  _page_size = 100
  _solr_reserved = u'+-&|!(){}[]^~*?:"; '


  @staticmethod
  def escapeChar(c):
    '''Return c, escaping if c is a solr reserved char.
    '''
    if c in SolrClient._solr_reserved:
      return u'\\' + c
    return c


  @staticmethod
  def escapeTerm(term):
    '''Escape solr reserved characters for use in a solr query term.
    '''
    return u''.join( map(SolrClient.escapeChar, term) )


  def __init__(self, base_url):
    '''
    '''
    self._L = logging.getLogger(self.__class__.__name__)
    self.setBaseUrl(base_url)
    self._connection = self._getConnection()


  def _getConnection(self, n_tries=3):
    session = requests.Session()
    session.stream = True
    if n_tries is not None:
      self._n_tries = n_tries
      session.mount(
        'http://', requests.adapters.HTTPAdapter(
          max_retries=n_tries
        )
      )
      session.mount(
        'https://',
        requests.adapters.HTTPAdapter(
          max_retries=n_tries
        )
      )
    session.mount('http://', cachecontrol.CacheControlAdapter())
    session.mount('https://', cachecontrol.CacheControlAdapter())
    return session


  def setBaseUrl(self, base_url):
    base_url = base_url.strip()
    if not base_url.endswith("/"):
      base_url += "/"
    self.base_url = base_url


  def GET(self, *args, **kwargs):
    return self._connection.request('GET', *args, **kwargs)


  def POST(self, *args, **kwargs):
    return self._connection.request('POST', *args, **kwargs)


  def count(self, query):
    '''Return the number of records matching the provided query
    '''
    url = self.base_url + "select/"
    params = {'wt':'json',
              'fl':'id',
              'rows':0,
              'q':query,
              }
    res = json.loads( self.GET(url, params=params).text )
    if res['responseHeader']['status'] != 0:
      self._L.error("Non-zero status response: %s", str(res['responseHeader']['status']))
      return 0
    return res['response']['numFound']


  def exists(self, pid):
    '''Returns number of entries with id = pid (should always be 0 or 1)
    '''
    url = self.base_url + "select/"
    params = {'wt': 'json',
              'fl':'id',
              }
    params['q'] = u"id:{0}".format( SolrClient.escapeTerm( pid ))
    response = self.GET( url, params=params )
    res = json.loads( response.text )
    return res['response']['numFound']


  def getValues(self, pid, fields=['id', ]):
    '''Retrieve specified fields for the document identified by id = pid.
    '''
    url = self.base_url + "select/"
    params = {'wt': 'json',
              'fl': ",".join(fields),
              }
    params['q'] = u"id:{0}".format( SolrClient.escapeTerm( pid ))
    response = self.GET( url, params=params )
    res = json.loads( response.text )
    values = []
    if res['responseHeader']['status'] != 0:
      self._L.error("Error retrieving response for pid %s", pid)
    else:
      for entry in res['response']['docs']:
        values.append(entry)
    return values


  def _postUpdateDocument(self, data, commit=True):
    '''Send the provided list of update requests to Solr.
    '''
    if len(data) < 1:
      return
    jsondoc = json.dumps( data, encoding='utf-8' )
    self._L.debug( "UPDATE DOC = %s", jsondoc )
    headers = {'Content-Type': 'application/json'}
    params = {'wt':'json'}
    if commit:
      params['commit'] = 'true'
    url = self.base_url + 'update/'
    response = self.POST( url, 
                          headers=headers, 
                          params=params, 
                          data=jsondoc )
    res = json.loads(response.text)
    if res['responseHeader']['status'] != 0:
      self._L.error("Error updating page: {0}".format(jsondoc))
    else:
      self._L.debug("OK: %s", data)


  def setMV(self, pids=[], values={}):
    '''Set the specified field values of documents identified by pid in pids.

    e.g. given::
      ids = list of identifiers
      values = {'test_corpus_sm':['F', ]}

    Will set the multi string value of the field "test_corpus_sm" for each 
    document identified by pids to exactly ["F", ].

    Note that this will overwrite any existing value. See aslo addMV().
    '''
    page = []
    for pid in pids:
      if len(pid) > 0:
        entry = {'id': pid}
        for k in values.keys():
          entry[k] = {'set': values[k]}
        page.append(entry)
      if len(page) >= SolrClient._page_size:
        self._postUpdateDocument(page)
        page = []
    self._postUpdateDocument(page)


  def addMV(self, pids=[], field=None, value=None, test_unique=True):
    '''Adds the specified value to the documents identified by id in ids.

    If test_unique, then the value is retrieved from the document and only set 
    if not already present. Note checking uniqueness is much slower than just 
    adding the value.

    e.g.:: 

      field="some_multi_string_sm"  value="A"  test_unique=True

      before: record.some_multi_string_sm = ["A", "B"]
      after: record.some_multi_string_sm = ["A", "B"]

      before: record.some_multi_string_sm = ["B"]
      after: record.some_multi_string_sm = ["B", "A"]

      field="some_multi_string_sm"  value="A"  test_unique=False

      before: record.some_multi_string_sm = ["A", "B"]
      after: record.some_multi_string_sm = ["A", "B", "A"]

      before: record.some_multi_string_sm = ["B"]
      after: record.some_multi_string_sm = ["B", "A"]
    '''
    if field is None:
      self._log.error("Must provide a field name.")
      return
    page = []
    for pid in pids:
      update_entry = True
      if test_unique:
        res = self.getValues( pid, fields=[field, ])
        if res.has_key(field):
          if isinstance(list, res[field]):
            if value in res[field]:
              update_entry = False
          else:
            if res[field] == value:
              update_entry = False
      if update_entry:
        entry = {'id': pid,
                 'field': {'add': value}}
        page.append(entry)
      if len(page) >= SolrClient._page_size:
        self._postUpdateDocument(page)
        page = []
    self._postUpdateDocument(page)


#===============================================================================

def getPIDList(url, max=None):
  '''Load a list of identifiers from the specified URL.

  One identifier per line, returns a list of the values stripped of leading and
  trailing white space.
  '''
  doc = requests.get(url).text
  #split response into lines, and trim leading and trailing whitespace
  pid_list = map(unicode.strip, doc.split("\n"))
  #return the list upto max entries, removing any empty strings
  return filter(None, pid_list[0:max])


if __name__ == "__main__":
  logging.basicConfig(level=logging.INFO)
  logging.getLogger('requests').setLevel(logging.CRITICAL)

  #URL for a list of identifiers to update
  pids_url = "https://raw.githubusercontent.com/DataONEorg/semantic-query/master/lib/test_corpus_F_id_list.txt"

  #Name of field to update
  field = "test_corpus_sm"

  #Value to set
  value = "F"

  #URL of the solr index
  #e.g. ssh -L8983:localhost:8983 cn-sandbox-2.test.dataone.org
  solr_url = "http://localhost:8983/solr/search_core_shard1_replica1/"

  #Load list of identiiers from provided URL
  pid_list = getPIDList(pids_url)

  # Client for interacting with solr
  client = SolrClient(solr_url)

  query = "{0}:{1}".format(field, SolrClient.escapeTerm(value))
  num_matching = client.count( query )
  print("Before:\n  Docs matching query\n    {0}\n    {1}".format(query, num_matching))

  # Send the values to solr
  print("Setting {0} to {1} for {2} documents".format(field, value, len(pid_list)))
  client.setMV( pids=pid_list, values={field: [value, ] } )

  num_matching = client.count( query )
  print("After:\n  Docs matching query\n    {0}\n    {1}".format(query, num_matching))

