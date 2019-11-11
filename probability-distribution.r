z<-seq(-3.5,3.5,0.1)  # 71 points from -3.5 to 3.5 in 0.1 steps
q<-seq(0.001,0.999,0.001)  # 1999 points from 0.1% to 99.9% on 0.1% steps
dStandardNormal <- data.frame(Z=z, 
                              Density=dnorm(z, mean=0, sd=1),
                              Distribution=pnorm(z, mean=0, sd=1))  
qStandardNormal <- data.frame(Q=q, 
                              Quantile=qnorm(q, mean=0, sd=1))  
head(dStandardNormal)

head(qStandardNormal)
