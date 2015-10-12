# Purpose: The script will perform the following:
# 1) Read in the content from two different csv file that provide the following information:
#   -- Ground truth datasets that are relevant to specific query fragments.
#   -- Query results returned by SOLR for specific query fragments.
# 2) Filter the unwated query results based on the dataset IDs listed in the ground truth file. 
#   -- This removes any dataset IDs that are not in the correct format but exist in the CN-Sandbox2.
# 3) Merge the resulting datasets after being filtered and any additional relevant datsets that are in the ground truth file.
# 4) Calculate the precision and recall value based on the number of relevant datasets retrieved, the total number of relevant datasets, and number of irrelevant datasets retrieved.=

# Definitions:
# 1) Definition of Recall: A/(A+B), where A = # of relevant retrieved and B = # of relevant records NOT retrieved
# 2) Definition of Precision: A/(A+C), where A = # of relevant retrieved and C = # of irrelevant records retrieved

filter_merge_calculate_function <- function(gtFileLocation, outputFileLocation){
  
  # Example: 
  ## This example needs to be commented out during the full automatic test ##
  gtFileLocation <- '~/dataone/gitcheckout/semantic-query/lib/ground_truth/ground_truth_test.csv'
  
  groundTruthDF <- read.csv(gtFileLocation, header = T, sep = ",", stringsAsFactors = F)

  # Example: 
  ## This example needs to be commented out during the full automatic test ##
  outputFileLocation <- '~/dataone/gitcheckout/semantic-query/results/Resultset_Summary_2015-10-12 15:31:55_.csv'
  
  queryResultDF <- read.csv(outputFileLocation, header = T, sep = ",", stringsAsFactors = F)
  
  filtered_result <- merge(groundTruthDF, queryResultDF, by='Dataset_ID')
  
  

##########################################################################################################################################################
## Everything below this line needs to be updated##  
  
  queryOfInterest <- which( colnames(groundTruthDF) == queryName )
  print("This is the query name")
  print(queryName)
  #print(queryOfInterest)
  counter <- table(groundTruthDF[queryOfInterest])
  totalRelevantRecords <- counter[names(counter)==1]
  print("This is the total relevant records")
  print(totalRelevantRecords)
  

  #Block of code that calculates the total number retrieved based on the query fragment selected
  numberRetrieved <- which( colnames(result) == 'QueryID')
  #print("This is the value for variable numberRetrieved")
  #print(numberRetrieved)
  counter2 <- table(result[numberRetrieved])
  #print("This is the value for variable counter2")
  #print(counter2)
  totalRecordsRetrieved <- counter2[names(counter2)== queryFragName]
  print("This is the total records retrieved for this fragment")
  print(totalRecordsRetrieved)
  
  if(length(totalRecordsRetrieved) == 0)
  {
    print("The query fragment did not yield any results.")
  }
  else{
    dataOfInterest <- which( colnames(result) == queryName )
    counter_2 <- table(result[dataOfInterest])
    
    A_relevantRetrieved <- counter_2[names(counter_2)==1]
    print("This is the value of A_relevantRetrieved")
    print(A_relevantRetrieved)
    
    B_releventNotRetrieved <- totalRelevantRecords - A_relevantRetrieved
    print("This is the value of B_relevantNotRetrieved")
    print(B_releventNotRetrieved)
    
    C_irrelevantRetrieved <- totalRecordsRetrieved - A_relevantRetrieved
    #C_irrelevantRetrieved <- nrow(result) - A_relevantRetrieved
    print("This is the value of C_irrelevantRetrieved")
    print(C_irrelevantRetrieved)
    
    #Recall <- (A_relevantRetrieved/(A_relevantRetrieved+B_releventNotRetrieved))*100
    #Precision <- A_relevantRetrieved/(A_relevantRetrieved+C_irrelevantRetrieved)*100
    
    #Alternative (simpler) calculations:
    Recall <- (A_relevantRetrieved/(totalRelevantRecords))*100
    Precision <- A_relevantRetrieved/(totalRecordsRetrieved)*100
    #Precision <- A_relevantRetrieved/(nrow(result))*100
    
    #print(Recall)
    #print(Precision)
    
    print(paste0("Recall for this query is: ", round(Recall, digit=2), "%"))
    print(paste0("Precision for this query is: ", round(Precision, digit=2), "%"))
  }
  return()
}
