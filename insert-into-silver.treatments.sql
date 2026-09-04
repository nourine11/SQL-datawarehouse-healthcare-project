insert into silver.treatments 
(
treatment_id ,
appointment_id ,
treatment_type ,
description  ,
cost,
treatment_date
)
select treatment_id ,
appointment_id ,
treatment_type ,
description  ,
cost,
treatment_date from bronze.treatments

select*from silver.treatments