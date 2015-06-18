# Purpose: The script will perform the following:
# 1) Read in the content from two different csv file.
# 2) Create a new table based on the same ID values from the two csv files.

# Definitions:
# 1) Definition of Recall: A/(A+B), where A = # of relevant retrieved and B = # of relevant records NOT retrieved
# 2) Definition of Precision: A/(A+C), where A = # of relevant retrieved and C = # of irrelevant records retrieved

CompareCSV_function <- function(gtFilePath, gtFileName, outputFileLocation){
  
  groundTruthFilePath <- paste0(gtFilePath, gtFileName)
  #print(groundTruthFilePath)
  ##groundTruthDF <- read.csv("test_corpus_c_groundtruth_carbon_flux_queries.csv", header = T, sep = ",", stringsAsFactors = F)
  groundTruthDF <- read.csv(groundTruthFilePath, header = T, sep = ",", stringsAsFactors = F)
  totalRelevantRecords <- nrow(groundTruthDF)

  queryLocation <- outputFileLocation
  print(queryLocation)
  #queryResultDF <- read.csv("query-results-run-1-out.csv", header = T, sep = ",", stringsAsFactors = F)
  queryResultDF <- read.csv(outputFileLocation, header = T, sep = ",", stringsAsFactors = F)
  totalQueryResult <- nrow(queryResultDF)

  result <- merge(groundTruthDF, queryResultDF, by='id')

  A_relevantRetrieved <- nrow(result)
  B_releventNotRetrieved <- totalRelevantRecords - relevantRetrieved
  C_irrelevantRetrieved <- totalQueryResult - relevantRetrieved

  Recall <- (A_relevantRetrieved/(A_relevantRetrieved+B_releventNotRetrieved))*100
  Precision <- A_relevantRetrieved/(A_relevantRetrieved+C_irrelevantRetrieved)*100

  print(paste0("Recall for this query is: ", round(Recall, digit=2), "%"))
  print(paste0("Precision for this query is: ", round(Precision, digit=2), "%"))
  
  return()
}
