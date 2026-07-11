-- Create a Clean Table

create table telecom.clean_telecom_churn as 
select 
	customerid , 
	gender ,
	seniorcitizen :: int as seniorcitizen ,
	partner,

    dependents,

    tenure::INT AS tenure,

    phoneservice,

    multiplelines,

    internetservice,

    onlinesecurity,

    onlinebackup,

    deviceprotection,

    techsupport,

    streamingtv,

    streamingmovies,

    contract,

    paperlessbilling,

    paymentmethod,

    monthlycharges::NUMERIC(10,2) AS monthlycharges,
	case 
		when trim(totalcharges) = '' then null 
		else totalcharges :: NUMERIC(10,2) 
	end as totalcharges ,
	churn
from 
	telecom.stg_telecom_churn
;


-- Staging table remains untouched.
-- Clean table contains proper data types.
-- we can always reload from the raw CSV if something goes wrong.