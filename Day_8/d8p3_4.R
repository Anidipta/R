library(caTools)
library(readxl)

eucli <- function(p1, p2) {
  return(sqrt(sum((p1 - p2) ^ 2)))
}

knn1 <- function(td, tp, k) {
  nn <- ncol(td) - 1
  for (i in 1:nrow(td)) {
    td$dist[i] <- eucli(td[i, 1:nn], tp)
  }
  td <- td[order(td$dist), ]
  df <- td[1:k, ncol(td)]  
  return(as.character(names(which.max(table(df)))))
}

knn2 <- function(td, tp, k) {
  nn <- ncol(td) - 1  
  tp$pred <- NA  
  
  for (i in 1:nrow(tp)) {
    tp$pred[i] <- knn1(td, tp[i, c(1:nn)], k)
  }
  
  misClassError <- mean(tp$pred != tp[[ncol(tp)]])
  print(paste('Accuracy =', 1 - misClassError))
  
  cm <- table(Actual = tp[[ncol(tp)]], Predicted = tp$pred)
  print(cm)
}

classifier <- function(d) {
  set.seed(1234)
  split <- sample.split(d[[ncol(d)]], SplitRatio = 0.7)
  train_cl <- subset(d, split == TRUE)
  test_cl <- subset(d, split == FALSE)
  print(train_cl)
  print(paste("Training samples:", nrow(train_cl)))
  print(paste("Testing samples:", nrow(test_cl)))
  
  knn2(train_cl, test_cl, 3)
}

classifier(iris)
classifier(read_excel("RidingMowers larger dataset.xls"))
