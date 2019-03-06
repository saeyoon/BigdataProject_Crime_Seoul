hwa_4 <- read.csv("hwa_3.csv")
hwa_4
hwa_4["low비율"] <- hwa_4$low/(hwa_4$low+hwa_4$X200+hwa_4$high)
hwa_4["200비율"] <- hwa_4$X200/(hwa_4$low+hwa_4$X200+hwa_4$high)
getwd()
library(stringi)
library(dplyr)
library(readxl)
crime <- read.csv("real_final2.csv")
cctv_gumgu <- inner_join(hwa_4, crime, by="자치구")
View(cctv_gumgu)

mean(cctv_gumgu$X200)
cctv_gumgu$총개수 <- cctv_gumgu$low+cctv_gumgu$X200+cctv_gumgu$high


boxplot(cctv_gumgu$총개수)

mean(cctv_gumgu$총개수)

result_cor_2 <- subset(cctv_gumgu, select = c(low, X200, low비율,`200비율`, 살인검거율, 강간검거율, 강도검거율, 절도검거율, 폭력검거율))
cor123 <- cor(result_cor_2)
round(cor123, 2)





#install.packages("corrplot")
library(corrplot)
corrplot(cor123)
View(result_cor_2)
cor.test(result_cor_2$low비율, result_cor_2$폭력검거율)
cor.test(result_cor_2$low비율, result_cor_2$절도검거율)
cor.test(result_cor_2$`200비율`, result_cor_2$폭력검거율)
cor.test(result_cor_2$`200비율`, result_cor_2$강간검거율)
cor.test(result_cor_2$`200비율`, result_cor_2$절도검거율)