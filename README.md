# S&P 500 Stock Market Analysis Project

![Market Analysis Banner](https://img.shields.io/badge/Analysis-S%26P%20500-blue)
![Data Analytics](https://img.shields.io/badge/Data-Analytics-green)
![Technologies](https://img.shields.io/badge/SQL-PowerBI-orange)
# Stock Market Analysis (2013–2018)

## Project Description

**•	Background:** 

The stock market is a vital component of the global economy, reflecting investor sentiment and financial stability. Understanding the drivers behind stock performance, such as trading volume, price fluctuations, and sector trends, is essential for both individual and institutional investors.

**•	Objective:** 

The goal of this project is to explore stock market data, focusing on trading patterns, sector-based performance, and stock price fluctuations, to uncover actionable insights that can aid in financial decision-making.

---

## Contents

* [00. Business Case](#00-business-case)
* [01. Data Sources](#01-data-sources)
* [02. Data Cleaning](#02-data-cleaning)
* [03. Database Design](#03-database-design)
* [04. SQL Analysis](#04-sql-analysis)
* [05. Power BI Dashboards](#05-power-bi-dashboards)
* [06. DAX Measures & Calculated Columns](#06-dax-measures--calculated-columns)
* [07. Reports Overview](#07-reports-overview)
* [08. Business Insights](#08-business-insights)
* [09. Contributors](#09-contributors)

---

## 00. Business Case

* Understand market behaviors and sector performance within the S\&P 500 index.
* Identify trends and anomalies in stock prices, trading volume, and volatility.
* Highlight undervalued companies and high-risk investment sectors.
* Support strategic financial planning for investors and analysts.

---

## 01. Data Collection
The data used in this project was sourced from various reputable platforms, including **Yahoo Finance**, **Wikipedia**, **Kaggle**, and additional **EXCEL** files provided. 
Each source provided different types of data that were crucial for conducting a comprehensive analysis of the American stock market.

* **Yahoo Finance**: We get the data from yahoo finance by using a python code
  
 ![Yahoo Finance Screenshot](https://github.com/MahaGhonaim/Stock-Market/blob/main/Data%20Collection/Yahoo%20Finance.PNG?raw=true)
  
* **Wikipedia**: ( https://en.wikipedia.org/wiki/List_of_S%26P_500_companies)
  
   Data regarding company-specific information, such as sector classifications and business descriptions, was gathered from Wikipedia. This allowed for an analysis 
                of stock performance at the sector level, providing insights into how different industries perform in the market.

* **Kaggle**:(https://www.kaggle.com/camnugent/sandp500)
  
   Kaggle datasets were used to obtain additional financial and operational data, such as revenue, profit, and other key metrics. Kaggle hosts a wide range of publicly 
             available datasets, which are useful for in-depth financial and business analysis.

* **Custom Excel Files**: Additional EXCEL files were used to complement the data from the mentioned sources.

  These files contained preprocessed data specifically tailored for the project’s needs, including date dimension tables, GIO Fact, SP500 historical data, and financial fact data.
---
## 02. Data Overview

o	**Stock Fact**: Contains data on stock prices, volume, and trading dates.

o	**Security**: Contains information on the companies (e.g., sector, industry).

o	**Fact Financial**: Includes financial performance metrics like revenue and profit.

o	**SP500 Historical Data**: Provides historical stock performance data for the S&P 500.

o	**GIO-Fact**: Offers additional financial and operational metrics.

o	**Date Dim**: Contains date information for time-based analysis.

---
### 03. Data Cleaning

Performed in **Excel**:
  Data cleaning is an essential step to ensure that the dataset is accurate, consistent, and ready for analysis. Excel was used to clean and prepare the American stock market 
  data. The cleaning process included removing duplicates, handling missing values, correcting data types, and ensuring uniform formatting across the dataset.

**Cleaning Steps**
1. Checking and Correcting Data Types
2. Null Checks (Handling Missing Values)
3. Outliers Detection and Treatment
4. Splitting Columns by Comma (Date Formatting)
5. Ensuring Data Accuracy


---

## 03. Database Design

**PostgreSQL** was used as the primary tool for executing analytical SQL queries on the datasets. Analytical SQL played a critical role in extracting meaningful insights from the stock market data, enabling deep exploration of stock price movements, trading volumes, sector-based performance, and financial metrics.

**Tables:**

* `fact_stock`: Stock trading data (open, close, volume, etc.)
* `security`: Company metadata (sector, location, founding year)
* `fact_financial`: Financial performance (EPS, dividends, market cap)
* `sp500_historical_data`: Daily index metrics
* `gio_fact`: Economic indicators (gold, oil, interest rates)
* `date_dim`: Date dimension table for time-based analysis
  
### Tables Creation

**Stock Fact**

![Stock Table](https://github.com/MahaGhonaim/Stock-Market/blob/main/Tables%20Creation/stock.jpg?raw=true)

**Security**

![Security Table](https://github.com/MahaGhonaim/Stock-Market/blob/main/Tables%20Creation/security.jpg?raw=true)

**Fact Financial**

![Financial Table](https://github.com/MahaGhonaim/Stock-Market/blob/main/Tables%20Creation/financial.jpg?raw=true)

**S&P500 Historical Data**

![S&P 500 Table](https://github.com/MahaGhonaim/Stock-Market/blob/main/Tables%20Creation/s%26p500.jpg?raw=true)

**GIO-Fact**

![GIO Table](https://github.com/MahaGhonaim/Stock-Market/blob/main/Tables%20Creation/gio.jpg?raw=true)

**Date Dim**

![Date Dimension Table](https://github.com/MahaGhonaim/Stock-Market/blob/main/Tables%20Creation/date.jpg?raw=true)


---

### 04. SQL Analysis

Sample questions and queries:

* Top 5 closing prices by sector per year
* Correlation between gold and oil prices
* Undervalued companies by P/E ratio
* Sector with highest trading volume yearly
* Volatility and trading volume across quarters
* Market cap distribution among S\&P 500 companies

---

### 05. Power BI Dashboards

Built interactive dashboards with:

* **S\&P 500 Trends**: Daily index prices, volatility, kurtosis
* **Industry Overview**: Sector-wise performance, growth, and risk
* **Market Capitalization**: Size distribution and stock dominance
* **Share Insights**: Price performance, earnings, undervaluation
* **Economic Indicators**: Oil/gold prices vs. interest rates

---

### 06. DAX Measures & Calculated Columns

Key DAX Implementations:

* Annual % change in close prices, oil, gold, and interest rates
* Volatility measures using standard deviation
* Net profit (EPS \* Outstanding shares)
* Company size categorization (Micro, Small, Mid, Large)
* P/E valuation categories (Under, Fair, Over Valued)
* Oil-to-gold price ratio
* Support and resistance levels per year

---

### 07. Reports Overview

* **Opening Report**: Total companies, sectors, market cap
* **Industry Report**: Symbol performance, volume trends
* **Market Report**: Market cap and outstanding shares
* **S\&P 500 Report**: Historical index data, volatility, YoY return
* **Share Report**: EPS, price performance, annual share change
* **Indicators Report**: Gold/Oil/Interest rates correlations

---

### 08. Business Insights

* Tech and healthcare sectors had the highest trading activity.
* Energy stocks exhibited highest price volatility.
* October often showed peak trading volumes; Q3 showed decline.
* 2018 saw trading spikes due to events like Google data breach and Project Maven.
* Market volatility often correlated with political/economic events.

---

### 09. Contributors

* **Maha Fathy Ghoneim** (Power BI Engineer & SQL Analyst)
* Gehad Abdulhamied Soliman
* Dina Khaled Helal
* Ayat Abdulhamied Abulkhair

**Supervisor:** Eng. Marwan Mokhtar
**Initiative:** Digital Egypt Pioneers (DEPI) – Ministry of Communications and Information Technology

---

📫 For contact or collaboration, email: **[mhghonaim@gmail.com](mailto:mhghonaim@gmail.com)**
