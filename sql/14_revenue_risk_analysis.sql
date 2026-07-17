-- 1. How much monthly recurring revenue is currently being lost?
select 
	sum(monthly_charges)  filter (where churn = true ) as total_lost_revenue
from 
telecom.v_telecom_churn 



-- 2. Which contract segments contribute most to revenue loss?

select 
	contract ,
	sum(monthlY_charges) as lost_revenue ,

	round(
		sum(monthly_charges) *100.0 
		/
		sum(
			sum(monthly_charges) 
			) over()
	,2 ) as lsot_revenue_pct 
from 
	telecom.v_telecom_churn 

where churn = true 

group  by 
	contract

order by 
	lsot_revenue_pct  desc

-- 3. Which payment methods contribute most to revenue loss?
select 
	payment_method ,
	sum(monthlY_charges) as lost_revenue ,

	round(
		sum(monthly_charges) *100.0 
		/
		sum(
			sum(monthly_charges) 
			) over()
	,2 ) as lsot_revenue_pct 
from 
	telecom.v_telecom_churn 

where churn = true 

group  by 
	payment_method

order by 
	lsot_revenue_pct  desc
	
-- 4.  Which service segments contribute most to revenue loss?
select 
	tech_support ,
	sum(monthlY_charges) as lost_revenue ,

	round(
		sum(monthly_charges) *100.0 
		/
		sum(
			sum(monthly_charges) 
			) over()
	,2 ) as lsot_revenue_pct 
from 
	telecom.v_telecom_churn 

where churn = true 

group  by 
	tech_support

order by 
	lsot_revenue_pct  desc

	

-- 5. Which tenure groups contribute most to revenue loss?
select 
	
	case
		when tenure <=12 then '0-12 Months'
		when tenure <=24 then '13-24 Months'
		when tenure <=48 then '25-48 Months'
		else '+45 Months'
	end as tenure_groups ,
	
	sum(monthlY_charges) as lost_revenue ,

	round(
		sum(monthly_charges) *100.0 
		/
		sum(
			sum(monthly_charges) 
			) over()
	,2 ) as lsot_revenue_pct 
from 
	telecom.v_telecom_churn 

where churn = true 

group  by 
	tenure_groups

order by 
	lsot_revenue_pct  desc








-- 6. Which customer segments generate the highest revenue at risk?

select 
    contract,
    internet_service,
    tech_support,

    count(*)   as customers,

    sum(monthly_charges) filter (where churn = true ) as revenue_at_risk,

    round(
        avg(churn::int) * 100,
        2
    ) as churn_rate_pct

from telecom.v_telecom_churn



group by
    contract,
    internet_service,
    tech_support

having count(*) >= 30 

order by  revenue_at_risk desc;




