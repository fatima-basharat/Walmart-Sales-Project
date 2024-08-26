# Walmart-Sales-Project

## Description
This project focuses on analyzing and drawing insights from a dataset containing Walmart sales data. The analysis covers various aspects such as sales performance, unemployment rates, Consumer Price Index (CPI), fuel prices, and other related fields. The project aims to answer key business questions and provide actionable insights based on data-driven findings.

### Data Source:
The dataset used in this project can be downloaded from Kaggle: [Walmart Sales Dataset](https://www.kaggle.com/datasets/mikhail1681/walmart-sales) [accessed on 08/24/24]  
 
## Data Cleaning Practice
[R Source Code](https://github.com/fatima-basharat/Walmart-Sales_Project/blob/main/walmartsales.R)

![image](https://github.com/user-attachments/assets/3ef97db5-df50-4655-89ed-38165faecf4b)

The dataset undergoes rigorous cleaning to ensure accurate and meaningful analysis. The following steps were taken to clean the data:

### Sorting:
Data is sorted first by store number (ascending) and then by date (ascending).

### Date Formatting:
Dates are converted to the format MM-DD-YYYY.

### Rounding:
- Weekly Sales: Rounded to the nearest 2 decimal places.
- Temperature: Rounded to the nearest whole number.
- Fuel Price: Rounded to the nearest 2 decimal places.
- CPI: Rounded to the nearest 3 decimal places.
- Unemployment: Rounded to the nearest 3 decimal places.

### Missing Data:
Ensured that there is no missing data in the dataset.

## Business Questions and Answers:

#### Which holidays affect weekly sales the most?
- Highest: November 25, 2011 (1,479,858 average sales)
- Lowest: December 31, 2010 (898,500 average sales)

#### Which stores have the lowest and highest unemployment rate? What factors impact the unemployment rate?
- Lowest Unemployment: Store 23
- Highest Unemployment: Store 38
- Impacting Factors: Correlation between higher unemployment rates and increased fuel prices.

#### Is there any correlation between CPI and Weekly Sales? How does it differ when the Holiday Flag is 0 vs 1?
- Overall Correlation: -0.0726
- Holiday Correlation: -0.0810
- Non-Holiday Correlation: -0.0719
- Conclusion: Very weak negative correlation, with no significant difference between holidays and non-holidays.

#### Why is Fuel Price included? What conclusions can be made?
- Fuel Price impacts consumer spending power, operational costs, and acts as an economic indicator.
