--: Load the CSV
copy telecom.stg_telecom_churn 
from 'D:\Data analysis\projects\telecom-churn-analytics\data\raw\telco-Customer-Churn.csv'
with (
format csv ,
header true 
);