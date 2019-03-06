library(readxl)
library(ggplot2)
library(dplyr)
crime1 <- read_excel('2017_crime_final2.xlsx')



str(crime1)

crime2 <- crime1 %>%
  arrange(desc(폭력)) %>% 
  head(10)

ggplot(data=crime2, aes(x=reorder(자치구,-폭력),y=폭력, fill=자치구, angle=20))+
  geom_col()+
  theme(axis.text.x=element_text(angle=20, hjust=1))
crime3 <- crime1 %>%
  arrange(desc(이혼)) %>% 
  head(10)


ggplot(data=crime3, aes(x=reorder(자치구,-이혼), y=이혼, fill=자치구, angle=20))+
  geom_col()+
  theme(axis.text.x=element_text(angle=20, hjust=1))
crime4<- intersect(crime2, crime3)
View(crime4)

cor.test(crime1$이혼, crime1$폭력)
View(crime1)

#x<- read.csv("real_final.csv", stringsAsFactors=F)
#head(x)

#x$이혼율 <- (x$이혼/x$인구)*100000
#x$폭력율 <- (x$폭력/x$인구)*100000
#head(x)

#crime2 <- x %>%
#  arrange(desc(폭력율)) %>% 
#  head(10)

#crime3 <- x %>% 
#  arrange(desc(이혼율)) %>% 
#  head(10)

#ggplot(data=crime3, aes(x=reorder(자치구,-이혼율), y=이혼율, fill=자치구, angle=20))+
#  geom_col()+
#  theme(axis.text.x=element_text(angle=20, hjust=1))

#ggplot(data=crime2, aes(x=reorder(자치구,-폭력율),y=폭력율, fill=자치구, angle=20))+
#  geom_col()+
#  theme(axis.text.x=element_text(angle=20, hjust=1))

#x2 <- intersect(crime2, crime3)
#x2
#cor(x$이혼율, x$폭력율)
