print(auto$cylinders)

auto$cylinders <- factor(auto$cylinders, 
                         levels = c(3,4,5,6,8), 
                         labels = c("3cyl", "4cyl", "5cyl", "6cyl", "8cyl"))
