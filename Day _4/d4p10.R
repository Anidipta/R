jpeg(file="Miles displacement.jpeg")
pairs(~mpg +displacement, data=auto)


dev.off()

jpeg(file="Miles - disp - hp.jpeg")
pairs(~mpg +displacement+horsepower, data=auto)
dev.off()