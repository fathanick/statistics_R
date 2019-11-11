#Simple linear regression using R
#Source: https://medium.com/machine-learning-id/simple-linear-regression-r-ea42aed17c52
#https://medium.com/@GalarnykMichael/univariate-linear-regression-using-r-programming-3db499bdd1e3

setwd("D:/00-UII/00-TEACHING/MATEMATIKA LANJUT/SOURCE CODE 18-19/R")
rawData = read.csv('linear.csv')

# Show first n entries of data.frame, notice NA values
head(rawData, 10)

linModel <- lm(y~x, data = rawData)

# Show attributes of linModel
attributes(linModel) 

# To show what happens with na.action, "omit" since data has NA
linModel$na.action

# Show coefficients of model
linModel$coefficients

# Predicting New Value based on our model
predict(linModel, data.frame(x = 3))

plot(y ~ x, data = rawData,
     xlab = "x axis",
     ylab = "y axis",
     main = "Scatter Plot"
)

abline(linModel, col = "red", lwd = 1) #lwd is a paramaeter to set the line width 

