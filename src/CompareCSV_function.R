# Purpose: The script will perform the following:
# 1) Read in the content from two different csv file.
# 2) Create a new table based on the same ID values from the two csv files.

# Definitions:
# 1) Definition of Recall: A/(A+B), where A = # of relevant retrieved and B = # of relevant records NOT retrieved
# 2) Definition of Precision: A/(A+C), where A = # of relevant retrieved and C = # of irrelevant records retrieved

CompareCSV_function <- function(gtFilePath, gtFileName, outputFileLocation, queryName){
  
  groundTruthFilePath <- paste0(gtFilePath, gtFileName)
  #print(groundTruthFilePath)
  ##groundTruthDF <- read.csv("test_corpus_c_groundtruth_carbon_flux_queries.csv", header = T, sep = ",", stringsAsFactors = F)
  groundTruthDF <- read.csv(groundTruthFilePath, header = T, sep = ",", stringsAsFactors = F)
  #totalRelevantRecords <- nrow(groundTruthDF)
  #print(totalRelevantRecords)
  
  queryOfInterest <- which( colnames(groundTruthDF) == queryName )
  #print("This is the query name")
  #print(queryName)
  #print(queryOfInterest)
  counter <- table(groundTruthDF[queryOfInterest])
  totalRelevantRecords <- counter[names(counter)==1]
  print("This is the total relevant records")
  print(totalRelevantRecords)
  
  queryLocation <- outputFileLocation
  #print(queryLocation)
  #queryResultDF <- read.csv("query-results-run-1-out.csv", header = T, sep = ",", stringsAsFactors = F)
  queryResultDF <- read.csv(outputFileLocation, header = T, sep = ",", stringsAsFactors = F)
  #totalQueryResult <- nrow(queryResultDF)
  #print(totalQueryResult)

  result <- merge(groundTruthDF, queryResultDF, by='id')
  #print(result)
  
  dataOfInterest <- which( colnames(result) == queryName )
  counter_2 <- table(result[dataOfInterest])
  
  A_relevantRetrieved <- counter_2[names(counter_2)==1]
  print("This is the value of A_relevantRetrieved")
  print(A_relevantRetrieved)
  
  B_releventNotRetrieved <- totalRelevantRecords - A_relevantRetrieved
  print("This is the value of B_relevantNotRetrieved")
  print(B_releventNotRetrieved)
  
  C_irrelevantRetrieved <- nrow(result) - A_relevantRetrieved
  print("This is the value of C_irrelevantRetrieved")
  print(C_irrelevantRetrieved)
  
  #Recall <- (A_relevantRetrieved/(A_relevantRetrieved+B_releventNotRetrieved))*100
  #Precision <- A_relevantRetrieved/(A_relevantRetrieved+C_irrelevantRetrieved)*100
  
  #Alternative (simpler) calculations:
  Recall <- (A_relevantRetrieved/(totalRelevantRecords))*100
  Precision <- A_relevantRetrieved/(nrow(result))*100

  #print(Recall)
  #print(Precision)

  print(paste0("Recall for this query is: ", round(Recall, digit=2), "%"))
  print(paste0("Precision for this query is: ", round(Precision, digit=2), "%"))
  
  return()
}
