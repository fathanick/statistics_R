head(cars)
scatter.smooth(x=cars$speed, y=cars$dist, main="Dist ~ Speed")

par(mfrow=c(1, 2))  # divide graph area in 2 columns
boxplot(cars$speed, main="Speed", 
        sub=paste("Outlier rows: ", 
                  boxplot.stats(cars$speed)$out)) # box plot for 'speed'
boxplot(cars$dist, main="Distance", 
        sub=paste("Outlier rows: ", 
                  boxplot.stats(cars$dist)$out))  # box plot for 'distance'

library(e1071)  # for skewness function
par(mfrow=c(1, 2))  # divide graph area in 2 columns

plot(density(cars$speed), 
     main="Density Plot: Speed", 
     ylab="Frequency", 
     sub=paste("Skewness:", 
               round(e1071::skewness(cars$speed), 2)))  
# density plot for 'speed'
polygon(density(cars$speed), col="red")

plot(density(cars$dist), 
     main="Density Plot: Distance", 
     ylab="Frequency", 
     sub=paste("Skewness:", 
               round(e1071::skewness(cars$dist), 2)))  
# density plot for 'dist'
polygon(density(cars$dist), col="red")


cor(cars$speed, cars$dist)  # calculate correlation between speed and distance

linearMod <- lm(dist ~ speed, data=cars)  # build linear regression model on full data
print(linearMod)


dist <- cars$dist
speed <- cars$speed
plot(speed, dist)
plot(linearMod)
abline(linearMod, col="red")
abline(lm(dist ~ speed))
abline(lm(dist ~ speed), col="red")

plot(cars$dist ~ cars$speed)
abline(linearMod, col="red")

# Create Training and Test data -
set.seed(100)  # setting seed to reproduce results of random sampling
trainingRowIndex <- sample(1:nrow(cars), 0.8*nrow(cars))  # row indices for training data
trainingData <- cars[trainingRowIndex, ]  # model training data
testData  <- cars[-trainingRowIndex, ]   # test data

lmMod <- lm(dist ~ speed, data=trainingData)  # build the model
distPred <- predict(lmMod, testData)  # predict distance

actuals_preds <- data.frame(cbind(actuals=testData$dist, predicteds=distPred))  # make actuals_predicteds dataframe.
correlation_accuracy <- cor(actuals_preds)  # 82.7%
head(actuals_preds)

# Min-Max Accuracy Calculation
min_max_accuracy <- mean(apply(actuals_preds, 1, min) / apply(actuals_preds, 1, max))  
# => 38.00%, min_max accuracy

# MAPE Calculation
mape <- mean(abs((actuals_preds$predicteds - actuals_preds$actuals))/actuals_preds$actuals)  
# => 69.95%, mean absolute percentage deviation