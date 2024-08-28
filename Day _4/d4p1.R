df <- read.csv("GrocBinary24.csv")
df <- data.frame((df[2:6] == 1))
View(df)
# Part (a): Find frequent item sets with support at least 30%
frequent_itemsets <- apriori(df, parameter=
                               list(support=0.3, confidence = 0.0, target = "frequent itemsets"))
print(data.frame(inspect(frequent_itemsets)))

# Part (b): Generate association rules with support 40% and confidence 60%
rules <- apriori(df, parameter = list(support = 0.40, confidence = 0.60, target = "rules"))
print(rules)

# Part (c): Filter rules with support 30%, confidence 70%, and lift > 1
filtered_rules <- subset(rules, subset = (support >= 0.30 & confidence >= 0.70 & lift > 1))
print(filtered_rules)
