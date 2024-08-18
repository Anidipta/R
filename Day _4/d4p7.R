jpeg(file="MPG_bar.jpeg")

barplot(auto$mpg,
     xlab = "MPG" ,
     ylab = "Count",
     col = "blue" ,
     main = "Barplot of MPG")



dev.off()