# Telecom Customer Churn Analytics

## Project Overview

This project analyzes customer churn in a telecommunications company using PostgreSQL, Python, and Power BI.

The objective is to identify the factors driving customer churn, quantify revenue at risk, evaluate customer lifetime value, and provide actionable recommendations to improve customer retention.

---

## Business Problem

Customer acquisition is significantly more expensive than customer retention.

The telecom company has observed customer attrition and wants to understand:

* Which customers are most likely to churn
* Which products and services influence retention
* How much revenue is being lost due to churn
* Which customer segments should be prioritized for retention efforts

---

## Project Objectives

### Customer Analysis

* Analyze demographic factors associated with churn
* Evaluate the impact of senior citizen status, partners, and dependents
* Identify high-risk demographic segments

### Contract Analysis

* Measure churn rates by contract type
* Evaluate revenue distribution across contract segments
* Assess the impact of long-term contracts on retention

### Tenure Analysis

* Identify high-risk periods within the customer lifecycle
* Measure first-year churn
* Compare retention between short-term and long-term customers

### Service Adoption Analysis

* Evaluate the impact of:

  * Tech Support
  * Online Security
  * Device Protection
* Identify service combinations associated with lower churn

### Billing and Payment Analysis

* Analyze churn by payment method
* Evaluate the impact of paperless billing
* Assess whether higher monthly charges increase churn risk

### Revenue Risk Analysis

* Calculate revenue at risk
* Identify revenue-loss segments
* Quantify the financial impact of churn

### Customer Lifetime Value Analysis

* Estimate customer lifetime value (CLV)
* Identify high-value customer groups
* Assess churn risk among high-value customers

---

# Dataset

**Dataset:** Telco Customer Churn Dataset

**Target Variable:** Churn (Yes/No)

**Granularity:** One record represents one customer.

Key attributes include:

* Customer demographics
* Contract information
* Service subscriptions
* Billing characteristics
* Payment methods
* Revenue metrics
* Churn status

---

# Data Architecture

The original flat file was transformed into a dimensional star schema.

## Fact Table

### fact_customer_churn

Stores customer-level churn and revenue metrics.

---

## Dimension Tables

### dim_customer

Customer demographic attributes.

### dim_service

Service subscription attributes.

### dim_billing

Billing and payment information.

---

## Analytical View

### v_telecom_churn

A business-friendly analytical view created by joining the fact table and dimensions.

This view is used for all analytical SQL queries.

---

# Data Preparation

Completed tasks:

* Imported raw CSV data into PostgreSQL staging table
* Performed data quality assessment
* Identified missing and invalid values
* Converted columns to appropriate data types
* Created cleaned dataset
* Designed dimensional star schema
* Populated fact and dimension tables
* Created analytical reporting view

---

# Key Metrics

## Customer Metrics

* Total Customers
* Active Customers
* Churned Customers
* Churn Rate
* Retention Rate

## Revenue Metrics

* Monthly Revenue
* Revenue at Risk
* Average Revenue Per User (ARPU)
* Average Revenue Lost per Churned Customer

## Customer Value Metrics

* Average Customer Lifetime Value
* Average Tenure
* High-Value Customer Count

---

# Technology Stack

## Database

* PostgreSQL

## Analytics

* SQL
* Window Functions
* Common Table Expressions (CTEs)

## Programming

* Python
* Pandas
* NumPy
* Matplotlib

## Visualization

* Power BI

## Version Control

* Git
* GitHub

## AI-Assisted Development

AI tools were used to:
- Review SQL logic
- Brainstorm analytical questions
- Suggest alternative metrics

Analytical decisions, metric definitions, and business interpretations were validated manually and adapted to the dataset constraints.

docs/ai_collaboration_notes.md
https://github.com/issam2a/telecom-churn-analytics/blob/main/docs/ai_collaboration_notes.md


---

# Project Structure

```text
telecom-churn-analytics/

├── data/
│
├── docs/
│   ├── business_requirements.md
│   ├── findings/
│
├── sql/
│   ├── 00_data_quality_checks.sql
│   ├── 01_data_cleaning.sql
│   ├── 02_customer_analysis.sql
│   ├── 03_contract_analysis.sql
│   ├── 04_tenure_analysis.sql
│   ├── 05_service_analysis.sql
│   ├── 06_billing_analysis.sql
│   ├── 07_business_metrics.sql
│   ├── 08_revenue_risk_analysis.sql
│   └── 09_customer_lifetime_value.sql
│
├── python/
│   └── exploratory_analysis.ipynb
│
├── powerbi/
│   └── telecom_churn_dashboard.pbix
│
└── README.md
```

---

# Current Status

Completed:

* Business requirements definition
* Data quality assessment
* Data cleaning
* Star schema design
* Fact and dimension table creation
* Analytical view creation
* KPI development
* Customer analysis
* Contract analysis
* Tenure analysis
* Service analysis
* Billing analysis
* Revenue risk analysis
* Customer lifetime value analysis

In Progress:

* Python exploratory analysis
* Statistical validation
* Power BI dashboard development
* Final business findings and recommendations

---

# Future Improvements

* Predictive churn modeling using machine learning
* Customer risk scoring
* Cohort retention analysis
* Survival analysis
* Automated reporting pipeline
* Customer segmentation using clustering techniques

```
```
