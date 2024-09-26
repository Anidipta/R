# Function to evaluate model performance
evaluate_model_performance <- function(file_path, train_proportions) {
  # Load the data from CSV
  df <- read.csv(file_path, stringsAsFactors = TRUE)
  
  # Prepare the data - Select relevant variables
  vars <- c("age", "income", "student", "credit_rating")
  cc <- df[, c(vars, "buys")]
  
  # Initialize results storage
  results_train <- data.frame(
    Train_Accuracy = numeric(),
    Train_Sensitivity = numeric(),
    Train_Specificity = numeric(),
    stringsAsFactors = FALSE
  )
  
  results_test <- data.frame(
    Test_Accuracy = numeric(),
    Test_Sensitivity = numeric(),
    Test_Specificity = numeric(),
    stringsAsFactors = FALSE
  )
  
  # Loop through each training proportion
  for (proportion in train_proportions) {
    # Split the data into training and testing sets
    set.seed(1234)  # Set seed for reproducibility
    sz <- nrow(cc) * proportion
    in_train <- sample(1:nrow(cc), size = sz)
    train_data <- cc[in_train, ]
    test_data <- cc[-in_train, ]
    
    # Train the C5.0 model
    tree_mod <- C5.0(x = train_data[, vars], y = train_data$buys)
    
    # Make predictions on the training data
    predict.train <- predict(tree_mod, newdata = train_data, type = "class")
    strain <- table(train_data$buys, predict.train, dnn = c("Actual", "Predicted"))
    
    # Make predictions on the test data
    predict.test <- predict(tree_mod, newdata = test_data, type = "class")
    s <- table(test_data$buys, predict.test, dnn = c("Actual", "Predicted"))
    
    # Calculate metrics for training data
    accuracytrain <- sum(diag(strain)) / sum(strain)
    sensitivity_train <- strain[2, 2] / (strain[2, 2] + strain[2, 1])
    specificity_train <- strain[1, 1] / (strain[1, 1] + strain[1, 2])
    
    # Calculate metrics for test data
    accuracytest <- sum(diag(s)) / sum(s)
    sensitivity_test <- s[2, 2] / (s[2, 2] + s[2, 1])
    specificity_test <- s[1, 1] / (s[1, 1] + s[1, 2])
    
    # Store results in the training results DataFrame
    results_train <- rbind(results_train, data.frame(
      Train_Accuracy = accuracytrain,
      Train_Sensitivity = sensitivity_train,
      Train_Specificity = specificity_train,
      stringsAsFactors = FALSE
    ))
    results_test <- rbind(results_test, data.frame(
      Test_Accuracy = accuracytest,
      Test_Sensitivity = sensitivity_test,
      Test_Specificity = specificity_test,
      stringsAsFactors = FALSE
    ))
  }
  rownames(results_train) <- c("40", "50", "60", "70", "80")
  rownames(results_test) <- c("40", "50", "60", "70", "80")
  
  # Combine results
  combined_results <- cbind(results_train, results_test)
  combined_results$Accuracy_Diff <- abs(combined_results$Test_Accuracy - combined_results$Train_Accuracy)
  best_model_index <- which.min(combined_results$Accuracy_Diff)
  best_model <- combined_results[best_model_index, ]
  list(Combined_Results = combined_results, Best_Model = best_model)
}
train_proportions <- c(0.4, 0.5, 0.6, 0.7, 0.8)
performance_results <- evaluate_model_performance("ClassificationSimplecases.csv", train_proportions)
print(performance_results$Combined_Results)
cat("\nBest Model (least accuracy difference):\n")
print(performance_results$Best_Model)


#Train_Accuracy Train_Sensitivity Train_Specificity Test_Accuracy Test_Sensitivity Test_Specificity Accuracy_Diff
#40      0.8571429         0.8500000         0.8636364     0.6507937        0.4722222        0.8888889    0.20634921
#50      0.7884615         0.7142857         0.8750000     0.6792453        0.5000000        0.8800000    0.10921626
#60      0.7777778         0.6875000         0.8709677     0.6666667        0.5000000        0.8888889    0.11111111
#70      0.7123288         0.8108108         0.6111111     0.8437500        0.7894737        0.9230769    0.13142123
#80      0.7380952         0.8292683         0.6511628     0.8095238        0.7333333        1.0000000    0.07142857
#
#Best Model (least accuracy difference):
#  Train_Accuracy Train_Sensitivity Train_Specificity Test_Accuracy Test_Sensitivity Test_Specificity Accuracy_Diff
#80      0.7380952         0.8292683         0.6511628     0.8095238        0.7333333                1    0.07142857