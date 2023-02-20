library("ggplot2")
library("gtools")


datlong <- read.table('/Users/kaseyspry/Documents/Wake Forest/5. NEUR PhD Classes/1. NEUR 751/NEUR751/behavpharma_v1.csv', 
                      header = TRUE,
                      sep = ",",
                      stringsAsFactors = TRUE)
dat <- reshape(datlong, 
               idvar = "ID", 
               timevar = "PREPOST", 
               direction = "wide",
               v.names = c("ANXIETY", "MEMORY")
               )
dat$DOSE <- factor(dat$DOSE,
                   levels = c("SHAM", "LOW", "MED", "HIGH")
                   )
dat$ANXIETY.PRE.LOGIT <- logit(dat$ANXIETY.PRE)
dat$ANXIETY.POST.LOGIT <- logit(dat$ANXIETY.POST)

model.anxiety <- lm(data = dat, ANXIETY.POST.LOGIT~ANXIETY.PRE.LOGIT + SEX + DOSE +SEX:DOSE)
print(summary(model.anxiety))
print(anova(model.anxiety))
# model.memory <- lm(data = dat,
#             MEMORY.POST~SEX + DOSE + SEX*DOSE + MEMORY.PRE)
# model.anxiety <- lm(data = dat,
#                     ANXIETY.POST~ANXIETY.PRE + SEX + DOSE + SEX*DOSE)
#print(summary(model.anxiety))


# g <- ggplot( data = dat, 
#              aes(x = DOSE, y = ANXIETY.POST.LOGIT, fill = SEX))
# g <- g + geom_violin()
# print(g)