The file with manual annotations is: annotations_man_priority1.tsv

This dir will accumulate other annotation files (e.g/, for priority 2, and 3).The final product will move when complete, location in /lib/,  TBD.

---------
General features:
generated from a spreadsheet. See below for spreadsheet notes.
should have all the features necessary to generate an annotation for the metacat UI.

Columns:
     1  mm 
     2  pkg_id
     3  ent_no 
     4  attr_no 
     5  class_id_int
     
Cols 2-4 originated in Ben's template (annotator_spreadsheet_template.txt)
Col 1: added by margaret for summary stats.

Col 5: the integer part of the ECSO class. recording only the integer is the fastest way to enter class ids manually. 


Head:
mn      pkg_id  ent_no  attr_no class_id_int
urn:node:LTER   https://pasta.lternet.edu/package/metadata/eml/ecotrends/3114/2 1       1       519
urn:node:LTER   https://pasta.lternet.edu/package/metadata/eml/ecotrends/3114/2 1       2
urn:node:LTER   https://pasta.lternet.edu/package/metadata/eml/ecotrends/3114/2 1       3       513
urn:node:LTER   https://pasta.lternet.edu/package/metadata/eml/ecotrends/3114/2 1       4       513

Note: many lines are not yet annotated, e.g, data line 2.

--------
To construct full class id:
1. 0-pad the class_id_int to an 8-column string, and prefix the "ECSO_" fragment.
2. prefix the URI head, "http://purl.dataone.org/odo/"

e.g., the integer "543" becomes
http://purl.dataone.org/odo/ECSO_00000543


--------
Spreadsheet notes:
Location:
https://docs.google.com/spreadsheets/d/1Gsl3Ioyv-ldxomxOwhShdcP4VDkVnnjV3nNrJQJ3txE/edit#gid=693954852

Sharing settings:
viewable by anyone with the link, only 3 people can edit (Margaret, Mark, Sophie).

Creation:
See "how_to_prep_manual_annotations.txt"

Content:
     1  mn
     2  pkg_id
     3  ent_no
     4  attr_no
     5  namespace
     6  class_id_int
     7  attr
     8  annotation_ note
