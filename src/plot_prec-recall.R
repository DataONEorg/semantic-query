
plot_pr <- function(results_Prec_Recall) {
    library(ggplot2)
    library(Hmisc)
    
    pr <- read.csv(results_Prec_Recall, stringsAsFactors = FALSE)
    pr$Precision[is.na(pr$Precision)] <- 0
    pr$Precision <- as.numeric(pr$Precision)
    pr$Recall <- as.numeric(pr$Recall)
    # Use a factor to set the order of search types to be plotted
    pr$SOLR_Index_Type2 <- factor(pr$SOLR_Index_Type, 
                                  levels = c("full_text", "metacat_ui", "bioportal_annot", "esor_annot", "esor_cosine", "manual_annot", "nat_lang"), 
                                  labels = c("Full Text", "Structured", "BioPortal",       "ESOR wiki",  "ESOR cosine", "Manual",       "Natural"))
    
    # Eliminate search types not set in the above factor
    pr <- pr[which(!is.na(pr$SOLR_Index_Type2)), ]
    
    # Precision plot
    p <- ggplot(pr, aes(SOLR_Index_Type2, Precision)) + 
        stat_summary(fun.y = mean, geom = "bar", color="black", fill="white") + 
        stat_summary(fun.data = mean_se, geom = "errorbar", width=0.4) + 
        geom_jitter(color="red", height=0, width=0.6, size=3) +
        scale_y_continuous(limits = c(0, 100)) +
        labs(x="Search Type",y="Precision (%)") +
        theme(axis.title = element_text(face="bold", size=28)) +
        theme(axis.text = element_text(face="bold", size=18))
    ggsave("pr-plot-precision.pdf", plot=p, width=12, height=12)
    ggsave("pr-plot-precision.png", plot=p, width=12, height=12)
    
    # Recall plot
    r <- ggplot(pr, aes(SOLR_Index_Type2, Recall)) + 
        stat_summary(fun.y = mean, geom = "bar", color="black", fill="white") + 
        stat_summary(fun.data = mean_se, geom = "errorbar", width=0.4) +
        geom_jitter(color="red", height=0, width=0.6, size=3) +
        scale_y_continuous(limits = c(0, 100)) +
        labs(x="Search Type",y="Recall (%)") +
        theme(axis.title = element_text(face="bold", size=28)) +
        theme(axis.text = element_text(face="bold", size=18))
    ggsave("pr-plot-recall.pdf", plot=r, width=12, height=12)
    ggsave("pr-plot-recall.png", plot=r, width=12, height=12)
}
