NS <- 1000

v1 <- rnorm(NS,0,1)
v2 <- v1 +rnorm(NS,0,1)
v3 <- v1 + v2 + rnorm(NS,0,1)
v4 <- rnorm(NS,0,1)
v5

dat <- data.frame(v1,v2,v3,v4)
dat <- scale(dat)

pca<- princomp(dat)
