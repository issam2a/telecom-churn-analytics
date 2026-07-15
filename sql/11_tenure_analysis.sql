-- 1. During which tenure period is churn highest?

select 
	case
		when tenure <=12 then '0-12 months'
		when tenure <=24 then '13-24 months'
		when tenure <= 48 then '25-48 months'
		else '+49 months '
	end as tenure_groups ,

	round(
		avg(churn::int) *100.0
		
	,2) as churn_rate_pct 
from 
	telecom.v_telecom_churn
group by 
	tenure_groups 
order by 
	churn_rate_pct desc
;

-- 2. First-year churn 
select 
	round(
	sum(
		case 
			when tenure <=12 then churn::int 
			else 0 
		end 
	) *100.0
	/ 
	sum(churn::int)
	,2) as first_year_churn_rate_ptc 
from 
	telecom.v_telecom_churn



-- 3. Long-term customer retention

select

	case 
		when tenure > 12 then '0-12 months ' 
		else '+12 months'
		
	end as customer_lifecycle ,

	round(
	sum(
		case 
			when churn = false then 1 
			else 0 
		end 
		) * 100.0 / count(*) 
		,2 ) as retention_rate_pct 
from 
	telecom.v_telecom_churn 
group by 
	customer_lifecycle 
order by 
	retention_rate_pct desc



