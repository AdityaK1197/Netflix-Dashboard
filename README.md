# 🚀 Netflix Data Cleaning & BI Pipeline

# 🎯 Project Overview

This project implements a SQL-based ETL pipeline for Netflix data. The pipeline ingests raw Netflix data, cleans and transforms it, and organizes it into layers for Business Intelligence (BI) and analytics purposes. The project follows a Bronze → Silver → Gold data architecture pattern.

A) Bronze Layer: Raw data ingestion from CSV/Excel files.

B) Silver Layer: Data cleaning, standardization, and enrichment.

C) Gold Layer: Curated tables and views for analytics and BI dashboards.

This pipeline allows analysts to generate insights on Netflix content, user ratings, and financial performance.

# Database & Schema Structure

Database - 

Database Name: netflix_data_cleaning

Schemas -

A) bronze: Raw ingestion layer.

B) silver: Cleaned and enriched data.

C) gold: Analytical and BI-ready data.

# ETL Pipeline

# Bronze Layer

> Purpose: Load raw Netflix data from CSV/Excel files.

> Key Table: bronze.netflix

> Stored Procedure: bronze.load_bronze

> Operations:

• Creates the table if not exists.

• Loads raw data using BULK INSERT.

• Handles CSV with pipe (|) delimiter and UTF-8 encoding.

# Silver Layer

Purpose: Clean and enrich raw data.

Key Tables:

• silver.netflix – cleaned Netflix shows data.

• silver.category – rating-to-age mapping.

• silver.genre_mapping – genre to broad genre mapping.

• silver.title_imdb_info – IMDb show information.

• silver.imdb_ratings – IMDb ratings.

• silver.country_region_mapping – country-to-region mapping.

• silver.netflix_financials – Netflix financial and subscriber data.

> Stored Procedure: silver.load_silver

Operations:

• Trims, cleans, and formats raw data.

• Converts dates to standard SQL DATE format.

• Standardizes genre and rating information for analytics.

• Loads external IMDb and financial datasets.

# Gold Layer

• Purpose: Create BI-ready views.

Views:

• gold.dim_gold – enriched Netflix content with genres, age groups, IMDb info, and region mapping.

• gold.fact_gold – financial metrics, subscriber metrics, ARPU, growth percentages, and operational KPIs.

Operations:

• Combines data from multiple silver tables.

• Calculates derived metrics like total_subscribers, ARPU, subscriber growth %, and revenue growth %.

• Handles missing values with COALESCE and ISNULL.

# Data Sources

1) Netflix Show Data (netflix_pipe.csv)

2) IMDb Title Data (title.basics.csv)

3) IMDb Ratings Data (title.ratings.csv)

4) Netflix Financials (netflix_financials.csv)

Note: Paths in the SQL scripts may need to be updated according to your local environment.

# Key Features & Metrics

• Content classification by broad genre.

• Age group categorization based on rating.

# Financial analysis:

• Revenue, Expenses, and Operating Income

• Subscriber Acquisition Cost

• ARPU (Average Revenue Per User)

• Subscriber Growth Percentage

• Revenue Growth Percentage

• Integration with IMDb data for enhanced content insights.

# 🚀 Power BI Dashboard

![my image](https://github.com/AdityaK1197/Netflix-Dashboard/blob/f10d162696cd42ab04a31110fbeecd1b6b3f6f20/Netflix_page-1.jpg)

![my image](https://github.com/AdityaK1197/Netflix-Dashboard/blob/1e50935099d40797b3c2db727e3d8c6429afda9e/Netflix_page-2.jpg)

![my image](https://github.com/AdityaK1197/Netflix-Dashboard/blob/5433e63c160f680fb64ef3f8d1d28e9937c890cd/Netflix_page-3.jpg)


# 🎯 Overview

This Power BI report visualizes the Netflix dataset processed through the ETL pipeline. It combines content, financial, and subscriber data to provide actionable business insights.

The dashboard connects to the Gold layer views (gold.dim_gold and gold.fact_gold) in SQL Server, ensuring all visuals are based on cleaned and enriched data.


# Key Features

1) Content Insights

• Total shows by type (Movie / TV Show)

• Distribution by broad genre

• Ratings and age group analysis

• Top directors, countries, and regions

2) Financial Insights

• Annual Revenue, Expenses, and Operating Income

• Profit Before Tax (PBT)

• Marketing and subscriber acquisition cost analysis

3) Subscriber Metrics

• Total subscribers (paid + trial)

• Average Revenue Per User (ARPU)

• Subscriber growth % year over year

• Revenue growth percentage year over year

# Data Source

• SQL Server Views:

1) gold.dim_gold – Netflix content and enrichment data

2) gold.fact_gold – Financial and subscriber metrics

• Power BI connects via DirectQuery or Import Mode depending on the dataset size.

# Visuals & Layout

• Charts & Graphs: Area charts, bar charts, pie charts, and KPIs

• Filters: Year, Genre, Rating, Country/Region

• Interactive Dashboard: Drill-through capabilities for detailed insights

Tip: Ensure the Power BI report refreshes after the latest ETL runs to reflect updated Netflix data.

# Usage

1) Open the Power BI Desktop file (Netflix_Report.pbix).

2) Connect to your SQL Server database (netflix_data_cleaning).

3) Load the gold.dim_gold and gold.fact_gold views.

4) Interact with filters and drill-downs to explore insights.

# Insights Delivered

• Identify trending genres and popular titles.

• Monitor financial health and subscription growth.

• Measure effectiveness of marketing spend through subscriber acquisition cost.


# License

This project is open for educational and research purposes.



