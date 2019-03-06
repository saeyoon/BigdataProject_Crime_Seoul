####범죄데이터(특징적인 정보) 
##구별 5대 범죄가 높은구 (ggplot사용)

getwd()

library(dplyr)
library(ggplot2)
library(readxl)
rawdata <- read.csv("real_final2.csv", stringsAsFactors=F)
df_crime <- rawdata
str(df_crime)
head(df_crime)
View(df_crime)

#결측지 확인
table(is.na(df_crime))

#합계열 제거
#df_crime <- df_crime[-1,]
#head(df_crime)

#필요한 열뽑기
df_crime %>%  select(자치구, 범죄, 인구)
df_crime <- df_crime %>%  select(자치구, 범죄, 인구)
df_crime

df_crime$crime_perc <- (df_crime$범죄/df_crime$인구)*1000000
head(df_crime$crime_perc)

#변수추출하기
df_crime <- df_crime %>%  select(자치구, crime_perc) %>% 
                          arrange(desc(crime_perc))
                         

df_crime
#합계열 삭제
df_crime <- df_crime[-7,]
df_crime
#color
colors <- c(rep("#FF6138",3), rep("grey", 18), rep("#00A338",3))
#ggplot() 
barplot(df_crime$crime_perc,
        names.arg = df_crime$자치구,
        srt = 45,
        adj = 1,
        xpd = TRUE,
        col = colors,
        border = NA,
        xlab = "자치구",
        ylab = "인구별 범죄",
        cex.names = 0.65,
        cex.lab = 0.65)

p <- ggplot(data = df_crime, aes(x =reorder(자치구, -crime_perc), 
                                 y = crime_perc, fill = reorder(자치구, -crime_perc)))+ 
          geom_bar(stat='identity')+
          theme(axis.text.x=element_text(angle=40, hjust=1))

p + scale_fill_manual(values=c(rep("#FF6138",3), rep("grey", 18), rep("#00A338",3)))


#############################################################
##### 검거율 낮은 곳 top5
df_arr <-rawdata
##필요한 열뽑기
df_arr %>% select(자치구, 검거)
df_arr <- df_arr %>% select(자치구, 검거)
df_arr

df_arr$arr_perc <- (df_arr$검거/5)
head(df_arr$arr_perc)

#변수추출하기
df_arr %>% select(자치구, arr_perc) %>% 
           arrange(arr_perc) %>% 
           head(10)
           


df_arr <-df_arr %>% select(자치구, arr_perc) %>% 
                    arrange(arr_perc) %>% 
                    head(10)



View(df_arr)
#합계열 삭제
#df_arr[-1,]
#df_arr <- df_arr[-1,]

ggplot(data = df_arr, aes(x =reorder(자치구, -arr_perc), y = arr_perc)) + geom_col()
