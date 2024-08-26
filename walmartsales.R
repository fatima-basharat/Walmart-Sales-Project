# Data Cleaning

# Installing the packages
install.packages("dplyr")
install.packages("readr")
install.packages("lubridate")
install.packages("ggplot2")

# Loading the packages
library(dplyr)
library(readr)
library(lubridate)
library(ggplot2)

# Loading the data set
df <- read_csv("/Users/fatimabasharat/downloads/walmartsales/Walmart_Sales.csv", locale = locale())


#TASKS 

# Sorting first by Store number then date ascending
df <- df %>%
  # Convert the Date column from dmy to Date object
  mutate(Date = dmy(Date)) %>%
  # Arrange by Store and Date in ascending order
  arrange(Store, Date)


# Fixing date format to mdy
df <- df %>%
  # Format the Date object to mdy
  mutate(Date = format(Date, "%m-%d-%Y"))


# Temperature is rounded to the nearest whole number
df <- df %>%
  mutate(Temperature = round(Temperature))


# Fuel_Price is rounded to the nearest 2 decimal places
df <- df %>%
  mutate(Fuel_Price = round(Fuel_Price, 2))


# CPI is rounded to the nearest 3 decimal places
df <- df %>%
  mutate(CPI = round(CPI, 3))


# Unemployment is rounded to the nearest 3 decimal places
df <- df %>%
  mutate(Unemployment = round(Unemployment, 3))


# Ensure that there is no missing data
missing_data <- sum(is.na(df))
missing_per_column <- colSums(is.na(df))
print(missing_data)
print(missing_per_column)


# Business Questions

# Which holidays affect weekly sales the most?
df <- df %>%
  mutate(Date = dmy(Date))

holiday_sales <- df %>%
  filter(Holiday_Flag == 1) %>%
  group_by(Date) %>%
  summarize(Average_Sales = mean(Weekly_Sales)) %>%
  arrange(desc(Average_Sales))

print(holiday_sales)

ggplot(holiday_sales, aes(x = Date, y = Average_Sales)) +
  geom_bar(stat = "identity") +
  labs(title = "Average Weekly Sales on Holidays",
       x = "Date",
       y = "Average Sales") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))


# Which stores in the dataset have the lowest and highest unemployment rate? 
# What factors do you think are impacting the unemployment rate?
unemployment_by_store <- df %>%
  group_by(Store) %>%
  summarize(Average_Unemployment = mean(Unemployment)) %>%
  arrange(Average_Unemployment)

lowest_unemployment <- unemployment_by_store %>% slice(1)
highest_unemployment <- unemployment_by_store %>% slice(n())

print(lowest_unemployment)
print(highest_unemployment)


# Is there any correlation between CPI and Weekly Sales?  
# How does the correlation differ when the Holiday Flag is 0 versus 
# when the Holiday Flag is 1?
overall_correlation <- cor(df$CPI, df$Weekly_Sales)

holiday_correlation <- df %>%
  filter(Holiday_Flag == 1) %>%
  summarize(Correlation = cor(CPI, Weekly_Sales))

non_holiday_correlation <- df %>%
  filter(Holiday_Flag == 0) %>%
  summarize(Correlation = cor(CPI, Weekly_Sales))

print(overall_correlation)
print(holiday_correlation)
print(non_holiday_correlation)



