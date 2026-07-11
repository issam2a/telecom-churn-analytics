
-- Validate the staging data

select * from telecom.stg_telecom_churn;


-- check  Row Count
select 
	count(*)
from telecom.stg_telecom_churn ;

-- check for missing values 
select
	 COUNT(*) AS missing_customerid
from
	telecom.stg_telecom_churn
where customerID is null 
or trim(customerid) = ''
;


-- check for duplicated value 
select
	customerid ,
	count(*) 
from telecom.stg_telecom_churn
group by customerid 
having count(*) > 1 ;



-- Check bad TotalCharges values:
select tenure ,  totalcharges , monthlycharges 
from telecom.stg_telecom_churn
where totalcharges !~ '^\d+(\.\d+)?$'
and totalcharges <> '';


-- Check bad monthlycharges values:
select monthlycharges 
from telecom.stg_telecom_churn
where monthlycharges !~ '^\d+(\.\d+)?$'
and monthlycharges <> '';


-- churn values 
select 
	distinct churn 
from telecom.stg_telecom_churn;


-- gender values 
select 
	distinct gender 
from 
	telecom.stg_telecom_churn;

-- Contract Values
select 
	distinct  contract 
from telecom.stg_telecom_churn;

-- Payment Method Values

select 
	distinct paymentmethod 
from 
	telecom.stg_telecom_churn;


-- Tenure Validation

select 
	tenure
from 
	telecom.stg_telecom_churn
where tenure !~ '^\d+$'
and trim(tenure) <> '';
