library(tidyverse)
library(dplyr)

#Set up working directory
setwd("D:\\Documents\\World Bank\\2. ACLED Data")
f <- file.choose()
df_1 <- read.csv(f)
df_1$ID <- seq.int(nrow(df_1))
#within(df_1, event_date<-data.frame(do.call('rbind', strsplit(as.character(event_date), '|', fixed=TRUE))))


foo <- data.frame(do.call('rbind', strsplit(as.character(df_1$event_date),' ',fixed=TRUE)))
foo <- foo %>% 
  mutate(event_date_2 = paste0(X1,"-",X2,"-", X3))
foo$ID <- seq.int(nrow(foo))

df_1 <- merge(df_1, foo, by="ID")
