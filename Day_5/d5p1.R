df<- c(1,2,1,3,2,4,4,4,3,2,1,5,5,4,5)
mean(df)
median(df)
getmode <- function(f){
  u<-unique(f)
  u[which.max(tabulate(match(f,u)))]
}
(getmode(df))

df <- data.frame(
  col1 = 1:10,col2 = 11:20,col3 = 30:21,
  col4 = c(3, 5, 2, 1,7, 6, 9, 2, 3, 4)
)

df

# Correlation 
cor(df$col1, df$col2)
cor(df$col1, df$col3)
cor(df$col1, df$col4)
cor(df$col3, df$col4)

cor(df[, c("col1", "col2", "col4")])
cor(df[, c("col2", "col3", "col4")])

cor(df)

# Create a random normal distribution
data <- rnorm(1000)

# Plot the bell curve
hist(data, breaks = 50, probability = TRUE, main = "Bell Curve",col=blues9)
lines(density(data))

# Calculate skewness
skewness(data)

# Create a random vector
n <- 100
min_val <- 1
max_val <- 100
random_vector <- runif(n, min = min_val, max = max_val)
random_vector
# Find the Nth highest value
N <- 5  
sort(random_vector, decreasing = TRUE)[N]

