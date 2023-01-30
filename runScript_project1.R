data_file <- "behavpharma_v1.csv"

# Load in Data
data <- read.csv(
  file = data_file,
  header = TRUE,
  stringsAsFactors = TRUE
)

#Visualization of dependent variables
hist(data$ANXIETY)
hist(data$MEMORY)

# Visualization of Anxiety variable by independent variables (sex, dose, and pre v post)
par(mfrow = c(4,4)) #plots in multiframe mode
for(sex in c("MALE", "FEMALE")){ 
  for (prepost in c("PRE","POST")){
    for(dose in c("SHAM","LOW","MED","HIGH")){
      thegroup <- which((sex==data$SEX)&(dose==data$DOSE)&(prepost==data$PREPOST))
      hist(data$ANXIETY[thegroup],xlab = paste(sex,",", dose,",", prepost),main = "Anxiety")
    }
  }
}

# Visualization of Memory variable by independent variables (sex, dose, and pre v post)
par(mfrow = c(4,4)) #plots in multiframe mode
for(sex in c("MALE", "FEMALE")){ 
  for (prepost in c("PRE","POST")){
    for(dose in c("SHAM","LOW","MED","HIGH")){
      thegroup <- which((sex==data$SEX)&(dose==data$DOSE)&(prepost==data$PREPOST))
      hist(data$MEMORY[thegroup],xlab = paste(sex,",", dose,",", prepost),main = "Memory")
    }
  }
}