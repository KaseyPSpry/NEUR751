N_Neuron <- 15
N_Group <- 10

N<- N_Neuron*N_Group

GroupID <- rep(1:N_Group, N_Neuron)
DV <- 50*GroupID + rnorm(N,0,100)

dat <- data.frame("GID" = GroupID, "RF" = DV)

model1 <- lm(data = dat, RF~GID)

print(summary(model1))
plot(GroupID, DV)


dat$GID <- as.factor(dat$GID)
model2 <- lm(data = dat, RF~GID)
print(summary(model2))