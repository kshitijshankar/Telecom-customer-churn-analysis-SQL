                         PROJECT PHASE - 1
/* ================================================================
   TELECOM CUSTOMER CHURN & RETENTION INTELLIGENCE
   PHASE 1 — KPI ANALYSIS
   Perspective:Customer Churn,Telecom Partner,Geographic Analysis,Customer Usage Behavior,Retention Strategy
   End Consumer:Telecom Company Management & Customer Retention Team
   Dataset:  Telecom Churn Dataset
   Columns:
   customer_id
   telecom_partner
   gender
   age
   state
   city
   pincode
   date_of_registration
   num_dependents
   estimated_salary
   calls_made
   sms_sent
   data_used
   churn

   ================================================================ */

/* ================================================================
   KPI 01 — TOTAL CUSTOMERS
   ================================================================
   How many total customers are present in the telecom
   company's customer base?

   ================================================================ */

Select 
    Count(customer_id) AS [Total_Customers]
    From telecom_churn

/* ================================================================
   KPI 02 — TOTAL CHURNED CUSTOMERS
   ================================================================
   How can we count customers whose churn status indicates
   that they have left the company?

   ================================================================ */

SELECT
    COUNT(*) AS total_churned_customers
FROM telecom_churn
WHERE churn = 1;


/* ================================================================
   KPI 03 — OVERALL CHURN RATE
   ================================================================
   What percentage of the company's customers have churned?

   ================================================================ */

   With T1 AS (
    Select 
            Count(*) AS [Total_Customers],
            Sum(
                Case
                    When churn = 1 Then 1
                Else 0
                End 
                )AS [Total_Churned_Customers]
                From telecom_churn
)
Select *,
        [Total_Churned_Customers] * 100.0 / [Total_Customers] AS [Percentage_Churned_Customers]
        From T1


/* ================================================================
   KPI 04 — CUSTOMERS BY TELECOM PARTNER
   ================================================================

   How can we calculate the number of customers for
   each telecom partner?

   ================================================================ */

SELECT
    telecom_partner,
    COUNT(customer_id) AS total_customers
FROM telecom_churn
GROUP BY telecom_partner
ORDER BY total_customers DESC;


/* ================================================================
   KPI 05 — CHURN RATE BY TELECOM PARTNER
   ================================================================

   Which telecom partner has the highest customer churn rate?

   ================================================================ */

With T1 AS (
Select 
       Telecom_partner,
       Count(*) AS [Total_Customers],
       Sum(
            Case    
                When churn = 1 Then 1
            Else 0
            End 
            )AS [Churned_Customer]
            From telecom_churn
            Group by Telecom_partner
            
)
Select *,
        [Churned_Customer] * 100.0 / [Total_Customers] AS [Churn_Rate]
        From T1 
        Order by [Churn_Rate] Desc


/* ================================================================
   KPI 06 — LARGEST TELECOM PARTNER BY CUSTOMER BASE
   ================================================================

   How can we identify the telecom partner with
   the maximum number of customers?

   ================================================================ */

SELECT Top 1 
    telecom_partner,
    COUNT(DISTINCT customer_id) AS total_customers
FROM telecom_churn
GROUP BY telecom_partner
ORDER BY total_customers DESC



/* ================================================================
   KPI 07 — CUSTOMER DISTRIBUTION BY STATE
   ================================================================

   How can we calculate the number of customers
   in each state?

   ================================================================ */

SELECT
    state,
    COUNT(DISTINCT customer_id) AS total_customers
FROM telecom_churn
GROUP BY state
ORDER BY total_customers DESC;


/* ================================================================
   KPI 08 — HIGHEST-CHURN STATE
   ================================================================

   PRACTICAL QUESTION:
   Which state has the highest customer churn rate?

   TECHNICAL QUESTION:
   How can we calculate and rank churn rates
   at the state level?


   ================================================================ */

    With T1 AS (
    Select Top 3
           State,
           Count(*) AS [Total_Customers],
           Sum(
                Case 
                    When churn = 1 Then 1 
                Else 0
                End 
                ) AS [Churned_Customer]
                From telecom_churn
                Group by State
)
Select *,
        [Churned_Customer]  * 100.0 / [Total_Customers]   AS [Churn_Rates]
        From T1
        Order by [Churn_Rates] Desc
  
/* ================================================================
   KPI 09 — CITY WITH HIGHEST CUSTOMER BASE
   ================================================================

   PRACTICAL QUESTION:
   Which city has the highest concentration of telecom customers?

   ================================================================ */

SELECT Top 1 
    city,
    COUNT(DISTINCT customer_id) AS total_customers
FROM telecom_churn
GROUP BY city
ORDER BY total_customers DESC



/* ================================================================
   KPI 10 — AVERAGE DATA USAGE
   ================================================================

   PRACTICAL QUESTION:
   What is the average amount of data consumed
   by a telecom customer?

   ================================================================ */

SELECT
    AVG(data_used) AS average_data_usage
FROM telecom_churn;


/* ================================================================
   KPI 11 — AVERAGE CALLS MADE
   ================================================================

   How many calls does an average telecom customer make?

   ================================================================ */

SELECT
    ROUND(AVG(calls_made), 2) AS average_calls_made
FROM telecom_churn;


/* ================================================================
   KPI 12 — AVERAGE SMS USAGE
   ================================================================

   How many SMS messages does an average customer send?

   ================================================================ */

SELECT
    ROUND(AVG(sms_sent), 2) AS average_sms_sent
FROM telecom_churn;


/* ================================================================
   KPI 13 — AVERAGE ESTIMATED SALARY
   ================================================================

   What is the average estimated salary of the
   telecom company's customers?
   ================================================================ */

SELECT
    ROUND(AVG(estimated_salary), 2) AS average_estimated_salary
FROM telecom_churn;


/* ================================================================
   KPI 14 — AVERAGE CUSTOMER AGE
   ================================================================

   What is the average age of the telecom customer base?

   ================================================================ */

SELECT
    ROUND(AVG(age), 2) AS average_customer_age
FROM telecom_churn;


