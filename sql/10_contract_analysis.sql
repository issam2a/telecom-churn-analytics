-- 1. Which contract type has highest churn?

select 
	contract ,
	round(
		avg(churn::int) *100.0
	,2) as churn_rate_pct 
from 
	telecom.v_telecom_churn
group by contract 

order by 
	churn_rate_pct desc ;

	
-- 2. Revenue at risk  by contract type
select 
	contract ,
	sum(monthly_charges) as revenue_at_risk_by_contract ,
	round(
		sum(monthly_charges) * 100.0 
		/
		sum(sum(monthly_charges)) over() 
	,2) as revenue_at_risk_by_contract_pct
from 
	telecom.v_telecom_churn

where churn = true 
group by 
	contract 

order by
	revenue_at_risk_by_contract  desc
	;


-- 3. Revenue  by contract type

select 
	contract ,
	sum(monthly_charges) as revenue_by_contract ,

	round (
		sum(monthly_charges) * 100.0 
		/
		sum(sum(monthly_charges)) over() 
	,2 ) as revenue_by_contract_pct
	
from 
	telecom.v_telecom_churn 

group by 
	contract 
order by 
	revenue_by_contract desc
	


-- 4. Contract distribution

select 
	contract,
	count(*) as customers ,
	round(
		count(*) * 100.0 
		/ 
		sum(count(*)) over()
		,2
	) as customers_pct 
from 
	telecom.v_telecom_churn 
group by 
	contract 
order by 
	customers_pct 

-- 5. Impact of long-term contracts

select 
	case 
		when contract = 'Month-to-month' then 'short term'
		else 'long term'
	end as contract_group ,

	count(*) as customers ,

	round(
		avg(churn::int) * 100.0
	,2) as churn_rate_pct
from 
	telecom.v_telecom_churn 
group by 
	contract_group 

