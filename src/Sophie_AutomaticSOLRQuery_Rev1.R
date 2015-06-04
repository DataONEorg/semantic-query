# Purpose: The script will perform the following:
# 1) Read in a pre-deteremined group of query fragements from a .txt or .csv file.
# 2) Sequentially submit the query fragements as SOLR queries using the query() function

# Note: 
# 1) The script assumes the .txt/.csv file's first row is the header row and the first column is reserved to labels.
#    i.e the query fragments start on Row 2 and Column 2.  

library(dataone)
cn <- CNode("SANDBOX2")

#The following lines read in the query fragments.
#queryFragment <- read.table("test.txt", header = T, sep = "\t")
#queryFragment <- read.csv("test.csv", header = T, sep = ",")

queryFragment <- read.csv("uc52_query_frags_best_SOLR.csv", header = T, sep = ",", stringsAsFactors = F)
#queryFragment <- read.csv("uc52_query_frags_best_SOLR_2.csv", header = T, sep = ",", stringsAsFactors = F)
#queryFragment <- read.csv("uc52_query_frags_20150508.csv", header = T, sep = ",")

rowNumber <- nrow(queryFragment)
#The next 2 lines are for debugging purpose:
#print("This is the number of rows:")
#print(rowNumber)

colNumber <- ncol(queryFragment)
#The next 2 lines are for debugging purpose:
#print("This is the number of columns:")
#print(colNumber)

#The next 2 lines are for debugging purpose:
#print(queryFragment[1, colNumber])
#print(queryFragment[2, colNumber])

for (n in 1:rowNumber)
#The next line is for debugging purpose:
#for (n in 1:1)
{
  queryString <- queryFragment[n, colNumber]
  #queryString <- paste("text:", queryFragment[n, colNumber])
  #queryString <- queryFragment[3, colNumber]
  print("This is the queryString")
  print(queryString)
  
  #queryParamList <- list(q=queryString, rows="2", fq="abstract:chlorophyll", fl="id,title,author")
  queryParamList <- list(q=queryString, rows="2", fl="id,title,author")
  #print(queryParamList)
  result <- query(cn, queryParamList, as="data.frame", parse=FALSE)
  
  print(result)
  #str(result)
}


######################################################
#This is the area where I use to debug query fragments

library(dataone)
cn <- CNode("SANDBOX2")

#Query 1
#queryString <-"(attribute:\"*production\" OR attribute:\"productivity\" AND attribute:milligramPerMeterCubedPerDay) AND (abstract:phytoplankton OR title:phytoplankton) AND (abstract:carbon14 OR methods:carbon14)"
queryString <-"(attribute:\"*production\" OR attribute:\"productivity\" AND attribute:milligramPerMeterCubedPerDay) AND (abstract:phytoplankton OR title:phytoplankton) AND (abstract:carbon14)"
queryParamList <- list(q=queryString, rows="2", fl="id,title,author")
result <- query(cn, queryParamList, as="data.frame", parse=FALSE)
print(result)

#Query 2
queryString <- "attribute:\"*production\" OR attribute:\"productivity\" AND (abstract:phytoplankton OR title:phytoplankton)"
queryParamList <- list(q=queryString, rows="2", fl="id,title,author")
result <- query(cn, queryParamList, as="data.frame", parse=FALSE)
print(result)

#Query 3
#queryString <- "attribute:\"*carbonate\" OR attribute:\"CO2\" OR attribute:\"carbon dioxide\" AND units:micromolePerKilogram AND (abstract:ocean OR title:ocean) AND (abstract:co2calc OR methods:co2calc)"
queryString <- "attribute:\"*carbonate\" OR attribute:\"CO2\" OR attribute:\"carbon dioxide\" AND units:micromolePerKilogram AND (abstract:ocean OR title:ocean) AND (abstract:co2calc)"
queryParamList <- list(q=queryString, rows="2", fl="id,title,author")
result <- query(cn, queryParamList, as="data.frame", parse=FALSE)
print(result)









