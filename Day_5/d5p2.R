df<-read.csv("ClassificationSimpleLab.csv")

df
df[1:5]
df[6]
sapply(df, function(x) n_distinct(x))

df %>% group_by(buys_computer) %>% summarise_all(n_distinct)

class_variable_name <- colnames(df)[ncol(df)]
result <- lapply(colnames(df)[2:5], function(col) {
  cat("\nVariable:", col)
  print(table(df[[col]], df[[class_variable_name]]))
})

