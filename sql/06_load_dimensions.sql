-----Populate dim_customer--------

insert into telecom.dim_customer (
	customerid  ,
	gender  ,
	senior_citizen  ,
	partner  ,
	dependents   

)
select distinct 
	customerid  ,
	gender  ,
	SeniorCitizen  ,
	partner  ,
	dependents   
from 
	telecom.clean_telecom_churn 
-----------verify-----------------

select count(*) from telecom.dim_customer;


----------Populate dim_service------------------

insert into telecom.dim_service (

phone_service  ,

multiple_lines ,
internet_service ,
online_security  ,
online_backup ,

device_protection ,
tech_support ,
streaming_tv ,
streaming_movies ,

contract 
)
select distinct
	PhoneService  ,
	
	MultipleLines ,
	InternetService ,
	OnlineSecurity  ,
	OnlineBackup ,
	
	DeviceProtection ,
	TechSupport ,
	StreamingTV ,
	StreamingMovies ,
	
	contract 
from 
	telecom.clean_telecom_churn ;
-----------verify-----------------

select count(*) from telecom.dim_service;


----------Populate dim_payment------------------

insert into telecom.dim_payment (
 payment_method,
    paperless_billing
)
select distinct
	PaymentMethod,
    PaperlessBilling
from 
	telecom.clean_telecom_churn ;


-----------verify-----------------

select count(*) from telecom.dim_payment;



----------Populate fact_customer_churn------------------

insert into telecom.fact_customer_churn (
customer_key ,
service_key  ,
payment_key  ,


tenure  ,
monthly_charges  ,
total_charges ,
churn  
)

select 
	c.customer_key ,
	s.service_key ,
	p.payment_key,
	cl.tenure ,
	cl.MonthlyCharges ,
	cl.totalCharges,
	cl.Churn 
from 
	telecom.clean_telecom_churn cl
	
join telecom.dim_customer c
	on cl.customerid = c.customerid 

join telecom.dim_service s 
	on cl.phoneservice = s.phone_service
	and cl.multiplelines = s.multiple_lines
	and cl.internetservice = s.internet_service
	and cl.onlinesecurity = s.online_security
	and cl.onlinebackup = s.online_backup
	and cl.deviceprotection = s.device_protection 
	and cl.techsupport = s.tech_support
	and cl.StreamingTV = s.streaming_tv
	and cl.streamingmovies = s.streaming_movies 
	and cl.contract = s.contract 
	
join telecom.dim_payment p
	on cl. paymentmethod  = p. payment_method  
	and cl.paperlessbilling = p.paperless_billing
	
------------verify--------------------------------
select count(*) from 
telecom.fact_customer_churn


---------------check for duplicated customers --------
select 	
	customer_key ,
	count(*)	
from telecom.fact_customer_churn
group by customer_key 
having count(*) > 1 


