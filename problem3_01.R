library(DataExplorer)
library(ggplot2)
library(lme4)

dat <- read.table("/Volumes/kpotts/11. NEUR PhD Classes/NEUR 751/NEUR 751/lightsout_v1.csv")
dat$T <- as.numeric(as.Date(dat$Time))
dat$T <- dat$T - min(dat$T) #Has the time data start at 0 and increase thereafter
dat$Electrode <- as.factor(dat$Electrode)
dat$Cat <- as.factor(dat$Cat)
dat$Environ <- as.factor(dat$Environ)
dat$Age <- as.factor(dat$Age)

g <- ggplot(
  data = dat
) + 
  geom_point(
    aes(
      x = T,
      y = RF,
      color = Age)
  )
print(g)


model <- lmer(
  data = dat,
  formula = RF~Age*Environ*T + (1|Electrode) +(1|Cat),
  REM = FALSE
)
print(summary(model))
