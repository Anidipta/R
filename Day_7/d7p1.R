# Load and inspect the data
data(credit_data)
str(credit_data)

# Prepare the data
vars <- c("Home", "Seniority")
cc <- credit_data[, c(vars, "Status")]

# Split the data into training and testing sets
sz <- nrow(cc) * 0.7
in_train <- sample(1:nrow(cc), size = sz)
train_data <- cc[in_train,]
test_data <- cc[-in_train,]

# Train the C5.0 model
tree_mod <- C5.0(x = train_data[, vars], y = train_data$Status)
summary(tree_mod)

# Make predictions on the training data
predict.train <- predict(tree_mod, newdata = train_data, type = "class")
strain <- table(train_data$Status, predict.train, dnn = c("Actual", "Predicted"))

# Make predictions on the test data
predict.test <- predict(tree_mod, newdata = test_data, type = "class")
s <- table(test_data$Status, predict.test, dnn = c("Actual", "Predicted"))

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


#  Training Accuracy: 0.7410972 
#  Test Accuracy: 0.736724 
#  Training Sensitivity: 0.9214286 
#  Training Specificity: 0.2805017 
#  Test Sensitivity: 0.9197917 
#  Test Specificity: 0.270557 

