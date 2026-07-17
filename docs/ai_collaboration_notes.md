# AI Collaboration Notes

This project was developed using PostgreSQL, Python, Power BI, and AI-assisted analysis.

AI was used for brainstorming analytical approaches, reviewing SQL logic, and identifying additional business questions. Final analytical decisions were made based on business relevance and dataset limitations.

---

## Example 1: Churn Driver Selection

### AI Suggestion

Include customer age as a predictor of churn.

### Decision

Rejected.

### Rationale

The dataset does not contain age information. Even if age were available, demographic attributes are often less actionable than behavioral indicators such as contract type, tenure, service adoption, and billing behavior.

The analysis focused on variables that can directly support retention initiatives.

---

## Example 2: Revenue Risk Segmentation

### AI Suggestion

Calculate revenue at risk only at the overall company level.

### Decision

Modified.

### Rationale

An aggregate revenue-at-risk metric provides limited business value.

The analysis was expanded to include:

* Revenue at risk by contract type
* Revenue at risk by payment method
* Revenue at risk by tenure group
* Revenue at risk by service adoption

This allows retention efforts to target the segments contributing most to revenue loss.

---

## Example 3: Customer Lifetime Value Analysis

### AI Suggestion

Use a predictive CLV model.

### Decision

Rejected.

### Rationale

The dataset contains only a single customer snapshot and does not include transaction history required for predictive CLV modeling.

Customer Lifetime Value was estimated using TotalCharges as a proxy for historical customer value.

This approach is more appropriate for the available data and maintains analytical transparency.