/* ================================================================
   KPI 15 — AVERAGE NUMBER OF DEPENDENTS
   ================================================================

   What is the average number of dependents
   associated with a telecom customer?

   ================================================================ */
    Select 
           Round(Avg(num_dependents),2) AS [Avg_num_dependents]
           From telecom_churn

/* ================================================================
   PHASE 1 — KPI SUMMARY

   CUSTOMER CHURN
   ────────────────────────────────────────────────────────────────
   KPI 01 → Total Customers
   KPI 02 → Total Churned Customers
   KPI 03 → Overall Churn Rate

   TELECOM PARTNER
   ────────────────────────────────────────────────────────────────
   KPI 04 → Customers by Telecom Partner
   KPI 05 → Churn Rate by Telecom Partner
   KPI 06 → Largest Telecom Partner

   GEOGRAPHIC ANALYSIS
   ────────────────────────────────────────────────────────────────
   KPI 07 → Customer Distribution by State
   KPI 08 → Highest-Churn State
   KPI 09 → City with Highest Customer Base

   CUSTOMER USAGE BEHAVIOR
   ────────────────────────────────────────────────────────────────
   KPI 10 → Average Data Usage
   KPI 11 → Average Calls Made
   KPI 12 → Average SMS Usage

   CUSTOMER PROFILE
   ────────────────────────────────────────────────────────────────
   KPI 13 → Average Estimated Salary
   KPI 14 → Average Customer Age
   KPI 15 → Average Number of Dependents
 ================================================================*/
							  PROJECT PHASE - 2
	/* ================================================================
   TELECOM CUSTOMER CHURN & RETENTION INTELLIGENCE
   PHASE 2 — UNIVARIATE ANALYSIS
   Perspective:Customer Churn,Telecom Partner,Geographic Analysis,Customer Usage Behavior,Retention Strategy
   End Consumer:Telecom Company Management & Customer Retention Team
   Dataset:Telecom Churn Dataset
   Columns:
   customer_id
   telecom_partner
   gender
   age
   state
   city
   pincode
   date_of_registration
   num_dependents
   estimated_salary
   calls_made
   sms_sent
   data_used
   churn

   ================================================================ */


/* ================================================================
   UNIVARIATE ANALYSIS 01 — CUSTOMER AGE DISTRIBUTION
   ================================================================

   PRACTICAL QUESTION:
   What is the age distribution of the telecom customer base?

   ================================================================ */

SELECT
    MIN(age) AS minimum_age,
    MAX(age) AS maximum_age,
    AVG(age) AS average_age
FROM telecom_churn;


/* ================================================================
   UNIVARIATE ANALYSIS 02 — GENDER DISTRIBUTION
   ================================================================

   What is the gender composition of the customer base?

   ================================================================ */

SELECT
    gender,
    COUNT(customer_id) AS total_customers
FROM telecom_churn
GROUP BY gender
ORDER BY total_customers DESC;


/* ================================================================
   UNIVARIATE ANALYSIS 03 — TELECOM PARTNER DISTRIBUTION
   ================================================================

   How many customers belong to each telecom partner?

   ================================================================ */

SELECT
    telecom_partner,
    COUNT(DISTINCT customer_id) AS total_customers
FROM telecom_churn
GROUP BY telecom_partner
ORDER BY total_customers DESC;


/* ================================================================
   UNIVARIATE ANALYSIS 04 — CHURN DISTRIBUTION
   ================================================================

   What proportion of customers have churned
   versus remained with the company?

   ================================================================ */

Select 
       churn,
       Count(Customer_id) AS [Total_Customer]
       From telecom_churn
       Group by churn
       Order by [Total_Customer] Desc


/* ================================================================
   UNIVARIATE ANALYSIS 05 — STATE-WISE CUSTOMER DISTRIBUTION
   ================================================================

   How is the customer base distributed across states?

   ================================================================ */

SELECT
    state,
    COUNT(customer_id) AS total_customers
FROM telecom_churn
GROUP BY state
ORDER BY total_customers DESC;


/* ================================================================
   UNIVARIATE ANALYSIS 06 — CITY-WISE CUSTOMER DISTRIBUTION
   ================================================================

   How is the customer base distributed across cities?

   ================================================================ */

SELECT
    city,
    COUNT(DISTINCT customer_id) AS total_customers
FROM telecom_churn
GROUP BY city
ORDER BY total_customers DESC;


/* ================================================================
   UNIVARIATE ANALYSIS 07 — CUSTOMER DEPENDENTS DISTRIBUTION
   ================================================================

   How many dependents do telecom customers typically have?

   ================================================================ */

SELECT
    num_dependents,
    COUNT(DISTINCT customer_id) AS total_customers
FROM telecom_churn
GROUP BY num_dependents
ORDER BY num_dependents;


/* ================================================================
   UNIVARIATE ANALYSIS 08 — ESTIMATED SALARY DISTRIBUTION
   ================================================================

   PRACTICAL QUESTION:
   What is the salary range of the telecom customer base?

   TECHNICAL QUESTION:
   What are the minimum, maximum and average
   estimated salaries?


   ================================================================ */
SELECT
    MIN(estimated_salary) AS minimum_salary,
    MAX(estimated_salary) AS maximum_salary,
    AVG(CAST(estimated_salary AS DECIMAL(18,2))) AS [Estimates_Salary]
FROM telecom_churn;


/* ================================================================
   UNIVARIATE ANALYSIS 09 — CALL USAGE DISTRIBUTION
   ================================================================

   What is the typical call usage of telecom customers?

   ================================================================ */

SELECT
    MIN(calls_made) AS minimum_calls,
    MAX(calls_made) AS maximum_calls,
    ROUND(AVG(calls_made), 2) AS average_calls
FROM telecom_churn;


/* ================================================================
   UNIVARIATE ANALYSIS 10 — SMS USAGE DISTRIBUTION
   ================================================================

   What is the typical SMS usage among customers?

   ================================================================ */

SELECT
    MIN(sms_sent) AS minimum_sms,
    MAX(sms_sent) AS maximum_sms,
    ROUND(AVG(sms_sent), 2) AS average_sms
