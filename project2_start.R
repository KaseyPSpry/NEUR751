library("ggplot2")
library("Rmisc")

dat <- read.table(
  file = "/Volumes/home5$/kpotts/11. NEUR PhD Classes/NEUR 751/NEUR 751/livedie_v1.csv",
  header = TRUE,
  sep = ","
) 
dat$LIVED <- as.factor(dat$LIVED)
dat[,2:13] <- scale(dat[,2:13])

lived <- which(dat$LIVED == "1")
died <- which(dat$LIVED == "0")
pca <- princomp(dat[,2:13])

# g1 <- ggplot(
#   data = dat
# ) +
#   geom_point(aes(x = VARS.1, y = VARS.2, col = LIVED))
# g2 <- ggplot(
#   data = dat
# ) +
#   geom_point(aes(x = VARS.2, y = VARS.3, col = LIVED))
# g3 <- ggplot(
#   data = dat
# ) +
#   geom_point(aes(x = VARS.3, y = VARS.4, col = LIVED))
# g4 <- ggplot(
#   data = dat
# ) +
#   geom_point(aes(x = VARS.4, y = VARS.5, col = LIVED))
# 
# multiplot(g1, g2, g3, g4, cols = 2)
