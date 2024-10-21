evaluate_classifiers <- function(file_path) {
  data <- read.csv(file_path)
  data$RID <- NULL
  
  # Convert the outcome variable to a factor
  data$buys <- as.factor(data$buys)
  
  # Define training and testing partition sizes
  train_partitions <- c(0.4, 0.5, 0.6, 0.7, 0.8)
  test_partitions <- c(0.6, 0.5, 0.4, 0.3, 0.2)
  results <- data.frame()
  
  # Function to evaluate a single partition
  evaluate_model <- function(train_data, test_data) {
    # C5.0 Model
    c50_model <- C5.0(buys ~ ., data = train_data)
    c50_predictions <- predict(c50_model, test_data)
    c50_confusion <- confusionMatrix(c50_predictions, test_data$buys)
    
    # Naïve Bayes Model
    nb_model <- naiveBayes(buys ~ ., data = train_data)
    nb_predictions <- predict(nb_model, test_data)
    nb_confusion <- confusionMatrix(nb_predictions, test_data$buys)
    
    results <- data.frame(
      Train_Size = nrow(train_data),
      Test_Size = nrow(test_data),
      Accuracy_C5.0 = c50_confusion$overall['Accuracy'],
      Sensitivity_C5.0 = c50_confusion$byClass['Sensitivity'],
      Specificity_C5.0 = c50_confusion$byClass['Specificity'],
      Accuracy_NB = nb_confusion$overall['Accuracy'],
      Sensitivity_NB = nb_confusion$byClass['Sensitivity'],
      Specificity_NB = nb_confusion$byClass['Specificity']
    )
    
    return(results)
  }
  
  # Evaluate for each combination of training and testing sizes
  for (train_size in train_partitions) {
    for (test_size in test_partitions) {
      if (train_size + test_size <= 1) {  # Ensure that training and testing sizes are valid
        set.seed(123)  # For reproducibility
        split <- createDataPartition(data$buys, p = train_size, list = FALSE)
        train_data <- data[split, ]
        test_data <- data[-split, ]
        
        if (nrow(test_data) / nrow(data) >= test_size) {
          test_data <- test_data[1:round(test_size * nrow(data)), ]  # Adjust test set size
          
          result <- evaluate_model(train_data, test_data)
          results <- rbind(results, result)
        }
      }
    }
  }
  
  return(results)
}

results <- evaluate_classifiers("ClassificationSimplecases.csv")
print(results)


#             Train_Size Test_Size Accuracy_C5.0 Sensitivity_C5.0 Specificity_C5.0 Accuracy_NB Sensitivity_NB
#Accuracy          43        52     0.7115385        0.6250000        0.7857143   0.6153846      0.6250000
#Accuracy1         43        42     0.6904762        0.5555556        0.7916667   0.5952381      0.5555556
#Accuracy2         43        32     0.6562500        0.5625000        0.7500000   0.5625000      0.5625000
#Accuracy3         43        21     0.6190476        0.4444444        0.7500000   0.5238095      0.4444444
#Accuracy4         53        42     0.7380952        0.6315789        0.8260870   0.7380952      0.6315789
#Accuracy5         53        32     0.7187500        0.6428571        0.7777778   0.7187500      0.6428571
#Accuracy6         53        21     0.6666667        0.5000000        0.8181818   0.6666667      0.5000000
#Accuracy7         64        32     0.8125000        0.6875000        0.9375000   0.8125000      0.6875000
#Accuracy8         64        21     0.8095238        0.7000000        0.9090909   0.8095238      0.7000000
#Accuracy9         75        21     0.7142857        0.6363636        0.8000000   0.7142857      0.6363636

#Specificity_NB
#Accuracy       0.6071429
#Accuracy1      0.6250000
#Accuracy2      0.5625000
#Accuracy3      0.5833333
#Accuracy4      0.8260870
#Accuracy5      0.7777778
#Accuracy6      0.8181818
#Accuracy7      0.9375000
#Accuracy8      0.9090909
#Accuracy9      0.8000000
