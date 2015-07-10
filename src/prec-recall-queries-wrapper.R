# Purpose: This script defines the wrapper function that will be used to -
# 1) Set the necessary parameters/conditions to perform a SOLR query based on a specific science question.
# 2) Compare the query results with the ground truth.
# 3) Calculate the values of recall and precision accordingly.

# Definitions:
# 1) Definition of Recall: A/(A+B), where A = # of relevant retrieved and B = # of relevant records NOT retrieved
# 2) Definition of Precision: A/(A+C), where A = # of relevant retrieved and C = # of irrelevant records retrieved

# Parameters for the functions:
## For prec-recall_function.R
# 1) testEnv = the environment where the query will be performed.
# --> Ex: 'CNode("SANDBOX2")'
## Note: This is currently not used.
# 2) numOfRows = the number rows of results that should be returned by the query.
# --> Ex: '1000'
# 3) queryFragFilePath = the full directory path where the query fragment file can be found.
# --> Ex: '~/dataone/gitcheckout/semantic-query/lib/queries/'
# 4) queryFragFileName = the file name that contains the query fragments of interest.
# --> Ex: 'uc52_query_frags_best_SOLR.csv'
# 5) runGroupNumber = the identification for the query run.
# --> Ex: '1'

## For CompareCSV_function.R
# 6) outputFilePath = the full directory path where the query result should be written to.
# --> Ex: '~/dataone/gitcheckout/semantic-query/results/query-results-run'
# 7) gtFilePath = the full directory path where the ground truth file can be found.
# --> Ex: '~/dataone/gitcheckout/semantic-query/lib/ground_truth/'
# 8) gtFileName = the file name that contains the ground truth of interest.
# --> Ex: 'test_corpus_c_groundtruth_carbon_flux_queries.csv'
# 9) queryName = the query question we are investigating
# --> Ex: 'Q4'
#10) queryFragName = the query fragement that we are calculating the recall and precision for

prec_recall_wrapper <- function(numOfRows, queryFragFilePath, queryFragFileName, runGroupNumber, outputFilePath, gtFilePath, gtFileName, queryName, queryFragName){
  
  #print(testEnv)
  #prec_recall_function(numOfRows, queryFragFilePath, queryFragFileName, runGroupNumber, outputFilePath)
  outputFileLocation <- prec_recall_function(numOfRows, queryFragFilePath, queryFragFileName, runGroupNumber, outputFilePath)
  #print(outputFileLocation)
  
  CompareCSV_function(gtFilePath, gtFileName, outputFileLocation, queryName, queryFragName)
  
  return()
  
}
