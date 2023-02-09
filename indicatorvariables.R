N <- 30
baseSEX <- 160
meaneffectSEX <- 15
maineffectDOSE <- 100
maleenhancement <- 130

sexvalues <- c("MALE", "FEMALE")
dosevalues <- c("BASE", "LOW")
sexes <- rep(sexvalues, c(length(dosevalues)*N, length(dosevalues)*N))
doses <- rep(rep(dosevalues, c(N,N)),length(sexes))
heights <- c(rnorm(N,baseSEX+meaneffectSEX,5), rnorm(N,baseSEX+meaneffectSEX+maineffectDOSE+maleenhancement,5), 
             rnorm(N,baseSEX,5), rnorm(N,baseSEX+maineffectDOSE,5))

binsex <- as.numeric(sexes == "MALE")

dat <- data.frame("sex" = sexes, "height" = heights, "dose" = doses, stringsAsFactors = TRUE)

model <- lm(height~sex+dose+sex:dose, data=dat)

print(summary(model))