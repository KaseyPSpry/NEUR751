N <- 100
trueslope <- 25
trueintercept <- 65
errstd <- 100

X <- rnorm(N,0,10)
Y <- trueslope*X + trueintercept + rnorm(N,0,errstd)

plot(X,Y)

model <- lm(Y~X)
print(summary(model))