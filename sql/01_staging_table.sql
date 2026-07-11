--:Create a staging table

CREATE TABLE telecom.stg_telecom_churn(
customerID text ,
gender text ,
SeniorCitizen text ,
Partner text,
Dependents text,
tenure text ,
PhoneService text,
MultipleLines text,
InternetService text,
OnlineSecurity text,
OnlineBackup text,
DeviceProtection text,
TechSupport text,
StreamingTV text,
StreamingMovies text,
Contract text,
PaperlessBilling text,
PaymentMethod text,
MonthlyCharges text,
TotalCharges text,
Churn text
);

--Notice everything is TEXT.

--Why?

--Because CSV files often contain:

--Empty strings
--Unexpected spaces
--Invalid numbers
--Mixed formats

--we want the import to succeed first. Then clean the data afterward.
