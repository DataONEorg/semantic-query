# Purpose: The script will perform the following:
# 1) Read in a pre-deteremined group of query fragements from a .csv file with the following characteristics:
#     -- File name: "uc52_queries_all.csv".
#     -- File Path: Provided by the user as 1 of the 2 input parameters to this function.
#     -- File Structure: The first row is the header and the order of the header is as follows:
#       -- Query_ID, SOLR_Index_Type, Query_Frag, Ontology_Set_ID
#
# 2) Sequentially submit the query fragements as SOLR queries using the query() function.
# 3) Accumulate the results in a data frame, and write the results to an output file.

# Note:
# 1) The output of function is set up to be written to the following directory: '~/dataone/gitcheckout/semantic-query/results/Resultset_Summary'

query_function <- function(queryFragFullFilePath){
  
  library(dataone)
  
  #Setting the Initial Conditions:
  # The initial conditions are set using 4 different variables: cn, rowsOfResult, queryFragmentFileDirectory, runGroup
  
  # 1) Testing environment:
  cn <- CNode("SANDBOX2")
  #print(cn)
  
  # 2) Number of results requested from SOLR:
  rowsOfResult <- 1000
  #print(rowsOfResult)
  
  # 3) Directory location for the query fragment file:
  # Example: 
  ## This example needs to be commented out during the full automatic test ##
  #queryFragFullFilePath <- '~/dataone/gitcheckout/semantic-query/lib/queries/uc52_queries_all_test.csv'
  
  
  queryFragmentFileDirectory <- queryFragFullFilePath
  #print(queryFragmentFileDirectory)

  # 4) Defining the entry for "Run_Group"
  runGroup <- Sys.time()
  #print(runGroup)
  
  #Read in the query fragments from the input CSV file
  queryFragment <- read.csv(queryFragmentFileDirectory, header = T, sep = ",", quote="", stringsAsFactors = F)
  #print(queryFragment)
  
  # Initialize an output data frame with the proper columns
  df <- data.frame(R_Time = character(0), D1_node = character(0), Query_ID = character(0), SOLR_Index_Type = character(0), Run_ID = character(0), Ontology_Set_ID = character(0), 
                   stringsAsFactors = FALSE)
  
  #For each query fragment in the CSV file, submit the query fragment to SOLR and record up to 1000 returned results as a data frame
  
  for (n in 1:nrow(queryFragment)) {
  
    #n <- 2
    
    queryid <- queryFragment[n,1]
    querytype <- queryFragment[n,2]
    queryString <- queryFragment[n, 3]
    queryOntology <- queryFragment[n, 4]
    #print(paste0("Running query (", queryid, "): ", queryString))
    
    queryParamList <-
      list(q = queryString, rows = as.character(rowsOfResult), fl = "id")
    
    #str(queryParamList)
    
    # Execute the query, and add in the classification columns
    result <- query(cn, queryParamList, as = "data.frame", parse = TRUE)
    #str(result)
    
    if (!is.null(result) & length(result) > 0) {
      result$R_Time <- Sys.Date()
      result$D1_node <- "CN-Sanbox2"
      result$Query_ID <- queryid
      result$SOLR_Index_Type <- querytype
      result$Run_ID <- runGroup
      result$Ontology_Set_ID <- queryOntology
      
      # Add the result rows to our accumulated data frame
      df <- rbind(df, result)
      
    }
  }
  
  #Change the first column header from "id" to "Dataset_ID"
  names(df)[1] <- "Dataset_ID"
  
  outputFilePath <- '~/dataone/gitcheckout/semantic-query/results/Resultset_Summary'
  
  # Write out the results as a CSV file using a filename linked to the runGroup
  write.csv(df, paste(outputFilePath, runGroup, ".csv", sep = '_'), row.names=F)
  
  outputFileLocation = paste(outputFilePath, runGroup, ".csv", sep = '_')
  print(outputFileLocation)
  
  return(outputFileLocation)
}
