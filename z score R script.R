library(readr)
Orig.df <- read_csv("C:/Users/Dr. Neeraj Bali/Desktop/z score data.csv")
View(Orig.df)
df1  <-scale(Orig.df$Salary)
df2 <- Orig.df[,-1]  
df3<- scale(df2)
