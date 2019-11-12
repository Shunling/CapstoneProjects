library(tidyr)
library(reshape2)
library(kableExtra)

receptorTrend <- read_csv("norm_geneTrend_total.csv")
names <- colnames(receptorTrend)[-c(1,2)]

top15s <- read_csv("top15.csv") 
  

plot_trend <- function(name) {

  plot(
    x = receptorTrend[["year"]],
    y = receptorTrend[[name]],
    type = "l",
    title('Research Hotness of receptor: ', name),
    xlab = "Year",
    ylab = "normalized hotness index"
  ) 
}

show_table <- function(name){
  toptable <- top15s[,c("ranks",name,"Index")]

  pivottable <- dcast(toptable, ranks ~ Index, value.var = name)
  print(pivottable)
    
}