FROM telecom_churn;


/* ================================================================
   UNIVARIATE ANALYSIS 11 — DATA USAGE DISTRIBUTION
   ================================================================

   What is the typical mobile data consumption
   among telecom customers?

   ================================================================ */

SELECT
    MIN(data_used) AS minimum_data_used,
    MAX(data_used) AS maximum_data_used,
    ROUND(AVG(data_used), 2) AS average_data_used
FROM telecom_churn;


/* ================================================================
   UNIVARIATE ANALYSIS 12 — AGE GROUP DISTRIBUTION
   ================================================================

   Which age groups represent the largest
   customer segments?

   ================================================================ */

WITH T1 AS (
    SELECT 
        CASE
            WHEN age < 25 THEN 'Under 25'
            WHEN age < 35 THEN '25 - 34 Age Group'
            WHEN age < 45 THEN '35 - 44 Age Group'
            WHEN age < 55 THEN '45 - 54 Age Group'
            WHEN age < 65 THEN '55 - 64 Age Group'
            ELSE '65+ Age Group'
        END AS [Age_Group]
    FROM telecom_churn
)
SELECT
    [Age_Group],
    COUNT(*) AS [Total_Customers]
FROM T1
GROUP BY [Age_Group]
ORDER BY [Total_Customers] DESC;



/* ================================================================
   UNIVARIATE ANALYSIS 13 — SALARY GROUP DISTRIBUTION
   ================================================================
   
   How are customers distributed across different
   salary segments?

   ================================================================ */
   
   With T1 AS (
   Select
        CASE
        WHEN estimated_salary < 50000 THEN 'Low Salary'
        WHEN estimated_salary BETWEEN 50000 AND 99999
            THEN 'Medium Salary'
        ELSE 'High Salary'
        END AS salary_group
        From telecom_churn
)
    Select *,
            Count(*) AS [Total_Customer]
            From T1 
            Group by salary_group
            Order by [Total_Customer] Desc


/* ================================================================
   UNIVARIATE ANALYSIS 14 — REGISTRATION DATE DISTRIBUTION
   ================================================================

   When were customers registered with the telecom company?

   ================================================================ */

    Select
        date_of_registration,
        count(*) AS [Total_Customers]
        From telecom_churn
        Group by  date_of_registration
        ORDER BY date_of_registration;

/* ================================================================
   UNIVARIATE ANALYSIS 15 — CUSTOMER PINCODE DISTRIBUTION
   ================================================================

   How many customers are associated with
   each geographic pincode?

   ================================================================ */

SELECT
    pincode,
    COUNT( customer_id) AS total_customers
FROM telecom_churn
GROUP BY pincode
ORDER BY total_customers DESC;


/* ================================================================
   PHASE 2 — UNIVARIATE ANALYSIS SUMMARY

   CUSTOMER PROFILE
   ────────────────────────────────────────────────────────────────
   01 → Customer Age Distribution
   02 → Gender Distribution
   07 → Customer Dependents Distribution
   08 → Estimated Salary Distribution
   12 → Age Group Distribution
   13 → Salary Group Distribution

   TELECOM PARTNER
   ────────────────────────────────────────────────────────────────
   03 → Telecom Partner Distribution

   CUSTOMER CHURN
   ────────────────────────────────────────────────────────────────
   04 → Churn Distribution

   GEOGRAPHIC ANALYSIS
   ────────────────────────────────────────────────────────────────
   05 → State-Wise Customer Distribution
   06 → City-Wise Customer Distribution
   15 → Pincode Distribution

   CUSTOMER USAGE BEHAVIOR
   ────────────────────────────────────────────────────────────────
   09 → Call Usage Distribution
   10 → SMS Usage Distribution
   11 → Data Usage Distribution

   REGISTRATION
   ────────────────────────────────────────────────────────────────
   14 → Registration Date Distribution

====================================================================================*/

								PROJECT PHASE - 3
	/* ================================================================
   TELECOM CUSTOMER CHURN & RETENTION INTELLIGENCE
   PHASE 3 — BIVARIATE ANALYSIS
   Perspective:Customer Churn,Telecom Partner,Geographic Analysis,Customer Usage Behavior,Retention Strategy
   End Consumer:Telecom Company Management & Customer Retention Team
   Dataset:Telecom Churn Dataset
   Columns:
   customer_id
   telecom_partner
   gender
   age
   state
   city
   pincode
   date_of_registration
   num_dependents
   estimated_salary
   calls_made
   sms_sent
   data_used
   churn

   ================================================================ */


/* ================================================================
   BIVARIATE ANALYSIS 01 — CHURN vs GENDER
   ================================================================

   Does customer churn differ between male and female customers?

   ================================================================ */

    With T1 AS (
    Select 
            Gender,
            Count(Distinct Customer_id) AS [Total_Customer],
            Sum(
            case
                When churn = 1 Then 1
            Else 0
            End 
            ) AS churned_customer
            from telecom_churn
            Group by Gender
    )
    Select *,
       churned_customer  * 100.0  / [Total_Customer] AS [churn_Rate]
        From T1
        Order by [churn_Rate] Desc



/* ================================================================
   BIVARIATE ANALYSIS 02 — CHURN vs AGE GROUP
   ================================================================

   Which age group has the highest customer churn?

   ================================================================ */
WITH T1 AS (
    SELECT
        CASE
            WHEN age < 25 THEN 'Under 25'
            WHEN age < 35 THEN '25-34'
            WHEN age < 45 THEN '35-44'
            WHEN age < 55 THEN '45-54'
            WHEN age < 65 THEN '55-64'
            ELSE '65+'
        END AS Age_Group,

        COUNT (customer_id) AS Total_Customers,

        COUNT(
            CASE
                WHEN churn = 1 THEN customer_id
            END
        ) AS Churned_Customers

    FROM telecom_churn

    GROUP BY
        CASE
            WHEN age < 25 THEN 'Under 25'
            WHEN age < 35 THEN '25-34'
            WHEN age < 45 THEN '35-44'
            WHEN age < 55 THEN '45-54'
            WHEN age < 65 THEN '55-64'
            ELSE '65+'
        END
)

