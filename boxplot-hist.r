#load dataset
data(iris)

#create separate boxplots for each attributes
par(mfrow =  c(1,4))
for(i in 1:4){
  boxplot(iris[,i], main = names(iris)[i], horizontal = FALSE)
}

#compare between 
#load the data
data(iris)

#create separate boxplots for each attributes
par(mfrow =  c(2,4))
for(i in 1:4){
  hist(iris[,i], main = iris[i])
}
for(i in 1:4){
  boxplot(iris[,i], main = iris[i], horizontal = TRUE)
}

