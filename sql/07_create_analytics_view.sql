
---------------Creating Analytical View ----------

Create view telecom.v_telecom_churn as 
select 
	dc.customer_key ,
	dc.gender  ,
	dc.senior_citizen  ,
	dc.partner  ,
	dc.dependents,


	ds.phone_service,
    ds.internet_service,
    ds.contract,
    ds.tech_support,


	dp.payment_method,
    dp.paperless_billing,


	f.tenure,
    f.monthly_charges,
    f.total_charges,
    f.churn
from 	
	telecom.fact_customer_churn f
join 
	telecom.dim_customer dc 
on
	f.customer_key = dc.customer_key 
join 
	telecom.dim_service ds 
on 
	f.service_key = ds.service_key 
join 
	telecom.dim_payment dp
on 
	f.payment_key = dp.payment_key 




	
select * from telecom.v_telecom_churn