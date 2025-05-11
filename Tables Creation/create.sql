CREATE TABLE date_dim (
    full_date DATE,
    year INTEGER,
    quarter INTEGER,
    month VARCHAR(50),
    week INTEGER,
    day VARCHAR(50)
);

COPY date_dim (full_date, year, quarter, month, week, day)
FROM 'E:\pi\depi\graduate project - Copy\Date_Dim.csv' 
DELIMITER ',' 
CSV HEADER;

CREATE TABLE financial_fact (
    symbol VARCHAR(10),
    price FLOAT,
    price_earnings FLOAT,
    dividend_yield FLOAT,
    earnings_share FLOAT,
    week_high_52 FLOAT,
    week_low_52 FLOAT,
    market_cap FLOAT,
    ebitda BIGINT,
    price_sales FLOAT,
    price_book FLOAT
);


COPY financial_fact (symbol, price, price_earnings, dividend_yield, earnings_share, week_high_52, week_low_52, market_cap, ebitda, price_sales, price_book)
FROM 'E:\pi\depi\graduate project - Copy\Financial_Fact.csv' 
DELIMITER ',' 
CSV HEADER;

DROP TABLE IF EXISTS financial_fact;

CREATE TABLE gio_fact (
    gio_date DATE,
    gold_price NUMERIC,
    oil_price NUMERIC,
    interest_rate NUMERIC
);

COPY gio_fact (gio_date, gold_price, oil_price, interest_rate)
FROM 'E:\pi\depi\graduate project - Copy\GIO-Fact.csv'
DELIMITER ','
CSV HEADER;

CREATE TABLE security (
    symbol VARCHAR(10),
    security TEXT,
    gics_sector TEXT,
    gics_sub_industry TEXT,
    city TEXT,
    state TEXT,
    date_added DATE,
    cik INTEGER,
    founded INTEGER
);
DROP TABLE IF EXISTS security;
COPY security (symbol, security, gics_sector, gics_sub_industry, city, state, date_added, cik, founded)
FROM 'E:\pi\depi\graduate project - Copy\Security.csv'
DELIMITER ','
CSV HEADER
ENCODING 'ISO-8859-1';

CREATE TABLE sp500_historical_data (
    Date DATE,
    Open NUMERIC,
    High NUMERIC,
    Low NUMERIC,
    Close NUMERIC,
    Volume BIGINT
);

COPY sp500_historical_data (Date, Open, High, Low, Close, Volume)
FROM 'E:\pi\depi\graduate project - Copy\SP500_Historical_Data_2013_2018.csv'
DELIMITER ','
CSV HEADER

CREATE TABLE stock_fact (
    Symbol VARCHAR(10),
    Stock_Date DATE,
    Open NUMERIC,
    High NUMERIC,
    Low NUMERIC,
    Close NUMERIC,
    Volume BIGINT
);
COPY stock_fact (Symbol,Stock_Date, Open, High, Low, Close, Volume)
FROM 'E:\pi\depi\graduate project - Copy\Stock_Fact.csv'
DELIMITER ','
CSV HEADER


----------------------------------------------------------------------------------------- 
1--This query provides insights into the overall performance of each stock over the time period 
select year ,gics_sector,symbol , '$' || ROUND(Closing_Price, 2) as Closing_Price
from (
select d.year , s.gics_sector , sf.symbol,avg(sf.Close) AS Closing_Price,dense_rank()over(partition by d.year, s.gics_sector order by avg(sf.Close) desc ) rank
from stock_fact sf inner join security s 
on sf.symbol=s.symbol inner join date_dim d
on sf.Stock_Date =d.full_date
group by d.year,s.gics_sector , sf.symbol
) 
where rank <=5

2-----
select CAST(corr(gold_price ,oil_price) as int)
from gio_fact
3------
select s.symbol,s.security,gics_sector,(market_cap/price) "Outstanding Shares",((market_cap/price)* Earnings_Share )"Net Profit"
from financial_fact f inner join security s
on f.symbol=s.symbol
order by "Net Profit" desc
limit 10
4-----------------corelation betwen volum and price and provit in google for example
select year,Symbol,avg(Volume) Volume,avg(Open+Close+High+Low) PRICE
from  date_dim d inner join stock_fact s 
on s.Stock_Date =d.full_date
where Symbol='GOOGL'
group by year,Symbol
order by avg(Open+Close+High+Low) 
5------------------
select case when market_cap >= 30000000000 then 'Large-Cap'
            when market_cap >= 20000000000 then 'Mid-Cap'
            when market_cap >= 10000000000 then 'Small-Cap'
            else 'Micro-Cap'
end as company_size,count(*) as number_of_companies
from financial_fact
group by company_size
order by company_size;

6----------------P/E Ratio
select *
from
(select symbol,case
        when Price / (case when Earnings_Share = 0 then 1 else Earnings_Share end) < 15 then 'Under Valued'
        when Price / (case when Earnings_Share = 0 then 1 else Earnings_Share end) >= 15 
        and Price  / (case when Earnings_Share = 0 then 1 else Earnings_Share end) <= 25 then'Fairly Valued'
        when Price / (case when Earnings_Share = 0 then 1 else Earnings_Share end) > 25 then 'Over Valued'
        else 'null'
		end as Share_rate 
from financial_fact
group by Share_rate,symbol
order by Share_rate
)
where Share_rate='Under Valued'
7-------------
select case
        when Price / (case when Earnings_Share = 0 then 1 else Earnings_Share end) < 15 then 'Under Valued'
        when Price / (case when Earnings_Share = 0 then 1 else Earnings_Share end) >= 15 
        and Price  / (case when Earnings_Share = 0 then 1 else Earnings_Share end) <= 25 then'Fairly Valued'
        when Price / (case when Earnings_Share = 0 then 1 else Earnings_Share end) > 25 then 'Over Valued'
        else 'null'
		end as Share_rate ,count(*) as number_of_companies
from financial_fact
group by Share_rate
order by Share_rate
8-----------------------------------------------------
select year,gics_sector,Volume
from(
select d.year , s.gics_sector ,avg(sf.Volume)Volume, rank()over(partition by d.year order by avg(sf.Volume) desc) rank
from stock_fact sf inner join security s 
on sf.symbol=s.symbol inner join date_dim d
on sf.Stock_Date =d.full_date
group by d.year ,s.gics_sector
)
where rank=1
9-----Trading Volume per Year 
select year, SUM(Volume) as Total_volume
from sp500_historical_data s inner join date_dim d
on s.date = d.full_date
group by year
order by total_volume desc
10--------Significant Closing Price Changes
with daily_changes as (
    select Date, Close, LAG(Close) over (order by Date) as previous_close
    from sp500_historical_data
)
select Date, Close, previous_close, ((Close - previous_close) / previous_close)*100 as change_percentage
from daily_changes
where (((Close - previous_close) / previous_close) * 100) > 2

11----Best Performing Month------
with monthly_volume as (
    select year, month, SUM(Volume) as total_volume,rank() over (partition by year order by SUM(Volume) desc) as volume_rank
    from sp500_historical_data s inner join date_dim d
	on s.date = d.full_date
    group by year, month
)
select year, month, total_volume
from monthly_volume
where volume_rank = 1
order by year, month

12------Lowest volume in which quarter in which year
with quarterly_volume as (
    select year, quarter, SUM(Volume) as total_volume,
	rank() over (partition by year order by SUM(Volume) asc) as volume_rank

    from sp500_historical_data s inner join date_dim d
	on s.date = d.full_date
    group by year, quarter
)
select year, quarter, total_volume
from quarterly_volume
where volume_rank = 1

