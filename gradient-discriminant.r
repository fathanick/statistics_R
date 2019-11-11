library(MASS)
library(ISLR)
attach(Smarket)
trainSet <- Smarket[Year < 2005, ]
testSet <- Smarket[Year == 2005, ]

#classification model
gdaFit