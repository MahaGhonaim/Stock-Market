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

### 00. Business Case

* Understand market behaviors and sector performance within the S\&P 500 index.
* Identify trends and anomalies in stock prices, trading volume, and volatility.
* Highlight undervalued companies and high-risk investment sectors.
* Support strategic financial planning for investors and analysts.

---

### 01. Data Collection
The data used in this project was sourced from various reputable platforms, including **Yahoo Finance**, **Wikipedia**, **Kaggle**, and additional **EXCEL** files provided. 
Each source provided different types of data that were crucial for conducting a comprehensive analysis of the American stock market.

* **Yahoo Finance**: We get the data from yahoo finance by using a python code
  
  ![Yahoo Finance Screenshot](https://github.com/mahaghonaim/Stock-Market/DataCollection/Yahoo Finance.PNG?raw=true)
  
* **Wikipedia**: Company sector classifications
* **Kaggle**: Financial metrics and company fundamentals
* **Custom Excel Files**: Preprocessed tables for analysis

---

### 02. Data Cleaning

Performed in **Excel**:

* Corrected data types and formats
* Handled null values and outliers
* Split complex fields (e.g., date formatting)
* Ensured accuracy and consistency across datasets

---

### 03. Database Design

**PostgreSQL** used for advanced analytical queries.

**Tables:**

* `fact_stock`: Stock trading data (open, close, volume, etc.)
* `security`: Company metadata (sector, location, founding year)
* `fact_financial`: Financial performance (EPS, dividends, market cap)
* `sp500_historical_data`: Daily index metrics
* `gio_fact`: Economic indicators (gold, oil, interest rates)
* `date_dim`: Date dimension table for time-based analysis

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
