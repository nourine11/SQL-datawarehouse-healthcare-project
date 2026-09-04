insert into silver.billing
(
bill_id ,
patient_id ,
treatment_id ,
bill_date  ,
bill_day ,
bill_month ,
bill_year,
amount ,
payment_method ,
payment_status
)
select bill_id ,
patient_id ,
treatment_id ,
bill_date  ,
day(bill_date),
month(bill_date),
year(bill_date),
amount ,
payment_method ,
payment_status from bronze.billing

select* from silver.billing