t=table(auto$cylinders)
print(t)
jpeg(file="Cylinder.jpeg")

barplot(t,
        xlab = "Cylinder",
        ylab = "Count",
        col = blues9 ,
        main = "Frequency Count of Cylinder")



dev.off()