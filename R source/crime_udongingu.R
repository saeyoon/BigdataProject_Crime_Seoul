library(readxl)
library(dplyr)
data_udong <- read_excel("udongingu.xlsx")
str(data_udong)
#View(data_udong)
data_udong <- data_udong[-1,]
df_udong2 <- data.frame(data_udong[,3],data_udong$서울외유입인구수, data_udong$자치구간이동인구수,
                        stringsAsFactors=F)
str(df_udong2)
df_udong2 <- rename(df_udong2, 서울외유입인구수=data_udong.서울외유입인구수)
df_udong2 <- rename(df_udong2, 자치구간이동인구수=data_udong.자치구간이동인구수)


df_udong2$서울외유입인구수 <- as.integer(df_udong2$서울외유입인구수)
df_udong2$자치구간이동인구수 <- as.integer(df_udong2$자치구간이동인구수)

str(df_udong2)

df_udong2 <- df_udong2 %>% 
  mutate(udong = 서울외유입인구수+자치구간이동인구수)

#View(df_udong2)

gu2 <- c("강남구", "강동구", "강북구", "강서구", "관악구", "광진구", "구로구", 
         "금천구", "노원구", "도봉구", "동대문구", "동작구", "마포구", "서대문구",
         "서초구", "성동구", "성북구", "송파구", "양천구", "영등포구", "용산구",
         "은평구", "종로구", "중구", "중랑구")

y <- c(1:25)

for(i in 1:25){
  data <- df_udong2 %>% 
    filter(시군구명 == gu2[i])
  
  mean <- data %>% 
    mutate(mean=mean(udong)) %>% 
    select(mean)
  
  y[i] <- mean
}
udong_mean <-0
for(i in 1:25){
  udong_mean[i]<-y[[i]][1]
}

df_udong3 <- data.frame(gu2, udong_mean,
                        stringsAsFactors=F)
str(df_udong3)
df_udong3$udong_mean <- as.integer(df_udong3$udong_mean)

#View(df_udong3)

library(ggplot2)
write.csv(df_udong3, "udong_final.csv", row.names=F, na="")

library(treemap)
############트리맵 보여주기#######
treemap(df_udong3, index="gu2", vSize="udong_mean", vColor="udong_mean", type="value")


#############유동인구&범죄율 산점도#######
crime1 <- read_excel('2017_crime_final2.xlsx')
str(crime1)
crime1$crimeperc <- (crime1$범죄/crime1$인구)*1000000

df_udong3$crimeperc <- crime1$crimeperc
df_udong3$범죄 <- crime1$범죄
library(RColorBrewer)
display.brewer.all()

h <- ggplot(df_udong3, aes(x=udong_mean, y=범죄, colour=gu2)) + geom_point() 
h + labs(title = '범죄와 유동인구 관계',
         x = '유동인구',
         y = '범죄')
#######
str(df_udong3)
df_udong3$udong_mean <- as.numeric(df_udong3$udong_mean)

tree1 <- read.csv("tree1.csv", stringsAsFactors=F)
tree1 <-tree1[,-1]
#########corplot#########
cor.test(tree1$유동인구평균, tree1$범죄율)
