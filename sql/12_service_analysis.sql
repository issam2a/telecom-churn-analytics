-- 1.Does Tech Support reduce churn?

select 
	tech_support,
	round(
		avg(churn::int) * 100.0 

	,2) as churn_rate_pct,

	count(*) as customers 

from 
	telecom.v_telecom_churn 

group by 
	tech_support
order by 
	churn_rate_pct desc 
	

-- 2. Does Online Security reduce churn?

select 

	ds.online_security ,
	
	round(
		avg(f.churn::int) *100.0 
		, 2 
		) as churn_rate_pct,

		count(*) as customers 
		
from 
	telecom.dim_service ds 

join 
	telecom.fact_customer_churn f 
on 
	ds.service_key = f.service_key
	

group by 
	ds.online_security
order by
	churn_rate_pct desc 


-- 3. Does Device Protection reduce churn?


select 

	ds.device_Protection ,
	
	round(
		avg(f.churn::int) *100.0 
		, 2 
		) as churn_rate_pct,

		count(*) as customers 
		
from 
	telecom.dim_service ds 

join 
	telecom.fact_customer_churn f 
on 
	ds.service_key = f.service_key
	

group by 
	ds.device_Protection
order by
	churn_rate_pct desc 

-- 4. Which service combinations reduce churn?

select 
	
	ds.internet_service ,
	ds.online_security  ,
	ds.online_backup,
	ds.device_protection ,
	ds.tech_support ,
	round(
		avg(f.churn::int) *100.0 
		, 2 
		) as churn_rate_pct,

		count(*) as customers 
	
	
from 
	telecom.dim_service ds
join 
	telecom.fact_customer_churn f 
on 
	ds.service_key = f.service_key
	
group by 

	ds.internet_service ,
	ds.online_security  ,
	ds.online_backup,
	ds.device_protection ,
	ds.tech_support 
having 
	count(*) > 30
order by 
	churn_rate_pct 


	

-- 5. Revenue at Risk by Service
select 
	phone_service,
	internet_service,
	tech_support,
	count(*) as churned_customers ,
	round (
		count(*) *100.0
		/
		sum(count(*)) over() 
		,2) as churned_customers_pct,
		
	sum(monthly_charges) as revenue_at_risk,
	round(
		sum(monthly_charges) * 100.0
		/
		sum(sum(monthly_charges)) over() 
		,2)  as revenue_at_risk_pct
		
from 
	telecom.v_telecom_churn
	
where churn = true 

group by 
	phone_service,
	internet_service ,
	tech_support
	
having count(*) > 30 

order by 
	revenue_at_risk_pct desc
	
