install.packages("lmtest")
df1 <- read.csv("C:/Users/Dr. Neeraj Bali/Desktop/durbin watson test data.csv")
View(df1)
df2<-lm(df1$Salary~Experience+Age+Leadership,data=df1)
summary(df2)
library(lmtest)
dwtest(df2)
