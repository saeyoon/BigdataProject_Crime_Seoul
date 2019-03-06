library(readxl)
library(stringi)
library(dplyr)
library(ggplot2)

crime1 <- read_excel('2017_crime_final2.xlsx')
dim(crime1)
crime1$crimeperc <- (crime1$범죄/crime1$인구)*1000000
str(crime1)
ingu <- read_excel("2017_ing_norm.xlsx")
dim(ingu)
str(ingu)

ingu=rename(ingu, gu=자치구)
str(ingu)
head(ingu)

##외국인 많은 구
ingu$for_perc <- ingu$외국인계/ingu$계

str(ingu)
for_percent <- ingu %>% 
  select(gu, for_perc) %>% 
  arrange(desc(for_perc))

str(crime1)

for_percent <- rename(for_percent, 자치구=gu)
for_crime <- inner_join(crime1, for_percent)
str(for_crime)

for_perc <-head(for_percent, 10)

############외국인 비율 ggplot########
ggplot(data=for_percent, aes(x=reorder(자치구,-for_perc), y=for_perc, fill=자치구, angle=20))+
  geom_col()+
  theme(axis.text.x=element_text(angle=20, hjust=1))



ggplot(data=for_perc, aes(x=reorder(자치구,-for_perc), y=for_perc, fill=자치구, angle=20))+
  geom_col()+
  theme(axis.text.x=element_text(angle=20, hjust=1))


##################################16페이지(얘부터 꼭!!)#########
library(readxl)

getwd()
setwd('D:/Bigdata/Project_crime')
raw_data <- read_excel("외국인_범죄율.xlsx")
f <- as.data.frame(raw_data)

str(f)
View(f)
foriegn <- f
#f <- foriegn[c("foriegn", "crime")]

c.mean <- mean(f$crime)
f.mean <- mean(f$foriegn)

cov.num <- sum((f$foriegn-f.mean) * (f$crime- c.mean))
cov.xy <- cov.num/ (nrow(f) - 1)               
cov(f$foriegn, f$crime)

r.xy <-cov.xy / (sd(f$foriegn) * sd(f$crime))
cor(f$foriegn, f$crime)

#########외국인과 범죄의 산점도#####
par(mfrow=c(1,1), mar=c(4,4,1,1))
plot(foriegn~crime, pch = 16, data = f, xlab = "외국인", ylab="범죄")
abline(lm(foriegn~crime, data=f), col="red", lwd=2)

##########상관관계#####
library(corrplot)
cor.test(foriegn$foriegn, foriegn$crime)



