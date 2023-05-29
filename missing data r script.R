#install packages only one time .If you have installed before no need to do again
install.packages("readr")
install.packages("VIM")
install.packages("mice")
#Activate library
library(readr)
library(VIM)
library(mice)
#import database
df.orig <- read_csv("C:/Users/Dr. Neeraj Bali/Desktop/mice missing data.csv")
View(df.orig)
#mice

df1<- data.frame(df.orig)
df.mc<-mice(data=df1,m = 5,method = "cart")
#help("mice")
densityplot(df.mc)
df2<- complete(df.mc)

#knn 2 nd method

df.knn <- kNN(df1)
df.knn1 <- df.knn[,-c(8:14)]
