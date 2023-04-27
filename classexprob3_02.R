rm(list = ls())

library(lme4)
library(pbkrtest)
library(emmeans)

N_Neuron <- 15
N_Group <- 5
N_Neuron_per_animal <- 15
N_Animals_per_group <- 10


N<- N_Neuron_per_animal*N_Animals_per_group*N_Group

#Create the regressors
AnimalID <- rep((1:(N_Animals_per_group*N_Group)) , rep(N_Neuron_per_animal, N_Animals_per_group*N_Group))
Effect_by_animal <- rnorm(N_Animals_per_group*N_Group,0,100)
Animal_effect <- rep(Effect_by_animal, rep(N_Neuron_per_animal, N_Animals_per_group*N_Group))

GroupID <- rep(1:N_Group, rep(N_Neuron_per_animal*N_Animals_per_group, N_Group))
Group_effect <- 12*GroupID

DV <- Group_effect + Animal_effect +rnorm(N,0,100)

dat <- data.frame("DV" = DV,
                  "GID" = as.factor(GroupID),
                  "AID" = as.factor(AnimalID)
)

#Fixed effect model
model.pooled <- lm(data = dat,
                   DV~GID)
model.fixed <- lm(data = dat,
                  DV~GID+AID)

print(summary(model.fixed))


#Random effect model
model.mixed <- lmer(data = dat,
                    DV~GID + (1|AID),
                    REML = FALSE)
print(summary(model.mixed))

model.partial <- lmer(data = dat,
                      DV~(1|AID),
                          REML =FALSE)
print(anova(model.partial))