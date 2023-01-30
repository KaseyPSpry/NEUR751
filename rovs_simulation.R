NB <- 10

meanS1 <- array(-99999, NB)
meanS2 <- array(-99999, NB)
meanS3 <- array(-99999, NB)
meanROVS <- array(-99999,NB)
  
for (i in 1:NB){
  N <- 100
  
  mn1 <- rnorm(1,0,100)
  stdev1 <- 20
  
  mn2 <- rnorm(1,0,100)
  stdev2 <- 20
  
  sample1 <- rnorm(N,mn1,stdev1)
  sample2 <- rnorm(N,mn2,stdev2)
  sample3 <- sample1 + sample2
  
  meanS1[i] <- mean(sample1)
  meanS2[i] <- mean(sample2)
  
  meanS3[i] <- mean(sample3)
  meanROVS[i] <- meanS1[i] + meanS2[i]
}

plot(meanS3, meanROVS)