DataONE Test Corpus Design
=====================================================

Use case 52 requires a set of queries for tests. 
--------------------------------------------------------------------------------

Revisions
---------
2015-07-07: this document created
2016-01-18: added info for manual annotation.

Goal
----
Develop queries for testing (Use case 52): 
https://github.com/DataONEorg/sem-prov-design/blob/master/docs/use-cases/semantics/use-case-52-Semantic-Search.rst



Guidelines
----------
* 10 queries,
* There must be test corpus data sets to math (correct return) each. 
* Several forms of each query, to compare different ways of quering
** metacat user interface.
** full use of solr indexed fields
** semantically annotaed


Query forms
------------------------
nat_lang 
The unambiguous text of the query, so that someone perfoming ground truth could (after examining a file and understanding it) say unequivically if a was a match or not.
example:
heterotrophic soil respiration as carbon dioxide flux in dimensions of (amount or mass) per (area or volume) per time

metacat_ui
What a metacat user might resonably be expected to type into the main search box in metacat
example:
heterotrophic soil respiration

metacat_filtered
Similar to metacat_ui, but what a user might type if s/he was planning to fiter with the faceted searches below the main search box
example:
soil AND (attribute:"respiration" AND (attribute:"carbon dioxide" OR attribute:CO2))

full_text
Best use of all the solr fields available. No metacat user is expected to construct a query like this, but it is included for completness
example:
(attribute:"soil respiration" AND (attribute:"carbon dioxide" OR attribute:CO2) AND (attribute:time)) AND (abstract:heterotrophic OR title:heterotrophic) AND (abstract:soil OR title:soil)

bioportal_annot
the ECSO class attached to this measurement
example:
sem_annotation_bioportal_sm:"http://purl.dataone.org/odo/ECSO_00000532"

esor_annot
the ECSO class attached to this measurement
example:
sem_annotation_esor_sm:"http://purl.dataone.org/odo/ECSO_00000532"

manual_annot
the ECSO class attached to this measurement
example:
sem_annotation:"http://purl.dataone.org/odo/ECSO_00000532"

Note that the ECSO field for the three annotation queries should be the same, but that the name of the indexed fields changes with the type.


Query file 
------------------------
The queries are found in a csv file so that they can be read into R-code. See semantic-query/src for code.
the fields of the query file:
Query_ID: q1 through q10
SOLR_Index_Type: one of the labels above
Query_Frag: the solr fragment that can be passed to a coordinating node
Ontology_Set_ID: reserved for later use.




Query file snippet
------------------------
...
q2,nat_lang,heterotrophic soil respiration as carbon dioxide flux in dimensions of (amount or mass) per (area or volume) per time,None
q2,metacat_ui,heterotrophic soil respiration,None
q2,metacat_filtered,soil AND (attribute:"respiration" AND (attribute:"carbon dioxide" OR attribute:CO2)),None
q2,full_text,(attribute:"soil respiration" AND (attribute:"carbon dioxide" OR attribute:CO2) AND (attribute:time)) AND (abstract:heterotrophic OR title:heterotrophic) AND (abstract:soil OR title:soil),None
q2,bioportal_annot,sem_annotation_bioportal_sm:"http://purl.dataone.org/odo/ECSO_00000532",None
q2,esor_annot,sem_annotation_esor_sm:"http://purl.dataone.org/odo/ECSO_00000532",None
q2,manual_annot,sem_annotation:"http://purl.dataone.org/odo/ECSO_00000532",None
...
