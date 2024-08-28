jpeg(file="MPG.jpeg")

hist(auto$mpg,
     xlab = "MPG" ,
     ylab = "Count",
     col = blues9,
     main = "Histogram of MPG")
dev.off()