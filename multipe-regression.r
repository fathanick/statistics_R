#source http://www.rpubs.com/Simionsv/90992
library(ggplot2)
library(dplyr)
library(gridExtra)
library(scatterplot3d)
library(car)
library(knitr)
library(ggExtra)
library(GGally)

mtcars_data <- data(mtcars)
mtcars_b   <- select(mtcars_data, -brand)

fit<- lm(mpg~.,data = mtcars_data)
step<- step(fit, direction="backward", trace = FALSE)
summary(step)$coeff