SELECT *,
    Churned_Customers * 100.0 / Total_Customers AS Churn_Rate

FROM T1

ORDER BY Churn_Rate DESC;



/* ================================================================
   BIVARIATE ANALYSIS 03 — CHURN vs NUMBER OF DEPENDENTS
   ================================================================

   PRACTICAL QUESTION:
   Does the number of dependents have any relationship
   with customer churn?

   TECHNICAL QUESTION:
   How does churn rate vary according to
   the number of dependents?

   HINT:
   GROUP BY num_dependents + Churn Rate

   ================================================================ */

    With T1 AS (
    Select 
            num_dependents,
            Count(*) AS [Total_Customers],
            Sum(
                Case
                    When churn = 1 Then 1
                Else 0
                End 
                ) AS [Churned_Customers]
                From telecom_churn
                Group by num_dependents
)
Select *,
        [Churned_Customers] * 100.0 / [Total_Customers] [Churn_Rate]
        From T1
        Order by [Churn_Rate] Desc


/* ================================================================
   BIVARIATE ANALYSIS 04 — CHURN vs SALARY GROUP
   ================================================================

   How can we compare churn rates across
   different salary groups?

   ================================================================ */
    
   With T1 AS(
   Select
            Case    
                WHEN estimated_salary < 50000 THEN 'Low Salary'
                WHEN estimated_salary BETWEEN 50000 AND 99999 THEN 'Medium Salary'
            Else 'High Salary'
            End AS [Salary_Group],
            Count(*) AS [Total_Customers],
            Sum(
                Case
                    When churn = 1 Then 1 
                Else 0
                End
                ) AS [Churned_Customers]
                From telecom_churn
                Group by  Case    
                WHEN estimated_salary < 50000 THEN 'Low Salary'
                WHEN estimated_salary BETWEEN 50000 AND 99999 THEN 'Medium Salary'
            Else 'High Salary'
            End 
)
Select *,
       [Churned_Customers]  * 100.0 / [Total_Customers] AS [Churn_Rate]
        From T1
        Order by [Churn_Rate] Desc


/* ================================================================
   BIVARIATE ANALYSIS 05 — CHURN vs CALLS MADE
   ================================================================

   How does average call usage differ between
   churned and non-churned customers?

   ================================================================ */

SELECT
    churn,

    COUNT(*) AS total_customers,

    ROUND(AVG(calls_made), 2) AS average_calls_made

FROM telecom_churn

GROUP BY churn

ORDER BY churn;


/* ================================================================
   BIVARIATE ANALYSIS 06 — CHURN vs SMS USAGE
   ================================================================

   How does average SMS usage vary according
   to churn status?

   ================================================================ */

SELECT
    churn,

    COUNT(*) AS total_customers,

    ROUND(AVG(sms_sent), 2) AS average_sms_sent

FROM telecom_churn

GROUP BY churn

ORDER BY churn;


/* ================================================================
   BIVARIATE ANALYSIS 07 — CHURN vs DATA USAGE
   ================================================================

   How does average data consumption differ
   between churned and non-churned customers?

   ================================================================ */

SELECT
    churn,

    COUNT(*) AS total_customers,

    ROUND(AVG(data_used), 2) AS average_data_usage

FROM telecom_churn

GROUP BY churn

ORDER BY churn;


/* ================================================================
   BIVARIATE ANALYSIS 08 — TELECOM PARTNER vs CUSTOMER COUNT
   ================================================================

   How does customer volume vary across
   telecom partners?

   ================================================================ */

SELECT
    telecom_partner,

    COUNT(DISTINCT customer_id) AS total_customers

FROM telecom_churn

GROUP BY telecom_partner

ORDER BY total_customers DESC;


/* ================================================================
   BIVARIATE ANALYSIS 09 — TELECOM PARTNER vs CHURN
   ================================================================

   How can we compare churn performance
   across telecom partners?

   ================================================================ */

  With T1 AS (
    Select 
            telecom_partner,
            Count(*) AS [Total_Customers],
            Sum(
                Case
                    When churn = 1 Then 1
                Else 0
                End 
                ) AS [Churned_Customers]
                From telecom_churn
                Group by telecom_partner
)
Select *,
        [Churned_Customers] * 100.0 / [Total_Customers] [Churn_Rate]
        From T1
        Order by [Churn_Rate] Desc


/* ================================================================
   BIVARIATE ANALYSIS 10 — TELECOM PARTNER vs DATA USAGE
   ================================================================

   How does average data consumption vary
   across telecom partners?

   ================================================================ */

SELECT
    telecom_partner,

    COUNT(*) AS total_customers,

    ROUND(AVG(data_used), 2) AS average_data_usage

FROM telecom_churn

GROUP BY telecom_partner

ORDER BY average_data_usage DESC;


/* ================================================================
   BIVARIATE ANALYSIS 11 — STATE vs CHURN
   ================================================================

   Which states have the highest customer churn rates?

   ================================================================ */
    
  WITH T1 AS (
    SELECT
        State,

        COUNT(*) AS [Total_Customers],

        SUM(
            CASE
                WHEN Churn = 1 THEN 1
                ELSE 0
            END
        ) AS [Churned_Customers]

    FROM telecom_churn

    GROUP BY State
)

SELECT
    *,
    [Churned_Customers] * 100.0 / [Total_Customers] AS [Churn Rate]

FROM T1

ORDER BY [Churn Rate] DESC;

/* ================================================================
   BIVARIATE ANALYSIS 12 — CITY vs CHURN
   ================================================================

   Which cities have the highest customer churn rates?

   ================================================================ */

WITH T1 AS (
    SELECT
        city,

        COUNT(*) AS [Total_Customers],

        SUM(
            CASE
                WHEN Churn = 1 THEN 1
                ELSE 0
            END
        ) AS [Churned_Customers]

    FROM telecom_churn

    GROUP BY city
)

SELECT
    *,
    [Churned_Customers] * 100.0 / [Total_Customers] AS [Churn Rate]

FROM T1

ORDER BY [Churn Rate] DESC;


