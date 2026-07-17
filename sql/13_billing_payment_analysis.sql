-- 1. Which payment methods have highest churn?
select 
	payment_method ,
	count(*) as churned_customers ,
	round( count(*) * 100.0
	/ sum(count(*)) over()
	,2) as churned_customers_pct,
	
	round( avg(churn::int) *100.0
	,2) as churn_rate_pct 

from
	telecom.v_telecom_churn


group by
	payment_method
order by
	churned_customers_pct desc
	
	
-- 2. Does paperless billing correlate with churn?
select
	paperless_billing ,
	count(*) as churned_customers ,
	round( count(*) * 100.0
	/ sum(count(*)) over()
	,2) as churned_customers_pct,
	
	round( avg(churn::int) *100.0 
	,2) as churn_rate_pct
	
from
	telecom.v_telecom_churn
	
group by
	paperless_billing 
order by
	churned_customers_pct desc 
	
	
-- 3. Do higher monthly charges increase churn?

with avg_charges as
( select 
	churn ,
	monthly_charges ,
	round( avg(monthly_charges) over() ,2) as avg_monthly_charges 
	
from
	telecom.v_telecom_churn
)

select
	case 
		when monthly_charges > avg_monthly_charges then 'higher_charges'
		else 'lower_charges'
	end as charges_groups ,
	
	count(*) as churned_customers ,
	round( count(*) * 100.0
	/ sum(count(*)) over() 
	,2) as churned_customers_pct,
	
	round( avg(churn::int) *100.0
	,2) as churn_rate_pct

from 
	avg_charges
group by
	charges_groups
order by
	charges_groups desc