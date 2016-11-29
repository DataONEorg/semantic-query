source("src/Filter_Merge_Calculate_Function.R")

filter_merge_calculate_function("test/test_docs/test_ground_truth.csv", "test/test_docs/test_resultset.csv")
prr <- read.csv("results/Prec_Recall_Results.csv", stringsAsFactors = FALSE)
prr <- prr[prr$SOLR_Index_Type == "manual_annot",]
prr[order(prr$SOLR_Index_Type),]
