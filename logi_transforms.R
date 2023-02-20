library("gtools")

underlyingvalue <- seq(-5,5,0.1)
behaviorvalues <- inv.logit(underlyingvalue)
plot(underlyingvalue, behaviorvalues)

transformeddata <- logit(behaviorvalues)

plot(underlyingvalue, transformeddata)

#probs <- seq(0.01, .99, 0.01)
#plot(probs, logit(probs))
