# Purpose: The script will perform the following:
# 1) Read in the content from two different csv file that provide the following information:
#   -- Ground truth datasets that are relevant to specific query fragments.
#   -- Query results returned by SOLR for specific query fragments.
# 2) Filter the unwated query results based on the dataset IDs listed in the ground truth file. 
#   -- This removes any dataset IDs that are not in the correct format but exist in the CN-Sandbox2.
# 3) Merge the resulting datasets after being filtered and any additional relevant datsets that are in the ground truth file.
# 4) Calculate the precision and recall value based on the number of relevant datasets retrieved, the total number of relevant datasets, and number of irrelevant datasets retrieved.

# Definitions:
# 1) Definition of Recall: A/(A+B), where A = # of relevant retrieved and B = # of relevant records NOT retrieved
# 2) Definition of Precision: A/(A+C), where A = # of relevant retrieved and C = # of irrelevant records retrieved

# Note:
# 1) The output of function is set up to be written and append to the following file: '~/dataone/gitcheckout/semantic-query/results/Prec_Recall_Results.csv'

filter_merge_calculate_function <- function(gtFileLocation, outputFileLocation){
    stopifnot(file.exists(gtFileLocation))
    stopifnot(file.exists(outputFileLocation))
    
    groundTruthDF <- read.csv(gtFileLocation, stringsAsFactors = FALSE)
    queryResultDF <- read.csv(outputFileLocation, stringsAsFactors = FALSE)
    
    queryResultDF$Check <- "query"
    groundTruthDF$Check <- "ground_truth"
    
    df <- merge(queryResultDF,groundTruthDF,by="Dataset_ID",all=TRUE)
    querycolumns <- c("q1","q2","q3","q4","q5","q6","q7","q8","q9","q10")
    filtered_merged_result <-  df[complete.cases(df[,querycolumns]),]
    
    filtered_merged_result[is.na(filtered_merged_result)] <- 0
    
    
    # save copy of filtered_merged_result for external examination
    # ----
    # if you want to save a version from each run, make this filename unique by adding a date. for now it is a temp file.
    # this syntax copied from lines 89-92 in Query_Function.R. separator seems to default to single space.
    write.csv(filtered_merged_result, "results/filtered_merged_result_temp.csv", row.names = FALSE)
    
    # ----
    
    
    #This variable will need to be adjusted as we finalize the definition of the values for SOLR_Index_Type
    solrtypecolumns <- c("nat_lang", "full_text", "metacat_ui", "metacat_filtered", "bioportal_annot", "esor_annot", "manual_annot", "esor_cosine")
    
    if (!(identical(sort(unique(queryResultDF$SOLR_Index_Type)), sort(solrtypecolumns)))) {
        warning(paste0("The expected SOLR_Index_Types were not the same as what was found in the query results:\n\n",
                       "QueryResults:\n\n\t",
                       paste(sort(unique(queryResultDF$SOLR_Index_Type)), collapse = ", " ), 
                       "\n\n",
                       "Expected:\n\n\t",
                       paste(sort(solrtypecolumns), collapse = ", "),
                       "\n\nThis could impact the calculations!"))
    }
    
    # Initialize an output data frame
    RP_Result <- data.frame()
    line_counter <- 1
    
    # Obtain the valid value (i.e. non-zeor) for "Run_ID" from the "filtered_merged_result" data frame.
    run_id_col <- unique(filtered_merged_result["Run_ID"])

    for (i in seq_len(length(run_id_col))) {
        if (run_id_col[i, "Run_ID"] != 0)
        {
            run_id_value <- run_id_col[i, "Run_ID"]
            break
        }
    }
    
    for (n in querycolumns) {
        cat("q =", n, "\n")
        
        # First, get just the unique comnbinations of Dataset_ID and the value in 
        # column 'n' (e.g. q1, q2, etc) so we don't count 
        unique_query_result <- unique(filtered_merged_result[,c("Dataset_ID", n)])
        counter <- table(unique_query_result[,n])
        totalRelevantRecords <- counter[names(counter) == 1]

        for (j in solrtypecolumns) {
            
            Relevant_Retrieved_Counter <- 0
            IRRelevant_Retrieved_Counter <- 0
            Relevant_NotRetrieved_Counter <- 0

            for (i in seq_len(nrow(filtered_merged_result))) {
                
                if ((filtered_merged_result[i,"SOLR_Index_Type"]) == j || (filtered_merged_result[i,"SOLR_Index_Type"]) == 0)
                {
                    # Count the number of Relevant and Retrieved dataset for a specific query (e.g. q1)
                    if ((filtered_merged_result[i,"Query_ID"]) == n && (filtered_merged_result[i,n]) == 1) { 
                        Relevant_Retrieved_Counter <- Relevant_Retrieved_Counter + 1
                        run_id <- filtered_merged_result[i,"Run_ID"]
                        ontology_set_id <- filtered_merged_result[i,"Ontology_Set_ID"]
                    }
                    
                    # Count the number of IRRelevant and Retrieved dataset for a specific query (e.g. q1)
                    if ((filtered_merged_result[i,"Query_ID"]) == n && (filtered_merged_result[i,n]) == 0) {  
                        IRRelevant_Retrieved_Counter <- IRRelevant_Retrieved_Counter + 1
                    }
                    
                    # Count the number of Relevant and NOT Retrieved dataset for a specific query (e.g. q1)
                    if ((filtered_merged_result[i,"Query_ID"]) == 0 && (filtered_merged_result[i,n]) == 1) {  
                        Relevant_NotRetrieved_Counter <- Relevant_NotRetrieved_Counter + 1
                    }
                }
            }
            
            if (length(totalRelevantRecords) == 0) {
                #print("There are no relevant dataset for this query from the ground truth")
                # mob: left these messages in; they should not occur. if no relevant datasets found in ground_truth, something is wrong with that file.
                Recall <- "No Relevant Datasets in the Ground Truth"
                Precision <- "No Relevant Datasets in the Ground Truth"
                test_corpus_id <- gtFileLocation
                run_id <- run_id_value
                ontology_set_id <- "N/A"
            } else if ((Relevant_Retrieved_Counter == 0) && (IRRelevant_Retrieved_Counter == 0)) {
                Recall <- (Relevant_Retrieved_Counter / totalRelevantRecords)*100
                # Precision <- "Number of Relevant Datasets Retrieved = 0 and Number of Irrelevant Datasets Retrieved = 0"
                # mob: total retrieved = 0, and Precision divides by total_retrieved. div by zero is mathematically infinite.
                # Use NaN as a place holder for values that cannot be represented in floating pt.
                Precision <- "NaN"
                test_corpus_id <- gtFileLocation
                run_id <- run_id_value
                ontology_set_id <- "N/A"
            } else {
                Recall <- (Relevant_Retrieved_Counter / totalRelevantRecords)*100
                Precision <- (Relevant_Retrieved_Counter / (Relevant_Retrieved_Counter + IRRelevant_Retrieved_Counter))*100
                test_corpus_id <- gtFileLocation
            }
            
            result <- data.frame("Test_Corpus_ID"   = test_corpus_id, 
                                 "Query_ID"         = n, 
                                 "SOLR_Index_Type"  = j, 
                                 "Run_ID"           = run_id, 
                                 "Ontology_Set_ID"  = ontology_set_id, 
                                 "Precision"        = as.character(Precision), 
                                 "Recall"           = as.character(Recall), 
                                 stringsAsFactors   = FALSE)
            
            RP_Result <- rbind(RP_Result, result)
            
            line_counter <- line_counter + 1
        }
    }
    
    finaloutputFileLocation <- "results/Prec_Recall_Results.csv"
    write.csv(RP_Result, finaloutputFileLocation, row.names = F)
    
    return(finaloutputFileLocation)
    
}
