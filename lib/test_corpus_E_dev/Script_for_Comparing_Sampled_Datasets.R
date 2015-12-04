# Purpose: This script defines a function that will be able to perform the following
#          1) Receive two files paths for two "sampled_documents.csv" files resulted from running "sample-metadata.py".
#          2) Compare the second CSV file against the first CSV file provided and determine the unique dataset IDs that are in the second file but are not in the first file.
#          3) Output the dataset IDs both on screen as well as to a CSV file with file name: 'Unqiue_Dataset_IDs.csv' (the output file path is currently set to: ~/dataone/gitcheckout/semantic-query/lib/test_corpus_E_dev/result_TestForSophie/.

# Parameters need to be provided by the user to the function:
# 1) sampled_doc_1_FullFilePath = the full directory path where the first "sampled_documents.csv" file can be found.
# --> Ex: '~/dataone/gitcheckout/semantic-query/lib/test_corpus_E_dev/result_TestForSophie/sampled_documents_2perMN.csv'

# 2) sampled_doc_2_FullFilePath = the full directory path where the second "sampled_documents.csv" file can be found.
# --> Ex: '~/dataone/gitcheckout/semantic-query/lib/test_corpus_E_dev/result_TestForSophie/sampled_documents_4perMN.csv'


sampled_documents_comparison <- function(sampled_doc_1_FullFilePath, sampled_doc_2_FullFilePath){
  
  # Examples: 
  ## These examples need to be commented out during the full automatic test ##
  #sampled_doc_1_FullFilePath <- '~/dataone/gitcheckout/semantic-query/lib/test_corpus_E_dev/result_TestForSophie/sampled_documents_2perMN.csv'
  #sampled_doc_2_FullFilePath <- '~/dataone/gitcheckout/semantic-query/lib/test_corpus_E_dev/result_TestForSophie/sampled_documents_4perMN.csv'
  
  sdDF_1 <- read.csv(sampled_doc_1_FullFilePath, header = T, sep = ",", stringsAsFactors = F)
  sdDF_2 <- read.csv(sampled_doc_2_FullFilePath, header = T, sep = ",", stringsAsFactors = F)
  
  unique_datasets <- data.frame(sdDF_2$authoritativeMN[!sdDF_2$authoritativeMN %in% sdDF_1$authoritativeMN])
  colnames(unique_datasets) <- "ID"
  
  print(unique_datasets)
  write.csv(unique_datasets, '~/dataone/gitcheckout/semantic-query/lib/test_corpus_E_dev/result_TestForSophie/Unique_Dataset_IDs.csv')
  
 
  return()
  
}