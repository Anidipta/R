jpeg(file="Miles per gallon.jpeg")
boxplot(auto$mpg, xlab = "Miles per gallon", 
        col = "lightgray")

dev.off()

jpeg(file="Miles per gallon-Cylinder.jpeg")
boxplot(mpg ~ cylinders, data = auto)
dev.off()