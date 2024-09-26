# Load the data from CSV
df <- read.csv("ClassificationSimplecases.csv", stringsAsFactors = TRUE)

# Inspect the structure of the DataFrame
str(df)

# Prepare the data - Select relevant variables
# Assuming "buys" is the target variable (dependent)
vars <- c("age", "income", "student", "credit_rating")
cc <- df[, c(vars, "buys")]

# Split the data into training and testing sets
set.seed(123)  # Set seed for reproducibility
sz <- nrow(cc) * 0.7
in_train <- sample(1:nrow(cc), size = sz)
train_data <- cc[in_train, ]
test_data <- cc[-in_train, ]

# Train the C5.0 model
tree_mod <- C5.0(x = train_data[, vars], y = train_data$buys)
summary(tree_mod)

# Make predictions on the training data
predict.train <- predict(tree_mod, newdata = train_data, type = "class")
strain <- table(train_data$buys, predict.train, dnn = c("Actual", "Predicted"))

# Make predictions on the test data
predict.test <- predict(tree_mod, newdata = test_data, type = "class")
s <- table(test_data$buys, predict.test, dnn = c("Actual", "Predicted"))

# Calculate accuracy
accuracytrain <- sum(diag(strain)) / sum(strain)
accuracytest <- sum(diag(s)) / sum(s)

# Calculate Sensitivity and Specificity for training data
sensitivity_train <- strain[2, 2] / (strain[2, 2] + strain[2, 1])
specificity_train <- strain[1, 1] / (strain[1, 1] + strain[1, 2])

# Calculate Sensitivity and Specificity for test data
sensitivity_test <- s[2, 2] / (s[2, 2] + s[2, 1])
specificity_test <- s[1, 1] / (s[1, 1] + s[1, 2])

# Print results
cat("Training Accuracy:", accuracytrain, "\n")
cat("Test Accuracy:", accuracytest, "\n")
cat("Training Sensitivity:", sensitivity_train, "\n")
cat("Training Specificity:", specificity_train, "\n")
cat("Test Sensitivity:", sensitivity_test, "\n")
cat("Test Specificity:", specificity_test, "\n")

# 'data.frame':	105 obs. of  6 variables:
#$ RID          : int  1 2 3 4 5 6 7 8 9 10 ...
#$ age          : Factor w/ 3 levels "middle_aged",..: 3 3 1 2 2 2 1 3 3 2 ...
#$ income       : Factor w/ 3 levels "high","low","medium": 1 1 1 3 2 2 2 3 2 3 ...
#$ student      : Factor w/ 2 levels "no","yes": 1 1 1 1 2 2 2 1 2 2 ...
#$ credit_rating: Factor w/ 2 levels "excellent","fair": 1 2 2 1 2 1 2 2 1 2 ...
#$ buys         : Factor w/ 2 levels "no","yes": 1 1 2 1 1 2 2 1 2 1 ...
#Training Accuracy: 0.739726 
#Test Accuracy: 0.78125 
#Training Sensitivity: 0.7894737 
#Training Specificity: 0.6857143 
#Test Sensitivity: 0.8333333 
#Test Specificity: 0.7142857 