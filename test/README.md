# Precision Recall Testing

The script in this directory, `run_test.R`, runs a syntheic P/R run against known ground truth and query result inputs.
It is meant for interactive use.
The steps I used to run a test were:

1. Edit `test_docs/test_ground_truth.csv` to your liking
2. Edit `test_docs/test_resultset.csv` to your liking
3. Run the code in `run_test.R` to show the result

You should get something like this:

```{R}
> filter_merge_calculate_function("test/test_docs/test_ground_truth.csv", "test/test_docs/test_resultset.csv")
> prr <- read.csv("results/Prec_Recall_Results.csv", stringsAsFactors = FALSE)
> prr <- prr[prr$SOLR_Index_Type == "manual_annot",]
> prr[order(prr$SOLR_Index_Type),]
                         Test_Corpus_ID Query_ID SOLR_Index_Type Run_ID Ontology_Set_ID Precision    Recall
7  test/test_docs/test_ground_truth.csv       q1    manual_annot    ZZZ            None        10 100.00000
15 test/test_docs/test_ground_truth.csv       q2    manual_annot    ZZZ            None        20 100.00000
23 test/test_docs/test_ground_truth.csv       q3    manual_annot    ZZZ            None        30 100.00000
31 test/test_docs/test_ground_truth.csv       q4    manual_annot    ZZZ            None        40 100.00000
39 test/test_docs/test_ground_truth.csv       q5    manual_annot    ZZZ            None        50 100.00000
47 test/test_docs/test_ground_truth.csv       q6    manual_annot    ZZZ            None       100  66.66667
55 test/test_docs/test_ground_truth.csv       q7    manual_annot    ZZZ            None       100  57.14286
63 test/test_docs/test_ground_truth.csv       q8    manual_annot    ZZZ            None       100  50.00000
71 test/test_docs/test_ground_truth.csv       q9    manual_annot    ZZZ            None       100  44.44444
79 test/test_docs/test_ground_truth.csv      q10    manual_annot    ZZZ            None       100  40.00000
```