/* ================================================================
   BIVARIATE ANALYSIS 13 — GENDER vs CUSTOMER USAGE
   ================================================================

   How do average calls, SMS and data usage
   vary across genders?

   ================================================================ */

SELECT
    gender,

    ROUND(AVG(calls_made), 2) AS average_calls,

    ROUND(AVG(sms_sent), 2) AS average_sms,

    ROUND(AVG(data_used), 2) AS average_data_usage

FROM telecom_churn

GROUP BY gender;


/* ================================================================
   BIVARIATE ANALYSIS 14 — AGE GROUP vs DATA USAGE
   ================================================================

   How does average data usage vary across
   customer age groups?

   ================================================================ */

SELECT
    CASE
        WHEN Age < 25 THEN 'Under 25'
        WHEN Age < 35 THEN '25-34'
        WHEN Age < 45 THEN '35-44'
        WHEN Age < 55 THEN '45-54'
        WHEN Age < 65 THEN '55-64'
        ELSE '65+'
    END AS [Age_Group],

    COUNT(*) AS [Total_Customers],

    ROUND(AVG(Data_Used), 2) AS [Average_Data_Usage]

FROM telecom_churn

GROUP BY
    CASE
        WHEN Age < 25 THEN 'Under 25'
        WHEN Age < 35 THEN '25-34'
        WHEN Age < 45 THEN '35-44'
        WHEN Age < 55 THEN '45-54'
        WHEN Age < 65 THEN '55-64'
        ELSE '65+'
    END

ORDER BY [Average_Data_Usage] DESC;


/* ================================================================
   BIVARIATE ANALYSIS 15 — AGE GROUP vs CALL USAGE
   ================================================================

   How does average call activity vary
   across different age groups?

   ================================================================ */

   SELECT
    CASE
        WHEN Age < 25 THEN 'Under 25'
        WHEN Age < 35 THEN '25-34'
        WHEN Age < 45 THEN '35-44'
        WHEN Age < 55 THEN '45-54'
        WHEN Age < 65 THEN '55-64'
        ELSE '65+'
    END AS [Age_Group],
    Count(*) AS [Total_Customers],
    Round(Avg(calls_made),2) AS [Avg_Calls_Made]
    From telecom_churn
    Group by CASE
        WHEN Age < 25 THEN 'Under 25'
        WHEN Age < 35 THEN '25-34'
        WHEN Age < 45 THEN '35-44'
        WHEN Age < 55 THEN '45-54'
        WHEN Age < 65 THEN '55-64'
        ELSE '65+'
    END
    Order by [Avg_Calls_Made] Desc

/* ================================================================
   PHASE 3 — BIVARIATE ANALYSIS SUMMARY

   CUSTOMER CHURN
   ────────────────────────────────────────────────────────────────
   01 → Churn vs Gender
   02 → Churn vs Age Group
   03 → Churn vs Number of Dependents
   04 → Churn vs Salary Group
   05 → Churn vs Calls Made
   06 → Churn vs SMS Usage
   07 → Churn vs Data Usage

   TELECOM PARTNER
   ────────────────────────────────────────────────────────────────
   08 → Telecom Partner vs Customer Count
   09 → Telecom Partner vs Churn
   10 → Telecom Partner vs Data Usage

   GEOGRAPHIC ANALYSIS
   ────────────────────────────────────────────────────────────────
   11 → State vs Churn
   12 → City vs Churn

   CUSTOMER USAGE BEHAVIOR
   ────────────────────────────────────────────────────────────────
   13 → Gender vs Customer Usage
   14 → Age Group vs Data Usage
   15 → Age Group vs Call Usage

   ================================================================ */
						
						PROJECT PHASE - 4
	/* ================================================================
   TELECOM CUSTOMER CHURN & RETENTION INTELLIGENCE
   PHASE 4 — MULTIVARIATE ANALYSIS

   Perspective:Customer Churn,Telecom Partner,Geographic Analysis,Customer Usage Behavior,Retention Strategy
   End Consumer:Telecom Company Management & Customer Retention Team
   Dataset:Telecom Churn Dataset
   Columns:
   customer_id
   telecom_partner
   gender
   age
   state
   city
   pincode
   date_of_registration
   num_dependents
   estimated_salary
   calls_made
   sms_sent
   data_used
   churn

   ================================================================ */


/* ================================================================
   MULTIVARIATE ANALYSIS 01 — PARTNER + AGE GROUP + CHURN
   ================================================================

   How can we compare churn across telecom partners
   and age groups simultaneously?

   ================================================================ */

   WITH T1 AS (
    SELECT
        Telecom_Partner,

        CASE
            WHEN Age < 25 THEN 'Under-25'
            WHEN Age < 35 THEN '25-34'
            WHEN Age < 45 THEN '35-44'
            WHEN Age < 55 THEN '45-54'
            WHEN Age < 65 THEN '55-64'
            ELSE '65+'
        END AS [Age_Group],

        COUNT(*) AS [Total_Customers],

        SUM(
            CASE
                WHEN Churn = 1 THEN 1
                ELSE 0
            END
        ) AS [Churned_Customers]

    FROM telecom_churn

    GROUP BY
        Telecom_Partner,

        CASE
            WHEN Age < 25 THEN 'Under-25'
            WHEN Age < 35 THEN '25-34'
            WHEN Age < 45 THEN '35-44'
            WHEN Age < 55 THEN '45-54'
            WHEN Age < 65 THEN '55-64'
            ELSE '65+'
        END
)

SELECT
    *,
    [Churned_Customers] * 100.0 / [Total_Customers] AS [Churn_Rate]

FROM T1

ORDER BY [Churn_Rate] DESC;


/* ================================================================
   MULTIVARIATE ANALYSIS 02 — PARTNER + GENDER + CHURN
   ================================================================

   How can we compare churn across telecom partners
   while also considering gender?

   ================================================================ */

