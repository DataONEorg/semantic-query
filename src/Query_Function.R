# Purpose: The script will perform the following:
# 1) Read in a pre-deteremined group of query fragements from a .csv file with the following characteristics:
#     -- File name: Example - "uc52_queries_all.csv".
#     -- File Path: Provided by the user as 1 of the 3 input parameters to this function.
#     -- File Structure: The first row is the header and the order of the header is as follows:
#       -- Query_ID, SOLR_Index_Type, Query_Frag, Ontology_Set_ID
#
# 2) Sequentially submit the query fragements as SOLR queries using the query() function.
# 3) Accumulate the results in a data frame, and write the results to an output file.

# Note:
# 1) The output of function is set up to be written to the following directory: '/semantic-query/results/Resultset_Summary'

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
  #queryFragFullFilePath <- '~/dataone/gitcheckout/semantic-query/lib/queries/uc52_queries_all.csv'
  
  
  # Commented out because this line of code is unncessary
  #queryFragmentFileDirectory <- queryFragFullFilePath
  #print(queryFragmentFileDirectory)
  
  # 4) Defining the entry for "Run_Group"
  runGroup <- Sys.time()
  #print(runGroup)
  
  #Read in the query fragments from the input CSV file
  queryFragment <- read.csv(queryFragFullFilePath, quote = "", stringsAsFactors = FALSE)
  stopifnot(nrow(queryFragment) > 0)
  stopifnot(all(c("Query_ID", 
                  "SOLR_Index_Type", 
                  "Query_Frag", 
                  "Ontology_Set_ID") %in% names(queryFragment)))
  
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
    query_all_pages <- function(cn, params) {
        if (!("rows" %in% params)) params[["rows"]] <- "1000"
        if (!("fl" %in% params)) params[["fl"]] <- "id"
        params[["start"]] <- "0"
        
        # print(params)
        result <- query(cn, params, as = "data.frame", parse = TRUE)
        all_pages <- result
        
        while(nrow(result) >= 1000) {
            params[["start"]] <- as.character(as.numeric(params[["start"]]) + as.numeric(params[["rows"]]))
            # print(params)
            result <- query(cn, params, as = "data.frame", parse = TRUE)
            all_pages <- rbind(all_pages, result)
        }
        
        all_pages
    # Stop if there may be truncation of the results
    if (nrow(result) >= rowsOfResult) {
        stop(paste0("The maximum number of rows were returned in the last query,\n\n\t",
                    queryString, "\n\nIt's possible the results were truncated and this will impact the calculation of precision and recall."))
    }
    
    result <- query_all_pages(cn, queryParamList)
    #str(result)
    
    if (!is.null(result) & length(result) > 0) {
      result$R_Time <- Sys.Date()
      result$D1_node <- "urn:node:cnSandbox2"
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
  
  #outputFilePath <- '~/dataone/gitcheckout/semantic-query/results/Resultset_Summary'
  outputFilePath <- "results/Resultset_Summary"
  
  # Write out the results as a CSV file using a filename linked to the runGroup
  write.csv(df, paste(outputFilePath, runGroup, ".csv", sep = '_'), row.names=F)
  outputFileLocation <- paste(outputFilePath, runGroup, ".csv", sep = '_')
  
  print("The query results can be found in the following file:")
  print(outputFileLocation)
  
  return(outputFileLocation)
}
