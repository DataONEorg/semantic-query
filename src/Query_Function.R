# Purpose: The script will perform the following:
# 1) Read in a pre-deteremined group of query fragements from a .csv file.
# 2) Sequentially submit the query fragements as SOLR queries using the query() function.
# 3) Accumulate the results in a data frame, and write the results to an output file.

# Note:
# 1) The script assumes the .csv file's first row is the header and the order of the header is as follows:
#    Query_ID, SOLR_Index_Type, Query_Frag

library(dataone)

query_function <- function(queryFragFullFilePath, outputFilePath){

  
  #Setting the Initial Conditions:
  # 1) Testing environment:
  cn <- CNode("SANDBOX2")
  #print(cn)
  
  # 2) Number of results requested from SOLR:
  rowsOfResult <- 1000
  print(rowsOfResult)
  
  # 3) Directory location for the query fragment file:
  # Example: 
  queryFragFullFilePath <- '~/dataone/gitcheckout/semantic-query/lib/queries/uc52_queries_all_test.csv'
  queryFragmentFileDirectory <- queryFragFullFilePath
  print(queryFragmentFileDirectory)

  # 4) Defining the entry for "Run_Group"
  # Example: runGroup <- "1"
  runGroup <- Sys.time()
  print(runGroup)
  
  queryFragment <- read.csv(queryFragmentFileDirectory, header = T, sep = ",", quote="", stringsAsFactors = F)
  print(queryFragment)
  
  # Initialize an output data frame with the proper columns
  df <- data.frame(R_Time = character(0), D1_node = character(0), Query_ID = character(0), SOLR_Index_Type = character(0), Run_ID = character(0), Ontology_Set_ID = character(0), Dataset_ID = character(0), 
                   stringsAsFactors = FALSE)
  
  #for (n in 1:nrow(queryFragment)) {
  
    n <- 1
    
    queryid <- queryFragment[n,1]
    querytype <- queryFragment[n,2]
    queryString <- queryFragment[n, 3]
    print(paste0("Running query (", queryid, "): ", queryString))
    
    queryParamList <-
      list(q = queryString, rows = as.character(rowsOfResult), fl = "id")
    
    str(cn)
    
    # Execute the query, and add in the classification columns
    result <- query(cn, queryParamList, as = "data.frame", parse = FALSE)
    str(result)
    
    if (!is.null(result) & length(result) > 0) {
      result$Run_ID <- runGroup
      result$Query_ID <- queryid
      
      # Add the result rows to our accumulated data frame
      df <- rbind(df, result)
    }
  #}
  
  # Write out the results as a CSV file using a filename linked to the runGroup
  write.csv(df, paste(outputFilePath, runGroup, "out_test.csv", sep = '-'), row.names=F)
  
  outputFileLocation = paste(outputFilePath, runGroup, "Resultset_Summary.csv", sep = '_')
  return(outputFileLocation)
}