With T1 AS (
Select 
     telecom_partner,Gender,
    Count(*) AS [Total_Customer],
    Sum(
        Case
            When churn = 1  Then 1 
        Else 0
        End 
        ) AS [Churned_Customer]
        From telecom_churn
        Group by   telecom_partner,Gender
        )
        Select *,
         [Churned_Customer] * 100.0 / [Total_Customer] AS [Churn_Rate]
            From T1 

/* ================================================================
   MULTIVARIATE ANALYSIS 03 — PARTNER + SALARY GROUP + CHURN
   ================================================================

   PRACTICAL QUESTION:
   Which salary segments are most likely to churn
   within each telecom partner?

   TECHNICAL QUESTION:
   How does churn vary across telecom partners
   and salary segments?

   HINT:
   CASE WHEN + GROUP BY + Churn Rate

   ================================================================ */

WITH T1 AS (
    SELECT
        Telecom_Partner,

        CASE
            WHEN Estimated_Salary < 50000
                THEN 'Low Salary'

            WHEN Estimated_Salary BETWEEN 50000 AND 99999
                THEN 'Medium Salary'

            ELSE 'High Salary'
        END AS [Salary_Group],

        COUNT(*) AS [Total_Customers],

        SUM(
            CASE
                WHEN Churn = 1 THEN 1
                ELSE 0
            END
        ) AS [Churned_Customers]

    FROM telecom_churn

    GROUP BY
        Telecom_Partner,

        CASE
            WHEN Estimated_Salary < 50000
                THEN 'Low Salary'

            WHEN Estimated_Salary BETWEEN 50000 AND 99999
                THEN 'Medium Salary'

            ELSE 'High Salary'
        END
)

SELECT
    *,
    [Churned_Customers] * 100.0 / [Total_Customers] AS [Churned_Rate]

FROM T1

ORDER BY [Churned_Rate] DESC;
   


/* ================================================================
   MULTIVARIATE ANALYSIS 04 — PARTNER + STATE + CHURN
   ================================================================

   PRACTICAL QUESTION:
   Which telecom partner has the highest churn
   in each state?

   TECHNICAL QUESTION:
   How can we identify geographic churn hotspots
   within individual telecom partners?

   HINT:
   GROUP BY telecom_partner, state + Churn Rate

   ================================================================ */

WITH T1 AS (
    SELECT
        Telecom_Partner,
        State,

        COUNT(*) AS [Total_Customers],

        SUM(
            CASE
                WHEN Churn = 1 THEN 1
                ELSE 0
            END
        ) AS [Churned_Customers]

    FROM telecom_churn

    GROUP BY
        Telecom_Partner,
        State
)

SELECT
    *,
    [Churned_Customers] * 100.0 / [Total_Customers]
        AS [Churn_Rate_Percentage]

FROM T1

ORDER BY [Churn_Rate_Percentage] DESC;

/* ================================================================
   MULTIVARIATE ANALYSIS 05 — STATE + CITY + CHURN
   ================================================================

   How can we analyze geographic churn at both
   state and city levels?

   ================================================================ */
WITH T1 AS (
    SELECT
        State,
        City,

        COUNT(*) AS [Total_Customers],

        SUM(
            CASE
                WHEN Churn = 1 THEN 1
                ELSE 0
            END
        ) AS [Churned_Customers]

    FROM telecom_churn

    GROUP BY
        State,City
        
)

SELECT
    *,
    [Churned_Customers] * 100.0 / [Total_Customers]
        AS [Churn_Rate_Percentage]

FROM T1

ORDER BY [Churn_Rate_Percentage] DESC;


/* ================================================================
   MULTIVARIATE ANALYSIS 06 — AGE GROUP + USAGE + CHURN
   ================================================================

   Which age groups show high churn along with
   different usage behavior?


   ================================================================ */

  WITH T1 AS (
    SELECT
        CASE
            WHEN Age < 25 THEN 'Under 25'
            WHEN Age < 35 THEN '25-34'
            WHEN Age < 45 THEN '35-44'
            WHEN Age < 55 THEN '45-54'
            WHEN Age < 65 THEN '55-64'
            ELSE '65+'
        END AS [Age_Group],

        ROUND(AVG(Calls_Made), 2) AS [Average_Calls],

        ROUND(AVG(SMS_Sent), 2) AS [Average_SMS],

        ROUND(AVG(Data_Used), 2) AS [Average_Data_Usage],

        COUNT(*) AS [Total_Customers],

        SUM(
            CASE
                WHEN Churn = 1 THEN 1
                ELSE 0
            END
        ) AS [Churned_Customers]

    FROM telecom_churn

    GROUP BY
        CASE
            WHEN Age < 25 THEN 'Under 25'
            WHEN Age < 35 THEN '25-34'
            WHEN Age < 45 THEN '35-44'
            WHEN Age < 55 THEN '45-54'
            WHEN Age < 65 THEN '55-64'
            ELSE '65+'
        END
)

SELECT
    [Age_Group],
    [Average_Calls],
    [Average_SMS],
    [Average_Data_Usage],

    [Churned_Customers] * 100.0 / [Total_Customers]
        AS [Churn_Rate]

FROM T1

ORDER BY [Churn_Rate] DESC;



/* ================================================================
   MULTIVARIATE ANALYSIS 07 — GENDER + USAGE + CHURN
   ================================================================

   How do gender, usage metrics and churn interact?

   ================================================================ */

WITH T1 AS (
    SELECT
        Gender,

        ROUND(AVG(Calls_Made), 2) AS [Average_Calls],

        ROUND(AVG(SMS_Sent), 2) AS [Average_SMS],

        ROUND(AVG(Data_Used), 2) AS [Average_Data_Usage],

        SUM(
            CASE
                WHEN Churn = 1 THEN 1
                ELSE 0
            END
        ) AS [Churned_Customers],

        COUNT(*) AS [Total_Customers]

    FROM telecom_churn

    GROUP BY Gender
)

SELECT Gender,
    [Average_Calls],[Average_SMS],[Average_Data_Usage],
    [Churned_Customers] * 100.0 / [Total_Customers]
        AS [Churn_Rate]

FROM T1

ORDER BY [Churn_Rate] DESC;

