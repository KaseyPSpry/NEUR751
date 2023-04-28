convolvesame = function(signal, kernel){
  result <- convolve(signal, rev(kernel), type = "open")
  totrim <- round(length(kernel)/2) + (1:length(signal))
  return(result[totrim])
}

getwave = function(times, amplitudes, WaveMax, KWidth){

T <- -WaveMax:WaveMax
kernel <- dnorm((-5*KWidth):(5*KWidth),0,KWidth)

imptrace <- array(0,WaveMax)

for (i in 1:length(times)){
  imptrace[times[i]] = amplitudes[i]
}

trace<- convolvesame(imptrace, kernel)
return(trace)
}

test <- getwave(c(20:30), c(1,-0.5), 50, 10)
plot(test)
