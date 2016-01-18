library(ggplot2)
library(Hmisc)

plot_pr <- function() {
    pr <- read.csv("results/Prec_Recall_Results.txt", sep = " ")
    pr$Precision[is.na(pr$Precision)] <- 0
    
    # Precision
    p <- ggplot(pr, aes(SOLR_Index_Type, Precision)) + 
        stat_summary(fun.y = mean, geom = "bar", color="black", fill="white") + 
        stat_summary(fun.data = mean_se, geom = "errorbar", width=0.5) + 
        geom_jitter(color="red", height=0, width=0.9)
    ggsave("pr-plot-precision.pdf", plot=p, width=12, height=12)
    
    # Recall
    r <- ggplot(pr, aes(SOLR_Index_Type, Recall)) + 
        stat_summary(fun.y = mean, geom = "bar", color="black", fill="white") + 
        stat_summary(fun.data = mean_se, geom = "errorbar", width=0.5) +
        geom_jitter(color="red", height=0, width=0.9)
    ggsave("pr-plot-recall.pdf", plot=r, width=12, height=12)
}
