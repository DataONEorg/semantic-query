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
    
    # Get a CNode instance set up for cn-sandbox-2
    cn <- CNode("SANDBOX2")
    
    # 2) Number of results requested from SOLR:
    rowsOfResult <- 1000
    
    # Generate a run identifier using the current UTC time. We'll use this later
    # on when we save this identifier with our results
    systime <- Sys.time()
    attr(systime, "tzone") <- "UTC"
    runGroup <- format(Sys.time(), "%Y-%m-%d_%H-%M-%S_Z")
    
    #Read in the query fragments from the input CSV file
    queryFragment <- read.csv(queryFragFullFilePath, quote = "", stringsAsFactors = FALSE)
    stopifnot(nrow(queryFragment) > 0)
    stopifnot(all(c("Query_ID", 
                    "SOLR_Index_Type", 
                    "Query_Frag", 
                    "Ontology_Set_ID") %in% names(queryFragment)))
    
    
    # Set up a data frame for later rbinding of individual query results
    results <- data.frame()
    
    for (n in seq_len(nrow(queryFragment))) {
        queryid <- queryFragment[n,"Query_ID"]
        querytype <- queryFragment[n,"SOLR_Index_Type"]
        queryString <- queryFragment[n, "Query_Frag"]
        queryOntology <- queryFragment[n, "Ontology_Set_ID"]
        
        queryParamList <- list(q = queryString, rows = as.character(rowsOfResult), fl = "id")
        
        # Append filter to only find documents in test corpus F
        queryParamList[["q"]] <- paste0(queryParamList[["q"]], "+test_corpus_sm:F")
        
        # Run the query
        result <- query(cn, queryParamList, as = "data.frame", parse = TRUE)
        
        # Stop if there may be truncation of the results
        if (nrow(result) >= rowsOfResult) {
            stop(paste0("The maximum number of rows were returned in the last query,\n\n\t",
                        queryString, "\n\nIt's possible the results were truncated and this will impact the calculation of precision and recall."))
        }
        
        if (!is.null(result) & length(result) > 0) {
            result$R_Time <- Sys.Date()
            result$D1_node <- "urn:node:cnSandbox2"
            result$Query_ID <- queryid
            result$SOLR_Index_Type <- querytype
            result$Run_ID <- runGroup
            result$Ontology_Set_ID <- queryOntology
            
            # Add the result rows to our accumulated data frame
            results <- rbind(results, result)
        }
    }
    
    #Change the first column header from "id" to "Dataset_ID"
    names(results)[1] <- "Dataset_ID"
    
    outputFilePath <- "results/Resultset_Summary"
    
    # Write out the results as a CSV file using a filename linked to the runGroup
    outputFileLocation <- paste(outputFilePath, runGroup, ".csv", sep = '_')
    write.csv(results, outputFileLocation, row.names = FALSE)
    
    print(paste0("The query results can be found at ", outputFileLocation))

    return(outputFileLocation)
}
