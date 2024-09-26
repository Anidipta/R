# 📊 R Script for Data Analysis

Welcome to this data analysis project! Below is a summary of the tasks and analyses conducted using R across multiple days.

## 🛒 Association Rule Mining with `GrocBinary24.csv`

### Day 4 Tasks

1. **Frequent Itemsets**: 
   - 🔍 Identified all frequent itemsets with a minimum support of 30%.
  
2. **Association Rules**:
   - 📏 Extracted rules with at least 40% support and 60% confidence.
  
3. **Advanced Rules**:
   - ⚖️ Found rules with at least 30% support, 70% confidence, and lift > 1.

## 🚗 Analyzing the `auto-mpg.csv` Dataset

### Day 4 Tasks

1. **Data Loading and Initial Exploration**:
   - 📄 Loaded the dataset and displayed the first few rows.
   - 📊 Showed the number of rows, columns, and summary statistics.
   - 🏷️ Listed the column names.

2. **Working with Factors**:
   - 🔄 Converted the `cylinders` column to a factor with descriptive labels.

3. **Visualizations**:
   - 📈 **Histogram of Acceleration**: Plotted to show the distribution of acceleration.
   - 📉 **Histogram of MPG**: Plotted to show the distribution of miles per gallon.
   - 📊 **Barplot of MPG**: Visualized the miles per gallon as a bar plot.
   - 🔢 **Frequency Count of Cylinders**: Counted and plotted the frequency of each cylinder type.

4. **Boxplots**:
   - 📦 **MPG Distribution**: Created a boxplot for MPG.
   - 🚗 **MPG by Cylinders**: Boxplot of MPG grouped by the number of cylinders.

5. **Pair Plots**:
   - 🔗 **MPG vs. Displacement**: Pair plot to explore relationships between MPG and displacement.
   - 🔗 **MPG, Displacement, and Horsepower**: Pair plot to explore relationships among MPG, displacement, and horsepower.

---

## 📊 Decision Trees with C5.0

### Day 7 Overview
This section focuses on decision trees using the C5.0 algorithm. We will explore concepts like **accuracy**, **sensitivity**, and **specificity** of classifiers using different training/test splits on multiple datasets.

### Requirements

Make sure you have the following libraries installed:

- **caret**: For creating and evaluating classification models.
- **C50**: To implement the C5.0 algorithm for decision trees.
- **modeldata**: To use sample datasets for training and testing.

```r
install.packages("caret")
install.packages("C50")
install.packages("modeldata")
```

Load the libraries:

```r
library(caret)
library(C50)
library(modeldata)
```

### 🔍 Problems and Solutions

This repository focuses on solving common problems such as:
- Training and testing C5.0 models with different data splits.
- Analyzing **accuracy**, **sensitivity**, and **specificity** for training and test sets.
- Evaluating models with and without rules.
- Comparing model performance across various training partitions: **40%, 50%, 60%, 70%, and 80%**.

---

## 🔧 How to Use the Analysis Scripts

1. **Run the Association Rule Mining**:
   - Load the `GrocBinary24.csv` dataset and execute the analysis.

2. **Analyze the `auto-mpg.csv` Dataset**:
   - Load the dataset and run the visualizations and boxplots.

3. **Implement Decision Trees**:
   - Follow the requirements to set up the environment and execute the C5.0 decision tree analyses.

---
