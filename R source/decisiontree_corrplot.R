library(stringi)
library(readxl)
library(dplyr)
library(corrplot) 
library(ggplot2)
getwd()
setwd('D:/Bigdata/Project_crime2')
final <- read.csv("real_final2.csv", stringsAsFactors=F)
final <- final[,-1]
dim(final)
str(final)


final %>% 
  arrange(desc(인구대비무단투기)) %>% 
  head(10)


final %>% 
  arrange(desc(인구대비무단투기)) %>% 
  tail(10)

ggplot(data=final, aes(x=reorder(자치구, 면적), y=면적))+
  geom_bar(stat='identity')+
  coord_flip()

ggplot(data=final, aes(x=reorder(자치구, 가로등), y=가로등))+
  geom_bar(stat='identity')+
  coord_flip()


View(final)
final$인구대비_살인 <- (final$살인/final$인구)*100000
final$인구대비_강도 <- (final$강도/final$인구)*100000
final$인구대비_강간 <- (final$강간/final$인구)*100000
final$인구대비_절도 <- (final$절도/final$인구)*100000
final$인구대비_폭력 <- (final$폭력/final$인구)*100000
str(final)


#write.csv(
#  x,              # 파일에 저장할 데이터 프레임 또는 행렬
#  file="",        # 데이터를 저장할 파일명
#  row.names=TRUE  # TRUE면 행 이름을 CSV 파일에 포함하여 저장한다.
#)

write.csv(final, 'D:/Bigdata/Project_crime2/final_final.csv', row.names=TRUE)


######corrplot 돌리기#####
final <- final[,-1]
str(final)
car_fin <- cor(final)
final$유동인구평균 <-   as.numeric(final$유동인구평균)
final$발생합계 <- as.numeric(final$발생합계)
final$검거합계 <- as.numeric(final$검거합계)
final$이혼 <- as.numeric(final$이혼)
final$인구 <- as.numeric(final$인구)
final$면적 <- as.numeric(final$면적)
final$가로등 <- as.numeric(final$가로등)
final$무단투기 <- as.numeric(final$무단투기)


fin_cor<- cor(final)

#install.packages("corrplot")
library(corrplot)

corrplot(fin_cor, method="circle")



str(final)





fin <- data.frame(final$인구대비무단투기, final$무단투기,final$범죄율, 
                  final$인구대비_강도, final$인구대비_절도, 
                  final$인구대비_폭력, final$인구대비_살인)
fin <- rename(fin, 인구대비무단투기=final.인구대비무단투기,
                      무단투기=final.무단투기,
                      범죄율 = final.범죄율,
                      인구대비_강도=final.인구대비_강도,
                      인구대비_절도=final.인구대비_절도, 
                      인구대비_폭력=final.인구대비_폭력, 
                      인구대비_살인=final.인구대비_살인)
str(fin)

fin_cor2<- cor(fin)
corrplot(fin_cor2, method="circle")






#####의사 결정 트리####
tree1 <- read.csv("tree1.csv", stringsAsFactors=F)
dim(tree1)
str(tree1)


tree1 <-tree1[,-1]
library(party)
library(datasets)
library(tree)

str(tree1)
treemod<-tree(범죄율~. , data=tree1)
plot(treemod)
text(treemod)
cor.test(tree1$유동인구평균, tree1$범죄율)
cor.test(tree1$유흥업소, tree1$범죄율)
