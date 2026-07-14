-----Total Customers--------

select 
	count(*)  as total_customers  
from
	telecom.v_telecom_churn ;


------Churned Customers------
select 
	count(*) as churned_customers 
from 
	telecom.v_telecom_churn
where churn = true ;


-------Active Customers-------
select 
	count(*) as active_customers
from 
	telecom.v_telecom_churn
where churn = false ;


-------Churn Rate------------
select 
	round(
		avg(churn::int) * 100.0 ,
		2 ) as churn_rate_pct
from 
	telecom.v_telecom_churn

;

--------Retention Rate-------

select 
	round(
			sum(
				case 
					when churn = false then 1 
					else 0 
				end 
			) * 100.0 / count(*) 
,2	) as Retention_Rate

from telecom.v_telecom_churn 
;


--------Monthly Revenue------
select 
	sum(monthly_charges) as monthly_revenue 
from 
	telecom.v_telecom_churn

;

--------Revenue at Risk ------
select 
	sum(monthly_charges) as revenue_at_risk
from 
	telecom.v_telecom_churn
where churn = true  
;


---------ARPU for active subscribers--------------

select 
	round(
		avg(monthly_charges)
		,2 ) as ARPU 
from 
	telecom.v_telecom_churn
where churn = false 
;
	
--------Average Revenue Lost per Churned Customer-----

select 
	round(
		avg(monthly_charges)
		,2 ) as Average_Revenue_Lost_per_Churned_Customer
from 
	telecom.v_telecom_churn
where churn = True  
	;

---------Average Tenure-----------------

select 
	round(
		avg(tenure)
		, 2 ) as Average_Tenure
from 
	telecom.v_telecom_churn

--------Average Customer Lifetime Value------

select 
	round (
		avg(monthly_charges * tenure) ,
		2 ) as average_clv
from 
	telecom.v_telecom_churn


---------High-Value Customer Count-----------

select 
	count(*) as High_Value_Customer
from 
	telecom.v_telecom_churn
where monthly_charges * tenure > 5000


