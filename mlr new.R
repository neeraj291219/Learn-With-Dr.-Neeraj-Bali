setwd("C:/Users/user/Desktop")
library(readr)
database1 <- read_csv("Salary MLR1.csv")
View(database1)
library(lessR)
library(car)
#library(car)
#from lessR
mdl111 <- Regression(Salary ~ Experience + Leadership  , data = database1)
mdl111

#collinearity by VIF
#residual vs fitted value is for Homosedacity
res111 = resid(mdl111)

#From car
##dwt 1.85 to 2.15 is ok and means residuals are not autocorrelated  and hence assumotion is met
durbinWatsonTest(res111)

#If residuals are on qq plot line it means residuals are normaly distributed.
qqnorm(res111)
qqline(res111)

##residuals should have no autocorrelation (no pattern)....if any pattern residuals are not independent so the assumption is not met
plot(res111)
abline(h = 0)



