library(ggplot2)
library(Hmisc)

plot_pr <- function() {
    pr <- read.csv("results/Prec_Recall_Results.txt", sep = " ")
    pr$Precision[is.na(pr$Precision)] <- 0
    
    # Precision
    #p <- ggplot(pr)
    #p + geom_bar(aes(x=SOLR_Index_Type, y=Precision), stat = "summary", fun.y = "mean")
    p <- ggplot(pr, aes(SOLR_Index_Type, Precision)) + 
        stat_summary(fun.y = mean, geom = "bar") + 
        stat_summary(fun.data = mean_se, geom = "errorbar")
    ggsave("pr-plot-precision.pdf", plot=p, width=12, height=12)
    
    # Recall
    #r <- ggplot(pr)
    #r + geom_bar(aes(x=SOLR_Index_Type, y=Recall), stat = "summary", fun.y = "mean")
    r <- ggplot(pr, aes(SOLR_Index_Type, Recall)) + 
        stat_summary(fun.y = mean, geom = "bar") + 
        stat_summary(fun.data = mean_se, geom = "errorbar")
    ggsave("pr-plot-recall.pdf", plot=r, width=12, height=12)
}
