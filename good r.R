library(dplyr)
library(lavaan)
library(semPlot)


View(PoliticalDemocracy)

model <- "

#We define the measurement model

Dem60 =~ y1+y2+y3+y4
Dem65 =~ y5+y6+y7+y8
Ind60 =~ x1+x2+x3

#We define sem model 

Dem60~Ind60
Dem65~Dem60+Ind60

#we define Co variances
y2~~y6
y6~~y8
y1~~y5

"

object <- sem(model , data = PoliticalDemocracy )
summary(object,fit.measures= T, rsquare= T  )

modificationindices(object,sort. = T)

semPaths(object,"std",bg="black",layout = "spring", fade = F)

#New_object <- sem(model , data = PoliticalDemocracy)
#summary(New_object,fit.measures=TRUE,rsquare=TRUE)

#modificationindices(New_object,sort. = TRUE)

#semPaths(New_object,"std",bg="black",layout= "spring", fade = FALSE)
