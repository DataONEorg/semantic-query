# Purpose: This script defines the wrapper function that will pass the initial parameters to Query_Function.R and Filter_Merge_Calculate_Function.R,
#           so that Recall and Precision values could be calculated for each Query_ID and SOLR_INDEX_Type combination.

# Definitions:
# 1) Definition of Recall: A/(A+B), where A = # of relevant retrieved and B = # of relevant records NOT retrieved
# 2) Definition of Precision: A/(A+C), where A = # of relevant retrieved and C = # of irrelevant records retrieved

# Parameters need to be provided by the user to the wrapper:
# 1) queryFragFullFilePath = the full directory path where the query fragment file can be found.
# --> Ex: '~/dataone/gitcheckout/semantic-query/lib/queries/uc52_queries_all.csv'

# 2) gtFileLocation = the full directory path where the ground truth file can be found.
# --> Ex: '~/dataone/gitcheckout/semantic-query/lib/ground_truth/test_corpus_f_groundtruth_carbon_flux_queries.csv'

# 3) homePath = the home path where the semantic-query repository is set up.
# --> Ex: '~/dataone/gitcheckout/'

precision_recall_wrapper <- function(queryFragFullFilePath, gtFileLocation){
  queryFunctionLocation <- "src/Query_Function.R"
  stopifnot(file.exists(queryFunctionLocation))
  
  calculateFunctionLocation <- "src/Filter_Merge_Calculate_Function.R"
  stopifnot(file.exists(calculateFunctionLocation))
  
  print(queryFunctionLocation)
  print(calculateFunctionLocation)
  
  source(queryFunctionLocation)
  source(calculateFunctionLocation)
  
  outputFileLocation <- query_function(queryFragFullFilePath)
  finaloutputFileLocation <- filter_merge_calculate_function(gtFileLocation, outputFileLocation)
  
  print("The precision and recall calculations can be found in the following file:")
  print(finaloutputFileLocation)
}
