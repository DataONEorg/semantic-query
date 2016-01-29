DataONE Test Corpus Design
=====================================================

Use case 52 requires controlled sets of datasets (test corpora) for query tests. 
--------------------------------------------------------------------------------

Revisions
---------
2015-07-07: this document created


Goal
----
Develop test corpora to be used for query testing (Use case 52): 
https://github.com/DataONEorg/sem-prov-design/blob/master/docs/use-cases/semantics/use-case-52-Semantic-Search.rst



Guidelines
----------
* For each test corpus, we must know which query or queries it should match to.
* Test corpora are constructed from datasets that have been examined. 
* Each corpus (starting with C) will 
** build on the earlier one, eg, corpus_D is corpus_C plus more datasets.
** match additional queries
** have ground truth completed


Test Corpus Descriptions
------------------------
**Test Corpus C**:
Used only to develop query code in R. Corpus C is all the datasets from SBC LTER
that were in cn-sandbox-2 in March 2015.  
There are matches to 4 queries: 4, 5, 9 10. By choosing all datasets, we know there are
datasets that match some queries (but not all), and also datasets that match
no queries. We will us this corpus only to test query code in R.

**Test Corpus D**:
This is the first "real" test corpus. It includes all datasets from 4 LTER sites, 2 aquatic
and 2 forested sites. There are expected to be datasets that match at least half the queries. 

**Test Corpus E:**
departure for previous plan. DataONE leadership wants a test corpus that is representative of holdings in the production DataONE repository. LTER datasets are not representative, in that they are all EML, and have generally high-quality metadata. 

Test Corpus E will be assembled from a random selection of all datasets in DataONE. 



Test Corpus Summary.


+----------+------------------------------------------------------------------------+------------------------------------------------------------+
| Name     | Composition                                                            |Usage                                                       |
+==========+========================================================================+============================================================+
| Corpus A |N.A.                                                                    | preliminary use, see issue #46                             |
+----------+------------------------------------------------------------------------+------------------------------------------------------------+
| Corpus B |N.A.                                                                    | preliminary use, see issue #46                             |
+----------+------------------------------------------------------------------------+------------------------------------------------------------+
| Corpus C | SBC LTER, all                                                          | query code development only. has ground truth complete     |
+----------+------------------------------------------------------------------------+------------------------------------------------------------+
| Corpus D | SBC, NTL, AND, BNZ - all datasets                                      | matches queries 1, 4, 5, 9, 10, 2, 6, (with ground truth)  |
+----------+------------------------------------------------------------------------+------------------------------------------------------------+
| Corpus E | random subsample of D1, production, with attribute-level metadata      | matches all queries                                        |
+----------+------------------------------------------------------------------------+------------------------------------------------------------+
| Corpus F | Corpus E, datasets in EML namespace                                    | matches all queries                                        |
+----------+------------------------------------------------------------------------+------------------------------------------------------------+
| Corpus G | TBD                                                                    | TBD                                                        |
+----------+------------------------------------------------------------------------+------------------------------------------------------------+

