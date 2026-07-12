--I  would build a simple star schema that supports reporting and Power BI.

--                    dim_customer
--                         |
--                         |
--                         |
--dim_service ----- fact_customer_churn ----- dim_payment

--Dimensions
--Descriptive attributes:
--- gender
---contract
---payment method 
--from 
--facts :
--Measurable values:
---monthly_charges
---total_charges
---tenure
---churn


----------------------------Table Definitions-----------------------------------

------telecom.dim_customer----------

create table telecom.dim_customer (
customer_key serial primary key ,
customerid  varchar(20) unique ,

gender varchar(10) ,
senior_citizen  integer  ,
partner boolean ,
dependents  boolean 

);

-------dim_service-----------------
create table telecom.dim_service (
service_key serial primary key ,
phone_service boolean ,

multiple_lines varchar(20),
internet_service varchar(20),
online_security varchar(20) ,
online_backup varchar(20),

device_protection varchar(20),
tech_support varchar(20),
streaming_tv varchar(20),
streaming_movies varchar(20),

 contract VARCHAR(50)
);


--------dim_payment---------------
create table telecom.dim_payment (
payment_key serial primary key ,
  payment_method VARCHAR(100),
    paperless_billing BOOLEAN
);


---------fact_customer_churn------
create table telecom.fact_customer_churn (
fact_id BIGSERIAL PRIMARY KEY,
customer_key integer ,
service_key integer ,
payment_key integer ,


tenure integer ,
monthly_charges numeric (10,2) ,
total_charges numeric (10,2),
churn boolean ,

constraint fk_customer_key 
	foreign key (customer_key) 
	references telecom.dim_customer(customer_key),

constraint fk_service_key 
	foreign key (service_key)
	references telecom.dim_service(service_key),

constraint fk_payment_key 
	foreign key (payment_key)
	references telecom.dim_payment(payment_key )
);



drop table telecom.fact_customer_churn cascade 
