library(e1071)
library(caret)
library(caTools)

Nlive <- 100
Ndie <- 100

lived <- c(rep(1, Nlive), rep(0, Nlive))
v1 <- c(rnorm(Nlive, 0, 1), rnorm(Nlive, 0, 1))
v2 <- c(rnorm(Nlive, 0, 5), rnorm(Nlive, -10, 5))
v3 <- c(rnorm(Nlive, 0, 10), rnorm(Nlive, 5, 10))

dat <- data.frame("LIVED" = as.factor(lived), "v1" = v1, "v2" = v2, "v3" = v3)

model <- naiveBayes(formula = LIVED ~ v1+v2+v3, data = dat)
predictions <- predict(model, dat[,2:4])
CM <- confusionMatrix(data = predictions, reference = dat[,1])
