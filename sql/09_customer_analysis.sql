--1. Are senior citizens more likely to churn?

select 
	senior_citizen,
	count(*) as customers,
	sum(churn::int) as churned ,
	round (
		avg(churn::int) *100 , 2 
	)as churned_rate_ptc 
from 
	telecom.v_telecom_churn 

group by 	
	senior_citizen 
;


--2. Does having a partner reduce churn?

select 
	partner ,
	count(*) as customers ,
	sum(churn::int) as churned ,
	round(
		avg(churn::int) *100.0 
	,2) as churned_ptc
from
	telecom.v_telecom_churn 
group by 
	partner
	
;



--3. Does having dependents reduce churn?
select 
	dependents ,
	count(*) as customers ,
	sum(churn::int) as churned ,
	round(
		avg(churn::int) * 100.0 
	,2) as churn_ptc 
from 
	telecom.v_telecom_churn 

group by 
	dependents 
;


--4. Which demographic segments churn most?


with demographic as (

select 
	
	gender ,
	senior_citizen ,
	partner,
	dependents,
	count(*) as customers ,
	
	sum(churn::int) as churned_customers ,
	
	round(
		avg(churn::int) * 100.0 
	,2) as churn_rate_pct  
from 
	telecom.v_telecom_churn 

group by 
	gender ,
	senior_citizen ,
	partner,
	dependents
)
select 
	* 
from 
	demographic
where 
	customers > 30 
order by 
	churn_rate_pct  desc 

;