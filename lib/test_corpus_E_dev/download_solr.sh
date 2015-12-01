#!/bin/bash 
# grab solr metadata for one identifier. 
# quote id to preserve characters.
# saved filename cannot have slashes, change these to underscores for easy viewing.
urlhead='https://cn.dataone.org/cn/v1/query/solr/?fl=title,abstract,attribute&q=identifier:';
dq='"';

id=$1;
# encrypted_id=`/usr/bin/python -c "import sys, urllib as ul;print ul.quote_plus(sys.argv[1])" $id`;

filename_clean=`echo $id | tr ':' '_' | tr -s '/' '_' `

url=$urlhead$dq$id$dq;

echo $url;
echo $filename_clean;

wget -O solr_metadata/$filename_clean $url
