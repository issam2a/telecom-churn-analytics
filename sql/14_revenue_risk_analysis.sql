-- 1. How much revenue is being lost?
select 
	sum(monthly_charges)  filter (where churn = true ) as total_lost_revenue
from 
telecom.v_telecom_churn 



-- 2. Which customer segments contribute most to revenue loss?

-- paymet method
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
	
-- services 
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

-- tenure 
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



-- contract 


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



-- Customer Segment

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




-- 3. Which high-value customers are at greatest risk?


with customer_value as 
(
    select 
        customer_key,
        contract,
        internet_service,
        tech_support,
        churn,
        total_charges,

        ntile(4) over (
            order by  total_charges desc
        ) as value_tier

    from telecom.v_telecom_churn
)

select 
    contract,
    internet_service,
    tech_support,

    count(*) as customers,

    round(
        avg(total_charges), 
        2
    ) as avg_customer_value,

    round(
        avg(churn::int) * 100,
        2
    ) as churn_rate_pct,

    count(*) filter (
        where churn = true
    ) as churned_customers

from customer_value

where value_tier = 1   -- Top 25% highest-value customers

group by 
    contract,
    internet_service,
    tech_support

having count (*) >= 30

order by 
    churn_rate_pct desc;