/* ================================================================
   MULTIVARIATE ANALYSIS 08 — DEPENDENTS + AGE GROUP + CHURN
   ================================================================

   Which combinations of age group and dependents
   have higher churn?

   ================================================================ */

WITH T1 AS (
    SELECT
        CASE
            WHEN Age < 25 THEN 'Under 25'
            WHEN Age BETWEEN 25 AND 34 THEN '25-34'
            WHEN Age BETWEEN 35 AND 44 THEN '35-44'
            WHEN Age BETWEEN 45 AND 54 THEN '45-54'
            WHEN Age BETWEEN 55 AND 64 THEN '55-64'
            ELSE '65+'
        END AS [Age_Group],

        Num_Dependents,

        COUNT(*) AS [Total_Customers],

        SUM(
            CASE
                WHEN Churn = 1 THEN 1
                ELSE 0
            END
        ) AS [Churned_Customers]

    FROM telecom_churn

    GROUP BY
        CASE
            WHEN Age < 25 THEN 'Under 25'
            WHEN Age BETWEEN 25 AND 34 THEN '25-34'
            WHEN Age BETWEEN 35 AND 44 THEN '35-44'
            WHEN Age BETWEEN 45 AND 54 THEN '45-54'
            WHEN Age BETWEEN 55 AND 64 THEN '55-64'
            ELSE '65+'
        END,

        Num_Dependents
)

SELECT
    [Age_Group],
    [Num_Dependents],
    [Total_Customers],
    [Churned_Customers],

    [Churned_Customers] * 100.0 / [Total_Customers]
        AS [Churn_Rate]

FROM T1

ORDER BY [Churn_Rate] DESC;

/* ================================================================
   MULTIVARIATE ANALYSIS 09 — PARTNER + USAGE + CHURN
   ================================================================

   Which telecom partners have high churn combined
   with low customer usage?

   ================================================================ */

With T1 AS (
SELECT
    telecom_partner,

    ROUND(AVG(calls_made), 2) AS average_calls,

    ROUND(AVG(sms_sent), 2) AS average_sms,

    ROUND(AVG(data_used), 2) AS average_data_usage,
    
    Sum(
         Case
            When churn = 1 Then 1
        Else 0
        End 
        ) AS [Churned_Customer],
        Count(*) AS [Total_Customer]
        From telecom_churn
        Group by  telecom_partner
)
    Select 
        telecom_partner,
        average_calls,
        average_sms,
        average_data_usage,
        [Churned_Customer] * 100.0 / [Total_Customer] AS [Churned_Rate]
        From T1
        Order by [Churned_Rate] Desc


/* ================================================================
   MULTIVARIATE ANALYSIS 10 — PARTNER + STATE + AGE GROUP
   ================================================================

   How can we analyze customer distribution
   using telecom partner, state and age group?
   ================================================================ */

    Select 
            Telecom_partner,
            state,
            count(*) AS [Total_Customer],
                Case
                   When age < 25 Then 'Under 25'
                   When age  < 35 Then '25-34'
                   When age < 45 Then '35-44'
                   When age < 55 Then '45- 54'
                   When age < 65 Then '55- 64'
            Else '65+'
            End  AS [Age_Group]
             
            From telecom_churn
            Group by Telecom_partner,
                    state, 
                Case
                   When age < 25 Then 'Under 25'
                   When age  < 35 Then '25-34'
                   When age < 45 Then '35-44'
                   When age < 55 Then '45- 54'
                   When age < 65 Then '55- 64'
            Else '65+'
            End
            Order by [Total_Customer] Desc
   

/* ================================================================
   MULTIVARIATE ANALYSIS 11 — SALARY + USAGE + CHURN
   ================================================================

   How do salary group, average usage and churn rate
   interact?

   ================================================================ */

WITH T1 AS (
    SELECT
        CASE
            WHEN Estimated_Salary < 50000
                THEN 'Low Salary'

            WHEN Estimated_Salary BETWEEN 50000 AND 99999
                THEN 'Medium Salary'

            ELSE 'High Salary'
        END AS [Salary_Group],

        ROUND(AVG(Calls_Made), 2) AS [Average_Calls],

        ROUND(AVG(SMS_Sent), 2) AS [Average_SMS],

        ROUND(AVG(Data_Used), 2) AS [Average_Data_Usage],

        SUM(
            CASE
                WHEN Churn = 1 THEN 1
                ELSE 0
            END
        ) AS [Total_Churned],

        COUNT(*) AS [Total_Customers]

    FROM telecom_churn

    GROUP BY
        CASE
            WHEN Estimated_Salary < 50000
                THEN 'Low Salary'

            WHEN Estimated_Salary BETWEEN 50000 AND 99999
                THEN 'Medium Salary'

            ELSE 'High Salary'
        END
)

SELECT
    [Salary_Group],
    [Average_Calls],
    [Average_SMS],
    [Average_Data_Usage],

    [Total_Churned] * 100.0 / [Total_Customers]
        AS [Churn_Rate]

FROM T1

ORDER BY [Churn_Rate] DESC;

/* ================================================================
   MULTIVARIATE ANALYSIS 12 — CITY + PARTNER + CHURN
   ================================================================

   How can we compare partner performance
   across different cities?

   ================================================================ */

WITH T1 AS (
    SELECT
        City,
        Telecom_Partner,

        COUNT(*) AS [Total_Customers],

        SUM(
            CASE
                WHEN Churn = 1 THEN 1
                ELSE 0
            END
        ) AS [Total_Churned]

    FROM telecom_churn

    GROUP BY
        City,
        Telecom_Partner
)

SELECT
    *,
    [Total_Churned] * 100.0 / [Total_Customers]
        AS [Churn_Rate]

FROM T1

ORDER BY [Churn_Rate] DESC;


