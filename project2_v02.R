library("ggplot2")
library("Rmisc")

dat <- read.table(
  file = "/Volumes/kpotts/11. NEUR PhD Classes/NEUR 751/NEUR 751/livedie_v1.csv",
  header = TRUE,
  sep = ","
) 
dat$LIVED <- as.factor(dat$LIVED)
dat[,2:13] <- scale(dat[,2:13])

lived <- which(dat$LIVED == "1")
died <- which(dat$LIVED == "0")

livingcenter <- colMeans(dat[lived,2:13])
deadcenter <- colMeans(dat[died,2:13])
living_cov <- cov(dat[lived,2:13])
dead_cov <- cov(dat[died,2:13])

distance_to_live <- mahalanobis(dat[,2:13], livingcenter, living_cov)
distance_to_die <- mahalanobis(dat[,2:13], deadcenter, dead_cov)

doyoulive <- distance_to_live < distance_to_die
