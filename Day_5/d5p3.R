auto = read.csv("auto-mpg.csv")
auto$cylinders <- factor(auto$cylinders,
                         levels = c(3,4,5,6,8),
                         labels = c("3cyl", "4cyl", "5cyl", "6cyl", "8cyl"))

# Single variable plots
#Scatter plot
ggplot(auto, aes(x=weight, y=mpg)) + geom_point()

#Line Graph
ggplot(auto, aes(x=weight, y=mpg)) + geom_line()
ggplot(auto, aes(x=weight, y=mpg)) + geom_line() + geom_point()

ggplot(auto, aes(x=cylinders, y=horsepower)) + geom_col(fill="red")
ggplot(auto, aes(x=mpg, y=horsepower)) + geom_col(fill="green")
ggplot(auto, aes(x=cylinders, y=horsepower)) + geom_col()
ggplot(auto, aes(x=factor(cylinders),y=horsepower)) + geom_col()

# Similar to geom_col()
ggplot(auto, aes(x=cylinders, y=horsepower)) + geom_bar(stat="identity")
ggplot(auto, aes(x=cylinders)) + geom_bar()

#histogram
ggplot(auto, aes(x=cylinders)) + geom_histogram()
auto$cylinders = as.numeric(auto$cylinders)
ggplot(auto, aes(x=cylinders)) + geom_histogram()
ggplot(auto, aes(x=cylinders)) + geom_histogram(bin=30)
ggplot(auto, aes(x=cylinders)) + geom_histogram(binwidth=4)
ggplot(auto, aes(x=cylinders)) + geom_histogram(binwidth=30)

ggplot(auto, aes(x=cylinders, y=horsepower)) + geom_col()
auto$cylinders <- factor(auto$cylinders,
                         levels = c(3,4,5,6,8),
                         labels = c("3cyl", "4cyl", "5cyl", "6cyl", "8cyl"))

ggplot(auto, aes(x=cylinders, y=horsepower)) + geom_col()

#boxplot
ggplot(auto, aes(x=cylinders, y=horsepower)) + geom_boxplot()

#Plotting a function curve
# Plot a user-defined function
myfun <- function(xvar) {
  1 / (1 + exp(-xvar + 10))
}

myfun1 <- function(xvar) {
  (xvar^3-5*xvar)
}

ggplot(data.frame(x = c(-4, 4)), aes(x = x)) +
  stat_function(fun = myfun1, geom = "line")

ggplot(data.frame(x = c(0, 20)), aes(x = x)) +
  stat_function(fun = myfun, geom = "line")

ggplot(data.frame(x = c(0, 20)), aes(x, colour="orange")) +
  stat_function(fun = myfun, geom = "line")

