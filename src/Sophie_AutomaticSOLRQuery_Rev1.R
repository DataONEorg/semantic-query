# Purpose: The script will perform the following:
# 1) Read in a pre-deteremined group of query fragements from a .txt or .csv file.
# 2) Sequentially submit the query fragements as SOLR queries using the query() function

# Note: 
# 1) The script assumes the .txt/.csv file's first row is the header row and the first column is reserved to labels.
#    i.e the query fragments start on Row 2 and Column 2.  

library(dataone)

#Initial conditions that might be automated 
# 1) Setting the testing environment
cn <- CNode("SANDBOX2")
# 2) Selecting the number of results we would like to return from SOLR
rowsOfResult <- "5"
# 3) Defining the entried for "Run_Group" 
runGroup <- "1"


queryFragment <- read.csv("uc52_query_frags_best_SOLR.csv", header = T, sep = ",", stringsAsFactors = F)
#queryFragment <- read.csv("uc52_query_frags_best_SOLR_2.csv", header = T, sep = ",", stringsAsFactors = F)

#Finding the number of query Fragments there are from the read csv file
rowNumber <- nrow(queryFragment)
colNumber <- ncol(queryFragment)

#Initialize an output data frame
rowsOfResultNum <- as.numeric(rowsOfResult) * rowNumber
df <- data.frame(Run_Group = character(rowsOfResultNum), QueryID = character(rowsOfResultNum), DataID=character(rowsOfResultNum), WasHit=character(rowsOfResultNum), stringsAsFactors = FALSE)

rowCounter <- 0

for (n in 1:rowNumber)
{
  queryString <- queryFragment[n, colNumber]
  print("This is the queryString")
  print(queryString)
  
  queryParamList <- list(q=queryString, rows=rowsOfResult, fl="id,title,author")
  result <- query(cn, queryParamList, as="data.frame", parse=FALSE)
  
  print(result)
  #str(result)
  
  if(class(result)=="NULL"){
    for(i in 1:as.numeric(rowsOfResult)){
      df$Run_Group[rowCounter + i] <- runGroup
      df$QueryID[rowCounter + i] <- queryString
      df$DataID[rowCounter + i] <- "NULL"
      df$WasHit[rowCounter + i] <- "NULL"
      
    }
    rowCounter <- rowCounter + as.numeric(rowsOfResult)
  }else{  
    for(i in 1:as.numeric(rowsOfResult)){
      df$Run_Group[rowCounter + i] <- runGroup
      df$QueryID[rowCounter + i] <- queryString
      df$DataID[rowCounter + i] <- result$id[i]
      df$WasHit[rowCounter + i] <- "T"
    }
    rowCounter <- rowCounter + as.numeric(rowsOfResult)
  }
}

#print(df)

write.csv(df, "TestOutput.csv")
