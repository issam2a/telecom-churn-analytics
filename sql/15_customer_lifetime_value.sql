-- What is the estimated customer lifetime value across segments?

-- by contract 

select 
	contract ,
	round(
		avg(total_charges) 
	,2) as avg_clv
from 
	telecom.v_telecom_churn
group by 
	contract 
order by 
	avg_clv desc 
;


-- Tenure Group

select 
	case
		when tenure <=12 then '0-12 Months'
		when tenure <=24 then '13-24 Months'
		when tenure <=48 then '25-48 Months'
		else '+45 Months'
	end as tenure_groups ,

	round(
		avg(total_charges) 
	,2) as avg_clv
from 
	telecom.v_telecom_churn
group by 
	tenure_groups 
order by 
	avg_clv desc 

;

-- by Internet Service


select 
	internet_service ,
	round(
		avg(total_charges) 
	,2) as avg_clv
from 
	telecom.v_telecom_churn
group by 
	internet_service 
order by 
	avg_clv desc 

;
-- Which customer groups generate the highest long-term value?


with customer_value as 
(
    select 
        customer_key,
        contract,
        internet_service,
        tech_support,
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
    ) as avg_customer_value

from customer_value

where value_tier = 1   -- Top 25% highest-value customers

group by 
    contract,
    internet_service,
    tech_support

having count (*) >= 30

order by 
     avg_customer_value desc;


-- 3. Are high-value customers churning at a concerning rate?

with customer_value as 
(
    select 
        customer_key,
        contract,
        internet_service,
        tech_support,
        total_charges,
		churn,

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


    count(*) 
     as customers,

	 round(
		avg(churn::int) *100.0
	 ,2) as chrun_rate_pct 

from customer_value

where value_tier = 1   -- Top 25% highest-value customers

group by 
    contract,
    internet_service,
    tech_support

having count (*) >= 30

order by 
     chrun_rate_pct  desc
	 
	 ;

