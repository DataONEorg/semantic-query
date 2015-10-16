# Purpose: This script defines the wrapper function that will pass the initial parameters to Query_Function.R and Filter_Merge_Calculate_Function.R,
#           so that Recall and Precision values could be calculated for each Query_ID and SOLR_INDEX_Type combination.

# Definitions:
# 1) Definition of Recall: A/(A+B), where A = # of relevant retrieved and B = # of relevant records NOT retrieved
# 2) Definition of Precision: A/(A+C), where A = # of relevant retrieved and C = # of irrelevant records retrieved

# Parameters need to be provided by the user to the wrapper:
# 1) queryFragFullFilePath = the full directory path where the query fragment file can be found.
# --> Ex: '~/dataone/gitcheckout/semantic-query/lib/queries/uc52_queries_all_test.csv'

# 2) gtFileLocation = the full directory path where the ground truth file can be found.
# --> Ex: '~/dataone/gitcheckout/semantic-query/lib/ground_truth/ground_truth_test.csv'


precicison_recall_wrapper <- function(queryFragFullFilePath, gtFileLocation){
  
  source('~/dataone/gitcheckout/semantic-query/src/Query_Function.R')
  source('~/dataone/gitcheckout/semantic-query/src/Filter_Merge_Calculate_Function.R')

  outputFileLocation <- query_function(queryFragFullFilePath)
  
  filter_merge_calculate_function(gtFileLocation, outputFileLocation)
  
  print("The precision and recall calculations can be found in the following file: '~/dataone/gitcheckout/semantic-query/results/Prec_Recall_Results.txt'")
  
  return()
  
}
