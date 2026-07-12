# Business Requirements Document

## Project Title

**Telecom Customer Churn Analysis**

---

## Business Context

The telecom industry is highly competitive, and customer acquisition costs are significantly higher than customer retention costs.

The company has observed customer attrition and wants to understand the factors driving churn in order to improve retention, protect recurring revenue, and increase customer lifetime value.

This project aims to analyze customer demographics, subscription behavior, service adoption, billing characteristics, and contract information to identify churn patterns and actionable retention opportunities.

---

## Business Objective

Reduce customer churn by identifying:

- Customer segments with elevated churn risk
- Products and services associated with retention or attrition
- Revenue exposed to customer churn
- Opportunities for targeted retention campaigns

---

## Analytical Objectives

### Customer Analysis

Understand how customer characteristics influence churn.

Questions:

- Are senior citizens more likely to churn?
- Does having a partner reduce churn?
- Does having dependents reduce churn?
- Are there demographic segments with significantly higher churn rates?

---

### Contract Analysis

Evaluate the impact of contract structure on customer retention.

Questions:

- Which contract type has the highest churn rate?
- How much revenue is associated with each contract segment?
- Would migrating customers to longer contracts reduce churn exposure?

---

### Tenure Analysis

Measure customer retention throughout the customer lifecycle.

Questions:

- During which tenure period is churn highest?
- What percentage of churn occurs within the first year?
- Are long-tenured customers less likely to churn?

---

### Service Adoption Analysis

Assess whether specific services improve retention.

Questions:

- Does Tech Support reduce churn?
- Does Online Security reduce churn?
- Does Device Protection reduce churn?
- Which service combinations are associated with the lowest churn rates?

---

### Billing and Payment Analysis

Investigate the relationship between payment behavior and churn.

Questions:

- Which payment methods exhibit the highest churn rates?
- Does paperless billing correlate with churn?
- Are customers with higher monthly charges more likely to leave?

---

### Revenue Risk Analysis

Quantify the financial impact of churn.

Questions:

- How much monthly recurring revenue is currently being lost?
- Which customer segments contribute most to revenue loss?
- Which high-value customers are at greatest risk?

---

### Customer Lifetime Value Analysis

Evaluate customer value over time.

Questions:

- What is the estimated customer lifetime value across segments?
- Which customer groups generate the highest long-term value?
- Are high-value customers churning at a concerning rate?

---

## Key Performance Indicators (KPIs)

### Customer Metrics

- Total Customers
- Churned Customers
- Active Customers
- Churn Rate (%)
- Retention Rate (%)

---

### Revenue Metrics

- Monthly Revenue
- Revenue at Risk
- Average Revenue Per User (ARPU)
- Average Revenue Lost per Churned Customer

---

### Customer Value Metrics

- Average Customer Lifetime Value
- Average Tenure
- High-Value Customer Count

---

### Service Metrics

- Churn Rate by Contract
- Churn Rate by Internet Service
- Churn Rate by Payment Method
- Churn Rate by Service Adoption

---

## Deliverables

### PostgreSQL

- Star schema design
- Data quality assessment
- Analytical SQL queries
- Business metrics layer
- Customer churn analytical view

---

### Python

- Exploratory data analysis
- Statistical validation of churn drivers
- Customer segmentation analysis

---

### Power BI Dashboard

#### Executive Overview

- Total Customers
- Churn Rate
- Revenue at Risk
- Retention Rate

#### Customer Segmentation

- Churn by Tenure
- Churn by Contract
- Churn by Demographics

#### Revenue Analysis

- Revenue at Risk
- High-Value Customer Segments
- Customer Lifetime Value

#### Retention Opportunities

- High-Risk Segments
- Recommended Retention Actions

---

## Expected Business Outcomes

The analysis should enable the business to:

1. Identify the primary drivers of customer churn.
2. Quantify revenue loss associated with churn.
3. Prioritize high-risk customer segments.
4. Develop targeted retention strategies.
5. Improve customer lifetime value through service adoption and contract optimization.