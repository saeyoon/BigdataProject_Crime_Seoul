#패키지 불러오기
#install.packages("plotly")
#library(plotly)
library(ggplot2)
library(readxl)
library(dplyr)

#파일불러오기
crime <- read_excel("10만명대비범죄.xlsx")
head(crime)
dim(crime)
#View(crime)
str(crime)

alcohol <- read_excel("10만명대배유흥업소.xlsx")
head(alcohol)
dim(alcohol)
#View(alcohol)
#변수명 바꾸기
crime <- rename(crime, 범죄발생율 = 발생율)
head(crime)

alcohol <- rename(alcohol, 유흥업소 = `10만명 당 유흥업소`,
                  유흥업소개수 = 유흥업소)
head(alcohol)
#View(alcohol)
#필요한 열 추출 및 합쳐보기
crime  %>%  select(자치구, 범죄발생율) 
crime_p <- crime  %>%  select(자치구, 범죄발생율)
crime_p


alcohol %>%  select(자치구, 유흥업소)
alcohol_p <- alcohol %>%  select(자치구, 유흥업소)
alcohol


merge(crime_p, alcohol_p, by ="자치구")
rel <- merge(crime_p, alcohol_p, by ="자치구")
View(rel)

#인터렉티브그래프만들기
p <-ggplot(data = rel, aes(x= 유흥업소 , y = 범죄발생율, col = 자치구)) + geom_point()
p


####상관분석 - 두 변수의 관계성분석p.303
str(rel)

relation <- rel
cor.test(rel$유흥업소, rel$범죄발생율)

