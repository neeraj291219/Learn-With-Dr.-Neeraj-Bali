
#calling libraries
library(readr)
library(lavaan)
library(semPlot)
library(dplyr)
library(mediation)
library(flexplot)

#reading data file 
datafile <- read_csv("C:/Users/user/Desktop/mediation_data.csv")
View(datafile)

mdl1 <- "
    
      X~ a*M
      M~ b*Y
      
      ind1 := a*b

"

fit1 <- sem(mdl1, data = datafile , se= "boot" , bootstrap = 100)

summary(fit1, fit.measures = T , rsquare = T )

parameterEstimates(fit1)


mediate_plot( X ~ M + Y , data = datafile )


  