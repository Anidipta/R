jpeg(file="Acceleration.jpeg",
     width = 960,
     height = 960)

hist(auto$acceleration,
     xlab = "Acceleration" ,
     ylab = "Count",
     main = "Histogram of Acceralation")

dev.off()