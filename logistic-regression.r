library(ISLR)
attach(Smarket)

#to see the size of the data
dim(Smarket)

#splitting data
attach(Smarket)
trainSet <- Smarket[Year<2005, ]
testSet <- Smarket[Year==2005, ]

#train the model using Logistic Regression
logitModel <- glm(formula = Direction ~ Lag1 + Lag2 + Lag3, 
                  data = trainSet, family = "binomial")
logitModel


#evaluate the model
result <- predict(logitModel, testSet, type="response")

result_logit <- rep("Down", length(result))
result_logit[result>=0.5] <- "Up"

#see the classification result
table(result_logit, testSet$Direction)

library(caret)
confusionMatrix(testSet$Direction, factor(result_logit))

#evaluasi dengan ROC
library(pROC)
plot(roc(as.numeric(testSet$Direction),
         as.numeric(factor(result_logit))))
