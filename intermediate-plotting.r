#src: https://www.cyclismo.org/tutorial/R/intermediatePlotting.html

x <- rnorm(10,sd=5,mean=20)
y <- 2.5*x - 1.0 + rnorm(10,sd=9,mean=0)
cor(x,y)

plot(x,y,xlab="Independent",ylab="Dependent",main="Random Stuff")
x1 <- runif(8,15,25)
y1 <- 2.5*x1 - 1.0 + runif(8,-6,6)
points(x1,y1,col=6)
