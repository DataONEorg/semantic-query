# Purpose: The script will perform the following:
# 1) Read in a pre-deteremined group of query fragements from a .txt or .csv file.
# 2) Sequentially submit the query fragements as SOLR queries using the query() function
# 3) accumulate the results in a data frame, and write the results to disk

# Note:
# 1) The script assumes the .txt/.csv file's first row is the header row and the first column is the query identifier.
#    i.e the query fragments start on Row 2

prec_recall_function <- function(numOfRows, queryFragFilePath, queryFragFileName, runGroupNumber, outputFilePath){
  library(dataone)

  #Setting the Initial Conditions:
  # 1) Testing environment:
  cn <- CNode("SANDBOX2")
  #cn <- testEnv
  
  # 2) Number of results returned from SOLR:
  # was: rowsOfResult <- "1000"
  rowsOfResult <- numOfRows
  # 3) Query Fragment File Path:
  # was: ~/dataone/gitcheckout/semantic-query/lib/queries/
  queryFragmentFileDirectory <- queryFragFilePath
  # 4) Query Fragment File Name:
  # was: uc52_query_frags_best_SOLR.csv
  queryFragmentFileName <- queryFragFileName
  # 5) Defining the entried for "Run_Group"
  # was: runGroup <- "1"
  runGroup <- runGroupNumber

  #queryFragment <- read.csv(
  #      "./lib/queries/uc52_query_frags_best_SOLR.csv", header = T, sep = ",", stringsAsFactors = F)
  #queryFragmentFilePath <- paste0("./lib/queries/", queryFragmentFileName)
  queryFragmentFilePath <- paste0(queryFragmentFileDirectory, queryFragmentFileName)
  print(queryFragmentFilePath)
  queryFragment <- read.csv(queryFragmentFilePath, header = T, sep = ",", stringsAsFactors = F)
  
  # Initialize an output data frame with the proper columns
  df <- data.frame(id = character(0), Run_Group = character(0), QueryID = character(0),
                 WasHit = as.logical(), stringsAsFactors = FALSE)
  for (n in 1:nrow(queryFragment)) {
      queryid <- queryFragment[n,1]
      queryString <- queryFragment[n, 2]
      print(paste0("Running query (", queryid, "): ", queryString))
      queryParamList <-
          list(q = queryString, rows = rowsOfResult, fl = "id")
    
      # Execute the query, and add in the classification columns
      result <- query(cn, queryParamList, as = "data.frame", parse = FALSE)
      if (!is.null(result) & length(result) > 0) {
          result$Run_Group <- runGroup
          result$QueryID <- queryid
          result$WasHit <- TRUE
        
          # Add the result rows to our accumulated data frame
         df <- rbind(df, result)
      }
  }

  #print(df)

  # Write out the results as a CSV file using a filename linked to the runGroup
  #write.csv(df, paste("~/dataone/gitcheckout/semantic-query/results/query-results-run", runGroup, "out_test.csv", sep = '-'), row.names=F)
  write.csv(df, paste(outputFilePath, runGroup, "out_test.csv", sep = '-'), row.names=F)
  
  outputFileLocation = paste(outputFilePath, runGroup, "out_test.csv", sep = '-')
  return(outputFileLocation)
}