/* ================================================================
   MULTIVARIATE ANALYSIS 13 — AGE + SALARY + CHURN
   ================================================================

   How can we analyze customer churn using
   age group and salary group simultaneously?

   ================================================================ */

   WITH T1 AS (
    SELECT
        CASE
            WHEN Age < 25 THEN 'Under 25'
            WHEN Age < 35 THEN '25-34'
            WHEN Age < 45 THEN '35-44'
            WHEN Age < 55 THEN '45-54'
            WHEN Age < 65 THEN '55-64'
            ELSE '65+'
        END AS [Age_Group],

        CASE
            WHEN Estimated_Salary < 50000
                THEN 'Low Salary'

            WHEN Estimated_Salary BETWEEN 50000 AND 99999
                THEN 'Medium Salary'

            ELSE 'High Salary'
        END AS [Salary_Group],

        COUNT(*) AS [Total_Customers],

        SUM(
            CASE
                WHEN Churn = 1 THEN 1
                ELSE 0
            END
        ) AS [Churned_Customers]

    FROM telecom_churn

    GROUP BY
        CASE
            WHEN Age < 25 THEN 'Under 25'
            WHEN Age < 35 THEN '25-34'
            WHEN Age < 45 THEN '35-44'
            WHEN Age < 55 THEN '45-54'
            WHEN Age < 65 THEN '55-64'
            ELSE '65+'
        END,

        CASE
            WHEN Estimated_Salary < 50000
                THEN 'Low Salary'

            WHEN Estimated_Salary BETWEEN 50000 AND 99999
                THEN 'Medium Salary'

            ELSE 'High Salary'
        END
)

SELECT
    *,
    [Churned_Customers] * 100.0 / [Total_Customers]
        AS [Churn_Rate]

FROM T1

ORDER BY [Churn_Rate] DESC;
  

/* ================================================================
   MULTIVARIATE ANALYSIS 14 — USAGE LEVEL + PARTNER + CHURN
   ================================================================

   How can customers be classified by data usage
   and then compared across telecom partners?

   ================================================================ */

WITH T1 AS (
    SELECT
        Telecom_Partner,

        CASE
            WHEN Data_Used < 3000
                THEN 'Low Data Usage'

            WHEN Data_Used < 7000
                THEN 'Medium Data Usage'

            ELSE 'High Data Usage'
        END AS [Data_Usage_Group],

        COUNT(*) AS [Total_Customers],

        SUM(
            CASE
                WHEN Churn = 1 THEN 1
                ELSE 0
            END
        ) AS [Churned_Customers]

    FROM telecom_churn

    GROUP BY
        Telecom_Partner,

        CASE
            WHEN Data_Used < 3000
                THEN 'Low Data Usage'

            WHEN Data_Used < 7000
                THEN 'Medium Data Usage'

            ELSE 'High Data Usage'
        END
)

SELECT
    *,
    [Churned_Customers] * 100.0 / [Total_Customers]
        AS [Churn_Rate]

FROM T1

ORDER BY [Churn_Rate] DESC;

/* ================================================================
   MULTIVARIATE ANALYSIS 15 — RETENTION PRIORITY SEGMENTS
   ================================================================

   PRACTICAL QUESTION:
   Which customer segments should the retention team
   prioritize for intervention?

   ================================================================ */

WITH T1 AS (
    SELECT
        Telecom_Partner,

        CASE
            WHEN Age < 25 THEN 'Under 25'
            WHEN Age BETWEEN 25 AND 34 THEN '25-34'
            WHEN Age BETWEEN 35 AND 44 THEN '35-44'
            WHEN Age BETWEEN 45 AND 54 THEN '45-54'
            WHEN Age BETWEEN 55 AND 64 THEN '55-64'
            ELSE '65+'
        END AS [Age_Group],

        CASE
            WHEN Data_Used < 3000 THEN 'Low Data Usage'
            WHEN Data_Used BETWEEN 3000 AND 7000 THEN 'Medium Data Usage'
            ELSE 'High Data Usage'
        END AS [Data_Usage_Group],

        COUNT(*) AS [Total_Customers],

        SUM(
            CASE
                WHEN Churn = 1 THEN 1
                ELSE 0
            END
        ) AS [Churned_Customers]

    FROM telecom_churn

    GROUP BY
        Telecom_Partner,

        CASE
            WHEN Age < 25 THEN 'Under 25'
            WHEN Age BETWEEN 25 AND 34 THEN '25-34'
            WHEN Age BETWEEN 35 AND 44 THEN '35-44'
            WHEN Age BETWEEN 45 AND 54 THEN '45-54'
            WHEN Age BETWEEN 55 AND 64 THEN '55-64'
            ELSE '65+'
        END,

        CASE
            WHEN Data_Used < 3000 THEN 'Low Data Usage'
            WHEN Data_Used BETWEEN 3000 AND 7000 THEN 'Medium Data Usage'
            ELSE 'High Data Usage'
        END
)

SELECT
    *,
    [Churned_Customers] * 100.0 / [Total_Customers]
        AS [Churn_Rate]

FROM T1

ORDER BY [Churn_Rate] DESC;

/* ================================================================
   PHASE 4 — MULTIVARIATE ANALYSIS SUMMARY

   CUSTOMER CHURN
   ────────────────────────────────────────────────────────────────
   01 → Partner + Age Group + Churn
   02 → Partner + Gender + Churn
   03 → Partner + Salary Group + Churn
   06 → Age Group + Usage + Churn
   08 → Dependents + Age Group + Churn
   11 → Salary + Usage + Churn
   13 → Age Group + Salary Group + Churn
   14 → Usage Level + Partner + Churn

   TELECOM PARTNER
   ────────────────────────────────────────────────────────────────
   04 → Partner + State + Churn
   09 → Partner + Usage + Churn
   10 → Partner + State + Age Group
   12 → City + Partner + Churn

   GEOGRAPHIC ANALYSIS
   ────────────────────────────────────────────────────────────────
   04 → Partner + State + Churn
   05 → State + City + Churn
   12 → City + Partner + Churn

   CUSTOMER USAGE BEHAVIOR
   ────────────────────────────────────────────────────────────────
   06 → Age Group + Usage + Churn
   07 → Gender + Usage + Churn
   09 → Partner + Usage + Churn
   11 → Salary + Usage + Churn
   14 → Usage Level + Partner + Churn

   RETENTION STRATEGY
   ────────────────────────────────────────────────────────────────
   15 → Retention Priority Segments

   ================================================================
	