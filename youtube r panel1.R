#step1 is to install the packages - install.packages("readr")
#2.call the libraries
library(readr)
library(dplyr)
library(tidyverse)
library(tidyr)
library(mice)
library(VIM)
library(plm)

#3.import the data in R

df1 <- read_csv("wb777.csv")
View(df1)
#4.converting the file to dataframe
df2<-data.frame(df1)
#5.clean the data
df3<-df2[,-c(8:9)]
df4<-df3[-c(801:805),]
#6 RESHAPING of data with temp example file wbTTT_long_Data_temp
#temp.df.long<-gather(data=wbTTT_LONG_DATA_TEMP,key = "T.total",value = "value of T",c(8:10))
#help("gather")
#6replace na with multivariate imputation by chain equation(MICE)
#help("mice")
mc.imp1<-mice(data=df4, m = 5, method = "cart",seed=51)
densityplot(mc.imp1)
mc.complete.df<-complete(mc.imp1)
knn.complete.df<-kNN(df4)
knn.complete.df1<-knn.complete.df[,-c(8:14)]
#step 7 is to declare the data as panel data frame for r to recognise the data as panel data
help("pdata.frame")
pdata.frame()
pdata1<-pdata.frame(mc.complete.df, index = c("Country.Name","Time"), drop.index=TRUE)
#step8 panel regression models

help("plm")

pooling.mdl<-plm(log(GDP)~log( Exports)+log(Expenditure),data=pdata1,model=("pooling"))
 summary(pooling.mdl) 
 
 
 fixed.mdl<-plm(log(GDP)~log( Exports)+log(Expenditure),data=pdata1,model=("within"))
 summary(fixed.mdl)
 
 random.mdl<-plm(log(GDP)~log( Exports)+log(Expenditure),data=pdata1,model=("random"))
 summary(random.mdl) 
 
 #step9:-selection of model by tests between pooling and fixed
 
 pFtest(fixed.mdl,pooling.mdl)
 #decision fixed effect model is consistent
 
 #step 10 test between fixed and random effect model
 
 phtest(fixed.mdl,random.mdl)
 #fixed effect model is consistent
 
 #step 11 some diagnostics 
 pdwtest(fixed.mdl)
 
 plot(pdata1)
 