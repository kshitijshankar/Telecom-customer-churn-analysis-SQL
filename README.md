# 📡 Telecom Customer Churn & Retention Intelligence

## 📌 Project Overview

**Telecom Customer Churn & Retention Intelligence** is an **SQL-based Data Analytics project** focused on understanding customer churn, telecom partner performance, geographic patterns, and customer usage behavior.

The project analyses **243,553 telecom customer records** to identify patterns associated with customer churn and transform raw customer data into **business-focused insights for customer retention and decision-making**.

The primary objective is to answer a practical business question:

> **Who is churning, where is churn happening, what customer behaviours are associated with churn, and which customer segments should be prioritised for retention?**

---

## 🎯 Business Objective

The project is designed for **Telecom Company Management and Customer Retention Teams** to help them:

* **Understand customer churn patterns**
* **Compare performance across telecom partners**
* **Identify geographic areas with higher churn**
* **Analyze customer usage behavior**
* **Identify high-risk customer segments**
* **Support data-driven customer retention strategies**

---

## 👥 End Consumer

**Telecom Company Management & Customer Retention Team**

The analysis can support business teams responsible for:

* Customer retention
* Churn monitoring
* Marketing strategy
* Regional performance
* Telecom partner performance
* Customer segmentation
* Business decision-making

---

## 🔍 Key Business Perspectives

The complete project is structured around **5 major business perspectives**:

### 1. 📉 Customer Churn

Analyze:

* Total customers
* Churned customers
* Overall churn rate
* Churn across customer segments
* Churn patterns based on demographic and behavioral characteristics

### 2. 📡 Telecom Partner

Compare telecom partners based on:

* Customer base
* Churn rate
* Customer usage
* Partner-level customer segments
* Partner performance across regions

### 3. 🌍 Geographic Analysis

Analyze customer and churn patterns across:

* **States**
* **Cities**
* **Pincodes**
* Telecom partners within geographic regions

### 4. 📱 Customer Usage Behavior

Analyze customer behavior using:

* Calls made
* SMS sent
* Data used
* Age
* Estimated salary
* Number of dependents

### 5. 🎯 Retention Strategy

Use the analysis to identify:

* High-churn customer segments
* High-risk combinations of customer characteristics
* Partner-specific retention opportunities
* Geographic churn hotspots
* Customer groups that may require targeted retention strategies

---

# 📊 Dataset

**Dataset Name:** Telecom Churn Dataset

**Total Records:** 243,553

**Total Columns:** 14

### Dataset Columns

| Column                 | Description                   |
| ---------------------- | ----------------------------- |
| `customer_id`          | Unique customer identifier    |
| `telecom_partner`      | Telecom service provider      |
| `gender`               | Customer gender               |
| `age`                  | Customer age                  |
| `state`                | Customer state                |
| `city`                 | Customer city                 |
| `pincode`              | Customer pincode              |
| `date_of_registration` | Customer registration date    |
| `num_dependents`       | Number of customer dependents |
| `estimated_salary`     | Estimated customer salary     |
| `calls_made`           | Number of calls made          |
| `sms_sent`             | Number of SMS messages sent   |
| `data_used`            | Customer data usage           |
| `churn`                | Customer churn status         |

### Churn Definition

* `churn = 1` → Customer churned
* `churn = 0` → Customer did not churn

---

# 🧠 SQL Analysis Framework

The project is divided into **4 analytical phases** containing a total of **60 SQL analyses**.

```text
                    TELECOM CUSTOMER ANALYTICS
                              │
                              ▼
              ┌─────────────────────────────┐
              │       PHASE 1 — KPIs        │
              │          15 KPIs             │
              └──────────────┬──────────────┘
                             │
                             ▼
              ┌─────────────────────────────┐
              │   PHASE 2 — UNIVARIATE      │
              │       15 Analyses            │
              └──────────────┬──────────────┘
                             │
                             ▼
              ┌─────────────────────────────┐
              │    PHASE 3 — BIVARIATE      │
              │       15 Analyses            │
              └──────────────┬──────────────┘
                             │
                             ▼
              ┌─────────────────────────────┐
              │   PHASE 4 — MULTIVARIATE    │
              │       15 Analyses            │
              └──────────────┬──────────────┘
                             │
                             ▼
                  RETENTION INSIGHTS
```

---

# 📌 Phase 1 — KPI Analysis

**15 Business KPIs** were developed to understand the overall telecom customer base.

### Customer Churn

* Total Customers
* Total Churned Customers
* Overall Churn Rate

### Telecom Partner

* Customers by Telecom Partner
* Churn Rate by Telecom Partner
* Largest Telecom Partner by Customer Base

### Geographic Analysis

* Customer Distribution by State
* Highest-Churn State
* City with Highest Customer Base

### Customer Usage Behavior

* Average Data Usage
* Average Calls Made
* Average SMS Usage

### Customer Profile

* Average Estimated Salary
* Average Customer Age
* Average Number of Dependents

