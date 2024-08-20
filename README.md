
# 📊 R Script for Data Analysis

Welcome to this data analysis project! Below is a summary of the tasks and analyses conducted using R.

## 🛒 Association Rule Mining with `GrocBinary24.csv`

1. **Frequent Itemsets**: 
   - 🔍 Identified all frequent itemsets with a minimum support of 30%.
  
2. **Association Rules**:
   - 📏 Extracted rules with at least 40% support and 60% confidence.
  
3. **Advanced Rules**:
   - ⚖️ Found rules with at least 30% support, 70% confidence, and lift > 1.

## 🚗 Analyzing the `auto-mpg.csv` Dataset

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

## 🔧 How to Use

1. Install necessary R packages using:
   ```r
   install.packages("arules")
