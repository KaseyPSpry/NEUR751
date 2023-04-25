library("ggplot2")
library("Rmisc")
library("caret")
library("MASS")
library("heplots")
library("rrcov")

dat <- read.table(
  file = "/Volumes/kpotts/11. NEUR PhD Classes/NEUR 751/NEUR 751/livedie_v1.csv",
  header = TRUE,
  sep = ","
) 
dat$LIVED <- as.factor(dat$LIVED)
dat[,2:13] <- scale(dat[,2:13])

lived <- which(dat$LIVED == "1")
died <- which(dat$LIVED == "0")

ttest <- T2.test(dat[lived, 2:13], dat[died, 2:13])
ttest_restricted <- T2.test(dat[lived, 2:5], dat[died, 2:5])

livingcenter <- colMeans(dat[lived,2:13])
deadcenter <- colMeans(dat[died,2:13])
living_cov <- cov(dat[lived,2:13])
dead_cov <- cov(dat[died,2:13])

distance_to_live <- mahalanobis(dat[,2:13], livingcenter, living_cov)
distance_to_die <- mahalanobis(dat[,2:13], deadcenter, dead_cov)

doyoulive <- distance_to_live < distance_to_die

dat$mpredictions <- as.factor(as.numeric(doyoulive))
CM <- confusionMatrix(data = dat$mpredictions, reference = dat[,1])

boxmresult <- boxM(dat[,2:13],dat[,1])

LDA.jack <- lda(data = dat,LIVED ~., CV = TRUE)
CM.LDA <- confusionMatrix(data = LDA.jack$class, reference = dat[,1])

QDA.jack <- qda(data = dat,LIVED ~., CV = TRUE)
CM.QDA <- confusionMatrix(data = QDA.jack$class, reference = dat[,1])

LGR <- glm(data = dat, formula = LIVED~., family = "binomial")
LGR.pred <- as.numeric(predict(LGR, newdata = dat, type = "response")>0.5)
LGR.CM <- confusionMatrix(data = as.factor(LGR.pred), reference = dat[,1])

PCA <- princomp(dat[,2:13])
dat$PCA1 <- PCA$scores[,1]
dat$PCA2 <- PCA$scores[,2]
dat$PCA3 <- PCA$scores[,3]
LGR.PCA <- glm(data = dat, formula = LIVED~PCA1+PCA2+PCA3, family = "binomial")
LGRPCA.pred <- as.numeric(predict(LGR.PCA, newdata = dat[,c(1,14,15,16)], type = "response" )>0.5)
LGR.PCA.CM <- confusionMatrix(data = as.factor(LGRPCA.pred), reference = dat[,1])

print(summary(LGR))