---

# 📊 Phase 2 — Univariate Analysis

**15 Univariate Analyses** were performed to understand individual variables and their distributions.

The analysis covers:

* Customer Age Distribution
* Gender Distribution
* Telecom Partner Distribution
* Churn Distribution
* State-Wise Customer Distribution
* City-Wise Customer Distribution
* Dependents Distribution
* Estimated Salary Distribution
* Call Usage Distribution
* SMS Usage Distribution
* Data Usage Distribution
* Age Group Distribution
* Salary Group Distribution
* Registration Date Distribution
* Pincode Distribution

---

# 🔗 Phase 3 — Bivariate Analysis

**15 Bivariate Analyses** were performed to understand relationships between two variables.

Key relationships include:

* **Churn vs Gender**
* **Churn vs Age Group**
* **Churn vs Number of Dependents**
* **Churn vs Salary Group**
* **Churn vs Calls Made**
* **Churn vs SMS Usage**
* **Churn vs Data Usage**
* **Telecom Partner vs Customer Count**
* **Telecom Partner vs Churn**
* **Telecom Partner vs Data Usage**
* **State vs Churn**
* **City vs Churn**
* **Gender vs Customer Usage**
* **Age Group vs Data Usage**
* **Age Group vs Call Usage**

---

# 🧩 Phase 4 — Multivariate Analysis

The final phase performs **15 Multivariate Analyses** to identify deeper patterns by analyzing multiple variables simultaneously.

Key analyses include:

* **Telecom Partner + Age Group + Churn**
* **Telecom Partner + Gender + Churn**
* **Telecom Partner + Salary Group + Churn**
* **Telecom Partner + State + Churn**
* **State + City + Churn**
* **Age Group + Usage + Churn**
* **Gender + Usage + Churn**
* **Dependents + Age Group + Churn**
* **Telecom Partner + Usage + Churn**
* **Telecom Partner + State + Age Group**
* **Salary Group + Usage + Churn**
* **City + Telecom Partner + Churn**
* **Age Group + Salary Group + Churn**
* **Data Usage Level + Telecom Partner + Churn**
* **Retention Priority Segments**

The final analysis focuses specifically on identifying **customer segments that may require retention attention**.

---

# 🛠️ Tools & Technologies

### SQL

* **Microsoft SQL Server**
* `SELECT`
* `WHERE`
* `GROUP BY`
* `ORDER BY`
* `CASE WHEN`
* Aggregate Functions
* `COUNT()`
* `SUM()`
* `AVG()`
* `MIN()`
* `MAX()`
* Common Table Expressions (**CTEs**)
* Conditional Aggregation
* Percentage Calculations
* Customer Segmentation

### Data Analysis Concepts

* KPI Analysis
* Univariate Analysis
* Bivariate Analysis
* Multivariate Analysis
* Customer Segmentation
* Churn Analysis
* Geographic Analysis
* Behavioral Analysis
* Retention Analysis

---

# 📁 Project Structure

```text
Telecom-Customer-Churn-Analysis/
│
├── 📄 README.md
│
├── 📊 telecom_churn.csv
│
├── 🗃️ SQL_QUERY.sql
│
└── 🖼️ Image.png
```

---

# 💡 Key Business Questions

This project is designed to answer questions such as:

1. **How many customers are currently in the customer base?**
2. **How many customers have churned?**
3. **What is the overall churn rate?**
4. **Which telecom partner has the highest churn rate?**
5. **Which states and cities show higher churn?**
6. **Does customer age relate to churn?**
7. **Does salary level relate to churn?**
8. **Does customer usage behavior differ between churned and retained customers?**
9. **Which telecom partners have different usage patterns?**
10. **Which customer segments should the retention team prioritize?**

---

# 🎯 Business Value

The project moves beyond simply querying a dataset.

The analytical workflow follows:

**Raw Customer Data**

↓

**KPI Measurement**

↓

**Customer & Business Profiling**

↓

**Relationship Analysis**

↓

**Multivariate Segmentation**

↓

**Churn Identification**

↓

**Retention-Focused Business Insights**

This approach demonstrates how **SQL can be used not only for data extraction, but also for business analysis and decision support**.

---

# 📈 Data Quality Note

During the analysis, the dataset contains some **unusual negative values in usage-related fields such as `calls_made`, `sms_sent`, and `data_used`**.

These values should be treated as a **data-quality consideration** before using usage metrics for final business decisions.

This is important because a professional analytics workflow should distinguish between:

**Data → Data Quality → Analysis → Insights → Business Decision**

rather than directly interpreting potentially invalid records.

---

## ⭐ Why This Project Matters

This project demonstrates a complete analytical thought process:

**Business Problem → Data → SQL Analysis → Customer Segmentation → Churn Insights → Retention Strategy**

Rather than presenting SQL queries as isolated exercises, the project connects them to a **real-world telecom business problem: reducing customer churn and improving customer retention**.
