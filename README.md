# 📡 Telecom Customer Churn Analysis

> 🧠 **An end-to-end SQL data analytics project that transforms telecom customer records into meaningful churn, customer-behavior, partner, geographic and retention insights.**

[SQL](https://www.microsoft.com/en-us/sql-server)
![image](https://img.shields.io/badge/SQL-Analysis-0078D4?logo=microsoftsqlserver&logoColor=white)
[Microsoft SQL Server](https://www.microsoft.com/en-us/sql-server)
![image](https://img.shields.io/badge/Database-SQL%20Server-CC2927?logo=microsoftsqlserver&logoColor=white)
[Data Analytics](https://github.com/)
![image](https://img.shields.io/badge/Project-Data%20Analytics-7B61FF)
[GitHub](https://github.com/)
![image](https://img.shields.io/badge/Portfolio-SQL%20Project-181717?logo=github)

------------------------------------------------------------------------

## 📌 Project at a Glance

| **🧩 Component** | **🔧 Technology / Description** |
|---|---|
| 📊 Project Type | **SQL Data Analytics / Customer Churn & Retention Analysis** |
| 📥 Primary Data | **Telecom Customer Churn Dataset** |
| 🗄️ Database | **Microsoft SQL Server** |
| 🔎 Query Language | **SQL / T-SQL** |
| 📈 Analysis | **KPI, univariate, bivariate and multivariate analysis** |
| 📦 Records | **10,000 customer records** |
| 👥 Churned Customers | **2,037 customers** |
| 📡 Telecom Partners | **4 partners** |
| 🌍 Geography | **State, city and pincode-level analysis** |
| 📅 Customer Data | **Registration and customer profile information** |

------------------------------------------------------------------------

## 🎯 Project Goal

**Convert raw telecom customer records into actionable churn and retention intelligence through SQL database management, KPI analysis, customer segmentation, dimensional analysis, advanced aggregations, CTEs, subqueries and CASE statements.**

------------------------------------------------------------------------

## ✨ Key Features

-   📊 **Total Customer & Churn KPI Analysis**
-   🚨 **Overall Churn Rate Analysis**
-   📡 **Telecom Partner Performance Analysis**
-   👥 **Customer Demographic Analysis**
-   🌍 **State, City & Pincode Analysis**
-   📱 **Calls, SMS & Data Usage Analysis**
-   💰 **Estimated Salary Segmentation**
-   🎂 **Age Group Segmentation**
-   🔗 **Bivariate Relationship Analysis**
-   🧠 **Multivariate Churn Analysis**
-   🎯 **Retention Priority Segment Analysis**
-   🏆 **Highest-Churn Partner / State Identification**
-   📈 **Customer Usage Behavior Analysis**
-   🪟 **CTEs, CASE Statements & Aggregations**
-   📤 **Query Results Exported in CSV Format**
-   📊 **Dashboard-oriented Business Reporting**

------------------------------------------------------------------------

## 🏗️ Project Architecture

``` text
📥 Telecom Customer Churn Dataset
              ↓
🗄️ SQL Server Database
              ↓
📋 telecom_churn Table
              ↓
┌─────────────────────────────┐
│                             │
▼                             ▼
📊 KPI Analysis          📈 Univariate Analysis
│                             │
└──────────────┬──────────────┘
               ↓
        🔗 Bivariate Analysis
               ↓
        🧠 Multivariate Analysis
               ↓
        📤 CSV Query Results
               ↓
        📊 Dashboard / Report
               ↓
        🎯 Retention Insights
```

------------------------------------------------------------------------

## 🛠️ Tech Stack

-   🗄️ **Microsoft SQL Server**
-   🔎 **T-SQL / SQL**
-   📊 **SQL Data Analytics**
-   🧮 **Aggregations & Calculated Metrics**
-   🧠 **CTEs & Subqueries**
-   🏷️ **CASE WHEN Segmentation**
-   📍 **Geographic Analysis**
-   👥 **Customer Segmentation**
-   📤 **CSV Query Results**
-   📈 **Dashboard & Data Visualization**
-   📝 **GitHub Documentation**

------------------------------------------------------------------------

## 🚀 Getting Started

### 1️⃣ Clone the Repository

``` bash
git clone <YOUR_GITHUB_REPOSITORY_URL>
cd Telecom-Customer-Churn-Analysis
```

### 2️⃣ Open SQL Server

Open **SQL Server Management Studio (SSMS)** or another SQL Server-compatible client.

### 3️⃣ Create the Database

Open:

``` text
database/Telecom_Customer_Churn_Database.sql
```

Run the script.

The script creates:

``` text
Telecom_Churn_DB
```

and the main table:

``` text
dbo.telecom_churn
```

### 4️⃣ Run the Analysis

Open:

``` text
queries/SQL_QUERY.sql
```

Run the analysis in this order:

``` text
Phase 1 → KPI Analysis
Phase 2 → Univariate Analysis
Phase 3 → Bivariate Analysis
Phase 4 → Multivariate Analysis
```

### 5️⃣ Review Query Results

The generated outputs can be exported as CSV files and stored in:

``` text
results/
```

The project contains separate result folders for all four analytical phases.

### 6️⃣ Review the Dashboard

Open the dashboard image and project report included in the repository.

> 💡 **Note:** The exact database/query file locations can be changed according to the final GitHub folder structure.

------------------------------------------------------------------------

## 📂 Repository Structure

``` text
Telecom-Customer-Churn-Analysis/
│
├── 📁 database/
│   └── Telecom_Customer_Churn_Database.sql
│
├── 📁 queries/
│   └── SQL_QUERY.sql
│
├── 📁 results/
│   ├── 📁 Phase_1_KPI/
│   ├── 📁 Phase_2_Univariate/
│   ├── 📁 Phase_3_Bivariate/
│   └── 📁 Phase_4_Multivariate/
│
├── 📁 dashboard/
│   └── Telecom Churn Analysis Dashboard.png
│
├── 📁 data-model/
│   └── Telecom_Customer_Churn_Data_Model.png
│
├── 📁 reports/
│   └── Telecom_Customer_Churn_SQL_Project_Report.pdf
│
├── 📄 README.md
└── 📄 LICENSE
```

------------------------------------------------------------------------

# Table of Contents

1.  Introduction
2.  Project Overview
3.  Problem Statement
4.  Objectives
5.  Scope of the Project
6.  **Data Source** and Data Fields
7.  Data Understanding
8.  System Architecture
9.  Data Model / ER Design
10. **Database** Design
11. Data Cleaning and Preparation
12. Data Classification
13. **SQL** **Analytics**
14. **Python** **Analytics**
15. **Risk Analysis**
16. Dashboard Design
17. Functional Requirements
18. Non-Functional Requirements
19. Project Workflow
20. Testing Strategy
21. **Limitations**
22. **Future Enhancements**
23. Conclusion
24. Suggested Project Folder Structure
25. Key Definitions

------------------------------------------------------------------------

# 1. 📖 Introduction

The **Telecom Customer Churn Analysis** project is a SQL-based data analytics solution designed to convert raw telecom customer information into structured customer-retention intelligence.

The source dataset contains customer-level information including **customer ID, telecom partner, gender, age, state, city, pincode, registration date, number of dependents, estimated salary, calls made, SMS sent, data used and churn status**.

The system is designed around a **Microsoft SQL Server database**, with **T-SQL** providing the main analytical layer. The analysis progresses from basic KPIs to univariate, bivariate and multivariate analysis.

The final outputs support **churn analysis, partner comparison, geographic analysis, customer usage behavior, customer segmentation and retention-priority analysis**.

------------------------------------------------------------------------

# 2. 🔎 Project Overview

The project follows an end-to-end SQL analytics pipeline:

1.  Load the **Telecom Customer Churn Dataset**.
2.  Create the **Telecom_Churn_DB** database.
3.  Create the `dbo.telecom_churn` customer table.
4.  Store customer records in SQL Server.
5.  Run **Phase 1 KPI Analysis**.
6.  Run **Phase 2 Univariate Analysis**.
7.  Run **Phase 3 Bivariate Analysis**.
8.  Run **Phase 4 Multivariate Analysis**.
9.  Export analytical query results to **CSV**.
10. Convert analytical outputs into understandable churn insights and retention recommendations.

------------------------------------------------------------------------

# 3. ❗ Problem Statement

A large telecom customer dataset contains many demographic, geographic and usage variables, but raw customer records alone do not clearly reveal **why customers churn or which segments should receive retention attention**.

Important questions include:

-   🚨 What percentage of customers have churned?
-   👥 How many customers have left the telecom company?
-   📡 Which telecom partner has the highest churn rate?
-   🏆 Which telecom partner has the largest customer base?
-   🌍 Which states have the highest churn rates?
-   🏙️ Which cities have the highest customer concentration or churn?
-   🎂 Which age group has the highest churn?
-   💰 How does churn vary across salary groups?
-   📞 Does call usage differ between churned and non-churned customers?
-   💬 Does SMS usage differ according to churn status?
-   📱 Does data usage differ between churned and non-churned customers?
-   👤 Does churn differ by gender?
-   🔗 How do partner, age, gender, salary and usage interact with churn?
-   🎯 Which customer segments should the retention team prioritize?

The project addresses these questions by using structured **SQL analysis** to convert raw customer records into clear churn metrics, comparisons and retention-oriented insights.

------------------------------------------------------------------------

# 4. 🎯 Objectives

-   Create a structured **SQL Server database** for telecom customer data.
-   Store and analyze customer records.
-   Calculate total customers and total churned customers.
-   Calculate the overall churn rate.
-   Compare customer volume across telecom partners.
-   Compare churn rates across telecom partners.
-   Analyze customer distribution by state, city and pincode.
-   Analyze customer age and demographic patterns.
-   Analyze estimated salary groups.
-   Analyze calls, SMS and data usage.
-   Study relationships between churn and customer characteristics.
-   Use **CTEs, CASE statements, aggregations and subqueries** for advanced analysis.
-   Perform bivariate analysis.
-   Perform multivariate analysis.
-   Identify retention-priority customer segments.
-   Generate CSV outputs for reporting and visualization.
-   Produce dashboard-ready business insights.

------------------------------------------------------------------------

# 5. 📦 Scope of the Project

## **5.1 Included**

-   **SQL Server database** creation.
-   `telecom_churn` customer table.
-   Customer churn analysis.
-   Telecom partner analysis.
-   Geographic analysis.
-   Customer demographic analysis.
-   Customer usage analysis.
-   Age-group analysis.
-   Salary-group analysis.
-   Gender analysis.
-   Registration-date analysis.
-   KPI analysis.
-   Univariate analysis.
-   Bivariate analysis.
-   Multivariate analysis.
-   Retention-priority segmentation.
-   SQL query result exports in CSV.
-   Dashboard-oriented reporting.

## **5.2 Optional / Future Extensions**

-   Power BI interactive dashboard.
-   Automated CSV generation.
-   Scheduled SQL reporting.
-   Customer lifetime value analysis.
-   Predictive churn modeling.
-   Machine learning classification.
-   Customer segmentation using clustering.
-   Real-time churn monitoring.
-   Cloud database deployment.
-   Automated retention alerts.

------------------------------------------------------------------------

# 6. **Data Source** and Data Fields

The project uses the **Telecom Customer Churn Dataset**, loaded into SQL Server as the `dbo.telecom_churn` table.

The analytical SQL file uses the following customer fields:

| Field | Type / Meaning | Use |
|---|---|---|
| `customer_id` | Customer identifier | Customer-level analysis |
| `telecom_partner` | Telecom partner | Partner analysis |
| `gender` | Customer gender | Demographic analysis |
| `age` | Customer age | Age and segmentation analysis |
| `state` | Customer state | Geographic analysis |
| `city` | Customer city | Geographic analysis |
| `pincode` | Customer pincode | Location distribution |
| `date_of_registration` | Registration date | Registration analysis |
| `num_dependents` | Number of dependents | Customer profile analysis |
| `estimated_salary` | Estimated customer salary | Salary segmentation |
| `calls_made` | Number of calls made | Usage analysis |
| `sms_sent` | Number of SMS sent | Usage analysis |
| `data_used` | Mobile data consumed | Usage analysis |
| `churn` | Churn indicator | Churn analysis |

------------------------------------------------------------------------

# 7. 🧠 Data Understanding

The dataset is a **customer-oriented telecom dataset**.

Each row represents a customer record containing:

-   🆔 Customer ID
-   📡 Telecom partner
-   👤 Gender
-   🎂 Age
-   🌍 State
-   🏙️ City
-   📍 Pincode
-   📅 Registration date
-   👨‍👩‍👧 Number of dependents
-   💰 Estimated salary
-   📞 Calls made
-   💬 SMS sent
-   📱 Data used
-   🚨 Churn status

The strongest directly supported analyses are:

-   Customer churn
-   Telecom partner performance
-   Geographic distribution
-   Customer demographic analysis
-   Age-group analysis
-   Salary-group analysis
-   Calls usage
-   SMS usage
-   Data usage
-   Registration patterns
-   Customer retention segmentation

------------------------------------------------------------------------

# 8. 🏗️ System Architecture

The architecture separates database creation, SQL analysis, result generation and presentation.

| Layer | Responsibility | Technology |
|---|---|---|
| 📥 Data Layer | Source telecom customer records | CSV Dataset |
| 🗄️ Database Layer | Structured customer storage | Microsoft SQL Server |
| 🔎 Query Layer | Business and churn analysis | T-SQL |
| 📊 Analytics Layer | KPIs, trends and comparisons | SQL |
| 📤 Output Layer | Query result files | CSV |
| 📈 Visualization Layer | Charts and dashboard | Dashboard / BI tools |
| 📝 Reporting Layer | Documentation | PDF / GitHub README |

## Architecture Flow

``` text
Telecom Customer Churn Dataset
        |
        v
Database.sql
        |
        v
Telecom_Churn_DB
        |
        v
dbo.telecom_churn
        |
        +------------------+
        |                  |
        v                  v
Phase 1 KPI          Phase 2 Univariate
Analysis             Analysis
        |                  |
        +--------+---------+
                 |
                 v
        Phase 3 Bivariate
             Analysis
                 |
                 v
       Phase 4 Multivariate
             Analysis
                 |
                 v
          CSV Results
                 |
                 v
        Dashboard / Report
                 |
                 v
       Retention Insights
```

------------------------------------------------------------------------

# 9. 🗂️ Data Model / ER Design

The project uses a customer-focused relational design.

The central analytical table is:

``` text
dbo.telecom_churn
```

### Proposed Data Model

``` text
                    +------------------------------+
                    |       telecom_churn           |
                    |------------------------------|
                    | customer_id                   |
                    | telecom_partner               |
                    | gender                        |
                    | age                           |
                    | state                         |
                    | city                          |
                    | pincode                       |
                    | date_of_registration          |
                    | num_dependents                |
                    | estimated_salary              |
                    | calls_made                    |
                    | sms_sent                      |
                    | data_used                     |
                    | churn                         |
                    +---------------+--------------+
                                    |
              +---------------------+----------------------+
              |                     |                      |
              v                     v                      v
        📡 Telecom Partner     👤 Customer Profile    🌍 Geography
              |                     |                      |
              |              Age / Gender / Salary    State / City /
              |              Dependents              Pincode
              |                     |                      |
              +---------------------+----------------------+
                                    |
                                    v
                         📊 Churn & Usage Analysis
                                    |
                                    v
                         🎯 Retention Insights
```

The single customer table contains the complete customer-level information required by the four SQL analysis phases.

------------------------------------------------------------------------

# 10. **Database** Design

## **Core Table**

| Table | Key Fields | Purpose |
|---|---|---|
| `dbo.telecom_churn` | `customer_id`, `telecom_partner`, `gender`, `age`, `state`, `city`, `pincode`, `date_of_registration`, `num_dependents`, `estimated_salary`, `calls_made`, `sms_sent`, `data_used`, `churn` | Central telecom customer analysis table |

## **Relationship Logic**

The customer table supports analytical grouping across:

-   One telecom partner → many customer records.
-   One state → many customer records.
-   One city → many customer records.
-   One age group → many customer records.
-   One salary group → many customer records.
-   One churn status → many customer records.
-   Each customer contains demographic and usage attributes.

These dimensions are combined through SQL `GROUP BY`, CTEs, CASE expressions and aggregations to produce higher-level churn and retention insights.

------------------------------------------------------------------------

# 11. 🧹 Data Cleaning and Preparation

The SQL database setup prepares the dataset for analysis by:

1.  Creating the required database.
2.  Creating the customer table.
3.  Defining appropriate SQL data types.
4.  Loading the customer records.
5.  Converting source values into queryable SQL fields.
6.  Creating analytical customer segments using `CASE`.
7.  Grouping customers by age, salary, partner, geography and usage.
8.  Calculating churn counts and churn rates.
9.  Preparing the data for CSV result generation.
10. Making the dataset directly queryable through T-SQL.

------------------------------------------------------------------------

# 12. 🏷️ Data Classification

The project classifies the customer data into analytical business dimensions.

| Classification | Examples | Purpose |
|---|---|---|
| 👥 Customer Profile | Gender, age, dependents, salary | Customer segmentation |
| 📡 Telecom Partner | Partner A, Partner B, Partner C, Partner D | Partner comparison |
| 🌍 Geography | State, city, pincode | Geographic analysis |
| 📱 Usage | Calls, SMS, data | Usage behavior |
| 🚨 Churn | Churned / non-churned | Retention analysis |
| 📅 Registration | Registration date | Customer lifecycle analysis |
| 💰 Salary | Low / Medium / High | Financial segmentation |
| 🎂 Age | Under 25, 25-34, 35-44, etc. | Age segmentation |

These classifications allow the same customer table to answer many different business questions.

------------------------------------------------------------------------

# 13. **SQL** **Analytics**

The SQL analysis is divided into four phases.

## **13.1 Phase 1 --- KPI Analysis**

Phase 1 establishes the overall customer-churn performance baseline.

The project calculates:

1.  👥 Total Customers
2.  🚨 Total Churned Customers
3.  📊 Overall Churn Rate
4.  📡 Customers by Telecom Partner
5.  🚨 Churn Rate by Telecom Partner
6.  🏆 Largest Telecom Partner
7.  🌍 Customer Distribution by State
8.  🚨 Highest-Churn State
9.  🏙️ City with Highest Customer Base
10. 📱 Average Data Usage
11. 📞 Average Calls Made
12. 💬 Average SMS Usage
13. 💰 Average Estimated Salary
14. 🎂 Average Customer Age
15. 👨‍👩‍👧 Average Number of Dependents

### Example --- Overall Churn Rate

``` sql
WITH T1 AS (
    SELECT
        COUNT(*) AS Total_Customers,
        SUM(
            CASE
                WHEN churn = 1 THEN 1
                ELSE 0
            END
        ) AS Total_Churned_Customers
    FROM telecom_churn
)
SELECT *,
       Total_Churned_Customers * 100.0 / Total_Customers
       AS Percentage_Churned_Customers
FROM T1;
```

The KPI uses conditional aggregation to calculate total customers, churned customers and the resulting churn percentage.

------------------------------------------------------------------------

## **13.2 Phase 2 --- Univariate Analysis**

Phase 2 studies individual dimensions independently.

### 👤 Customer Profile

-   Customer age distribution
-   Gender distribution
-   Customer dependents distribution
-   Estimated salary distribution
-   Age group distribution
-   Salary group distribution

### 📡 Telecom Partner

-   Telecom partner distribution

### 🚨 Customer Churn

-   Churn distribution

### 🌍 Geography

-   State-wise customer distribution
-   City-wise customer distribution
-   Pincode distribution

### 📱 Customer Usage Behavior

-   Call usage distribution
-   SMS usage distribution
-   Data usage distribution

### 📅 Registration

-   Registration date distribution

------------------------------------------------------------------------

## **13.3 Phase 3 --- Bivariate Analysis**

Phase 3 studies relationships between two customer dimensions.

Examples include:

-   🚨 Churn vs Gender
-   🎂 Churn vs Age Group
-   👨‍👩‍👧 Churn vs Number of Dependents
-   💰 Churn vs Salary Group
-   📞 Churn vs Calls Made
-   💬 Churn vs SMS Usage
-   📱 Churn vs Data Usage
-   📡 Telecom Partner vs Customer Count
-   🚨 Telecom Partner vs Churn
-   📱 Telecom Partner vs Data Usage
-   🌍 State vs Churn
-   🏙️ City vs Churn
-   👤 Gender vs Customer Usage
-   🎂 Age Group vs Data Usage
-   📞 Age Group vs Call Usage

This phase moves beyond simple counts and investigates how customer attributes and usage behavior relate to churn.

------------------------------------------------------------------------

## **13.4 Phase 4 --- Multivariate Analysis**

Phase 4 combines multiple customer dimensions to produce deeper insights.

### 🔥 Key Analyses

-   📡 Telecom Partner + Age Group + Churn
-   👤 Telecom Partner + Gender + Churn
-   💰 Telecom Partner + Salary Group + Churn
-   📱 Telecom Partner + Usage + Churn
-   🌍 Telecom Partner + State + Age Group
-   💰 Salary Group + Usage + Churn
-   🏙️ City + Partner + Churn
-   📱 Usage Level + Partner + Churn
-   🎯 Retention Priority Segments
-   🧠 Multi-variable customer segmentation

The final retention-oriented analysis combines **telecom partner, age group, data-usage group and churn** to identify segments that can be prioritized for further retention investigation.

------------------------------------------------------------------------

# 14. **Python** **Analytics**

Python is **not required for the core SQL analysis**.

The main analytical engine of this project is Microsoft SQL Server and T-SQL.

Python can optionally be used for:

-   📤 Reading exported CSV query results
-   📊 Additional visualization
-   📈 Chart generation
-   🧹 Supporting data preparation
-   📋 Automated reporting
-   📑 Combining multiple SQL outputs
-   🖼️ Creating portfolio-ready visuals
-   🤖 Building future predictive churn models

For the core project, the SQL scripts can be executed directly in SQL Server Management Studio.

------------------------------------------------------------------------

# 15. **Risk Analysis**

This project is focused on **customer churn and retention risk**, so risk analysis is treated as a business-performance and customer-retention analysis.

Possible analytical risk indicators include:

| Indicator | Meaning | Data Requirement |
|---|---|---|
| 🚨 Churn Rate | Percentage of customers leaving | Available |
| 📡 Partner Churn | Churn concentration by partner | Available |
| 🌍 Geographic Churn | High-risk states/cities | Available |
| 🎂 Age Risk | Churn differences across age groups | Available |
| 💰 Salary Risk | Churn differences across salary groups | Available |
| 📱 Usage Risk | Churn patterns across usage levels | Available |
| 👤 Demographic Risk | Churn differences by gender/dependents | Available |
| 🎯 Retention Priority | Combined customer-risk segments | Available |

These metrics can help management identify customer groups where retention efforts may deserve greater attention.

------------------------------------------------------------------------

# 16. 📊 Dashboard Design

The project dashboard is designed to communicate the SQL analysis visually.

The supplied dashboard concept includes:

-   👥 Total Customers
-   🚨 Churned Customers
-   📊 Overall Churn Rate
-   📱 Average Data Used
-   📡 Telecom Partners
-   📡 Churn Rate by Telecom Partner
-   🎂 Churn Rate by Age Group
-   🌍 Churn Rate by State
-   🔄 Four Phases of SQL Analysis
-   💡 Business Outcome / Retention Insights

### Dashboard Purpose

The dashboard converts SQL query outputs into:

-   KPI cards
-   Partner comparisons
-   Geographic comparisons
-   Churn-rate charts
-   Customer segmentation views
-   Business summaries
-   Retention-oriented insights

> 💡 **Dashboard Data Note:** The dashboard is used as the visual presentation layer for the telecom churn project. The SQL database and query results should be treated as the source of truth for reproducible analysis.

------------------------------------------------------------------------

# 17. ⚙️ Functional Requirements

The system shall:

1.  Create the SQL Server database.
2.  Create the `telecom_churn` table.
3.  Store telecom customer records.
4.  Calculate total customers.
5.  Calculate total churned customers.
6.  Calculate overall churn rate.
7.  Analyze telecom partner performance.
8.  Analyze state and city performance.
9.  Analyze customer demographics.
10. Analyze customer usage.
11. Analyze age and salary groups.
12. Perform bivariate analysis.
13. Perform multivariate analysis.
14. Identify retention-priority segments.
15. Export query results to CSV.
16. Provide data for dashboard/reporting.

------------------------------------------------------------------------

# 18. 🛡️ Non-Functional Requirements

### Accuracy

All calculations should be reproducible directly from the stored SQL data.

### Performance

SQL aggregations should remain efficient for the dataset size.

### Usability

Query names, analysis phases and CSV outputs should be easy to understand.

### Maintainability

Database creation and analytical queries are separated into:

``` text
Telecom_Customer_Churn_Database.sql
SQL_QUERY.sql
```

### Scalability

The design can later be extended with:

-   Customer history
-   Service-plan information
-   Billing data
-   Contract information
-   Complaint/support data
-   Customer lifetime value
-   Additional time periods
-   Machine-learning predictions

### Reliability

The database and query structure allows the project to be rebuilt and analyzed consistently from the supplied SQL files and dataset.

------------------------------------------------------------------------

# 19. 🔄 Project Workflow

``` text
+-----------------------------+
| 1. Source Dataset           |
| Telecom Customer Data       |
+-------------+---------------+
              |
              v
+-----------------------------+
| 2. Database Setup           |
| Create Telecom_Churn_DB     |
+-------------+---------------+
              |
              v
+-----------------------------+
| 3. Table Creation           |
| dbo.telecom_churn           |
+-------------+---------------+
              |
              v
+-----------------------------+
| 4. Data Loading             |
| Customer Records            |
+-------------+---------------+
              |
              v
+-----------------------------+
| 5. KPI Analysis             |
| Overall Churn Performance   |
+-------------+---------------+
              |
              v
+-----------------------------+
| 6. Univariate Analysis      |
| Individual Variables        |
+-------------+---------------+
              |
              v
+-----------------------------+
| 7. Bivariate Analysis       |
| Variable Relationships      |
+-------------+---------------+
              |
              v
+-----------------------------+
| 8. Multivariate Analysis    |
| Retention Segmentation      |
+-------------+---------------+
              |
              v
+-----------------------------+
| 9. CSV Results              |
| Query Output Files          |
+-------------+---------------+
              |
              v
+-----------------------------+
| 10. Dashboard / Report      |
| Business Insights           |
+-----------------------------+
```

------------------------------------------------------------------------

# 20. 🧪 Testing Strategy

| Test | Expected Result |
|---|---|
| 🗄️ Database connection | SQL Server database opens successfully |
| 🏗️ Database creation | `Telecom_Churn_DB` is created |
| 📋 Table creation | `dbo.telecom_churn` is created without errors |
| 📥 Data insertion | Customer records are stored |
| 🔎 Data retrieval | `SELECT` queries return expected records |
| 🚨 Churn calculation | Churned customer counts are generated |
| 📊 Churn-rate calculation | Churn rates are calculated correctly |
| 📡 Partner grouping | Partner-level metrics are generated |
| 🌍 State grouping | State-level metrics are generated |
| 🏙️ City grouping | City-level metrics are generated |
| 📱 Usage analysis | Calls, SMS and data metrics are generated |
| 🎂 Age analysis | Age groups are generated |
| 💰 Salary analysis | Salary groups are generated |
| 🧠 Multivariate analysis | Multi-variable segments are generated |
| 📤 CSV export | Query outputs can be exported successfully |
| 📈 Dashboard outputs | Results can be visualized correctly |

------------------------------------------------------------------------

# 21. **Limitations**

-   The current analysis is based on the available **telecom customer churn dataset**.
-   The core database is centered on a single customer-level analytical table.
-   The dataset does not directly provide detailed billing, plan, contract or service-quality information.
-   Customer-support interactions are not included.
-   Network-quality metrics are not included.
-   Profit, revenue and customer lifetime value are not directly available.
-   Predictive churn modeling is outside the core SQL scope.
-   Correlation or association in this project should not automatically be interpreted as causation.
-   Retention-priority segments indicate analytical areas for attention rather than guaranteed future churn.
-   Dashboard values should be interpreted alongside the SQL query results and source dataset.

------------------------------------------------------------------------

# 22. **Future Enhancements**

The project can be extended with:

-   📅 **Historical customer snapshots**
-   💰 **Billing and revenue analysis**
-   📄 **Contract and plan information**
-   📞 **Customer support / complaint analysis**
-   📡 **Network quality metrics**
-   🎯 **Customer lifetime value analysis**
-   📈 **Predictive churn modeling**
-   🤖 **Machine learning / classification**
-   🔴 **Real-time churn dashboard**
-   🔄 **Automated CSV generation**
-   📊 **Power BI integration**
-   ☁️ **Cloud SQL deployment**
-   🔐 **Role-based reporting**
-   📧 **Automated retention alerts**
-   🧠 **Customer segmentation using clustering**

------------------------------------------------------------------------

# 23. ✅ Conclusion

The **Telecom Customer Churn Analysis** project provides a practical framework for transforming raw telecom customer records into structured churn and retention intelligence.

The **SQL Server database** provides a reliable foundation for storing customer information, while the **T-SQL analysis** converts those records into KPIs, churn rates, partner comparisons, geographic insights, usage patterns and multidimensional retention segments.

The project demonstrates how SQL can progress from:

> **Raw Customer Data → Database → KPIs → Univariate Analysis → Bivariate Analysis → Multivariate Analysis → CSV Results → Dashboard → Retention Decisions**

The analysis uses practical SQL techniques including **aggregations, `GROUP BY`, `CASE`, CTEs, subqueries and conditional calculations**. The query file explicitly organizes the work into KPI, univariate, bivariate and multivariate phases.

This makes the project suitable for demonstrating **SQL, data analytics, customer churn analysis, business intelligence and analytical problem-solving skills** in a GitHub portfolio.

------------------------------------------------------------------------

# 24. Suggested Project Folder Structure

``` text
Telecom-Customer-Churn-Analysis/
│
├── database/
│   └── Telecom_Customer_Churn_Database.sql
│
├── queries/
│   └── SQL_QUERY.sql
│
├── results/
│   ├── Phase_1_KPI/
│   │   ├── P1_01_Total_Customers.csv
│   │   ├── P1_02_Total_Churned_Customers.csv
│   │   ├── P1_03_Overall_Churn_Rate.csv
│   │   └── ...
│   │
│   ├── Phase_2_Univariate/
│   │   ├── P2_01_Customer_Age_Distribution.csv
│   │   ├── P2_02_Gender_Distribution.csv
│   │   ├── P2_03_Telecom_Partner_Distribution.csv
│   │   └── ...
│   │
│   ├── Phase_3_Bivariate/
│   │   ├── P3_01_Churn_vs_Gender.csv
│   │   ├── P3_02_Churn_vs_Age_Group.csv
│   │   └── ...
│   │
│   └── Phase_4_Multivariate/
│       ├── P4_01_Partner_Age_Group_Churn.csv
│       ├── P4_02_Partner_Gender_Churn.csv
│       ├── P4_03_Partner_Salary_Group_Churn.csv
│       └── ...
│
├── dashboard/
│   └── Telecom Churn Analysis Dashboard.png
│
├── data-model/
│   └── Telecom_Customer_Churn_Data_Model.png
│
├── reports/
│   └── Telecom_Customer_Churn_SQL_Project_Report.pdf
│
├── README.md
└── LICENSE
```

------------------------------------------------------------------------

# 25. Key Definitions

| Term | Definition |
|---|---|
| 🚨 **Churn** | Customer leaving or discontinuing the telecom service |
| 👥 **Customer** | Individual telecom customer represented by a record |
| 📡 **Telecom Partner** | Telecom service partner associated with the customer |
| 📊 **Churn Rate** | Percentage of customers who have churned |
| 📞 **Calls Made** | Number of calls associated with a customer |
| 💬 **SMS Usage** | Number of SMS messages sent |
| 📱 **Data Usage** | Amount of mobile data consumed |
| 🎂 **Age Group** | Customer segment created from age ranges |
| 💰 **Salary Group** | Customer segment based on estimated salary |
| 🌍 **Geographic Analysis** | Analysis based on state, city and pincode |
| 📊 **KPI** | Key Performance Indicator used to summarize performance |
| 🧠 **Univariate Analysis** | Analysis of one business/customer dimension at a time |
| 🔗 **Bivariate Analysis** | Analysis of relationships between two dimensions |
| 🧩 **Multivariate Analysis** | Analysis involving multiple dimensions |
| 🪟 **CTE** | Common Table Expression used to build readable multi-step queries |
| 🏷️ **CASE Statement** | SQL expression used for conditional grouping and classification |
| 📤 **CSV Result** | Exported query output used for reporting or visualization |
| 🎯 **Retention Priority** | Customer segment identified for deeper retention attention |

------------------------------------------------------------------------

## **Technology Summary**

``` text
Data Source      → Telecom Customer Churn Dataset
Database         → Microsoft SQL Server
Database Table   → dbo.telecom_churn
Query Language   → T-SQL / SQL
Analysis         → KPI + Univariate + Bivariate + Multivariate
Advanced SQL     → CTEs + Subqueries + CASE + Aggregations
Output           → CSV Query Results
Visualization    → Dashboard / Charts
Documentation    → GitHub README + PDF Report
```

------------------------------------------------------------------------

# **Project Goal**

**Transform raw telecom customer records into meaningful churn and retention intelligence through SQL Server database management, advanced SQL analytics, CSV result generation and dashboard-oriented reporting.**

------------------------------------------------------------------------

## 📌 Important Data Note

The current SQL project is based on the supplied **database setup** and **SQL query** files.

The analytical SQL script specifies:

``` text
Database  → Telecom_Churn_DB
Table     → dbo.telecom_churn
Dataset   → Telecom Churn Dataset

Columns   → customer_id,
            telecom_partner,
            gender,
            age,
            state,
            city,
            pincode,
            date_of_registration,
            num_dependents,
            estimated_salary,
            calls_made,
            sms_sent,
            data_used,
            churn
```

The dashboard presents the project visually through customer, churn, partner, age-group and state-level views. **The SQL database, source dataset and query results should be treated as the authoritative source for reproducible analysis.**

------------------------------------------------------------------------

## 🤝 Future Scope

The project can be extended with:

-   📈 **Power BI interactive dashboard**
-   🤖 **Predictive churn modeling**
-   💰 **Revenue and customer lifetime value analytics**
-   👥 **Advanced customer segmentation**
-   📡 **Network-quality analysis**
-   📞 **Customer-support analytics**
-   📅 **Multi-period churn tracking**
-   🎯 **Automated retention scoring**
-   🔄 **Automated reporting**
-   ☁️ **Cloud database deployment**
-   🔴 **Real-time churn monitoring**

------------------------------------------------------------------------

If this project is useful for learning or portfolio purposes, consider giving the repository a **⭐ Star** on GitHub.

**Built with 🗄️ Microsoft SQL Server + 🔎 T-SQL + 📊 Data Analytics + 🚨 Customer Churn Analysis + 🎯 Retention Intelligence**
