exec silver.load_silver


create or alter procedure silver.load_silver as
begin
declare @start_time datetime , @end_time datetime , @batch_start datetime , @batch_end datetime 
set @batch_start= GETDATE()

begin try
set @start_time = GETDATE()

print '==========================================================================='
print'truncate table silver.appointments '
print'============================================================================'
truncate table silver.appointments
print '==========================================================================='
print 'insert into silver.appointments'
print '==========================================================================='
insert into silver.appointments 
(
appointment_id  ,
patient_id ,
doctor_id  ,
appointment_date  ,
appointment_day ,
appointment_month ,
appointment_year ,
appointment_time   ,
reason_for_visit , 
status 
)
select 
appointment_id  ,
patient_id ,
doctor_id  ,
appointment_date  ,
day(appointment_date),
month(appointment_date),
year(appointment_date),
appointment_time   ,
reason_for_visit , 
status from  bronze.appointments
set @end_time = getdate()
print'loading duration :'+ cast(datediff(second,@start_time,@end_time)as nvarchar) +'seconds'
select* from silver.appointments



set @start_time = GETDATE()

print '==========================================================================='
print'truncate table silver.billing '
print'============================================================================'
truncate table silver.billing
print '==========================================================================='
print 'insert into silver.billing'
print '==========================================================================='
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
set @end_time = getdate()
print'loading duration :'+ cast(datediff(second,@start_time,@end_time)as nvarchar) +'seconds'
select* from silver.billing



set @start_time = GETDATE()

print '==========================================================================='
print'truncate table silver.doctors '
print'============================================================================'
truncate table silver.doctors
print '==========================================================================='
print 'insert into silver.doctors'
print '==========================================================================='
insert into silver.doctors
(
doctor_id ,
first_name ,
last_name ,
specialization ,
phone_number ,
years_experience  ,
hospital_branch ,
email )
select 
doctor_id ,
first_name ,
last_name ,
specialization ,
phone_number ,
years_experience  ,
hospital_branch ,
email from bronze.doctors
set @end_time = getdate()
print'loading duration :'+ cast(datediff(second,@start_time,@end_time)as nvarchar) +'seconds'
select * from silver.doctors



set @start_time = GETDATE()

print '==========================================================================='
print'truncate table silver.patients  '
print'============================================================================'
truncate table silver.patients 
print '==========================================================================='
print 'insert into silver.patients '
print '==========================================================================='
insert into silver.patients 
(
patient_id ,
first_name,
last_name ,
gender ,
date_of_birth,
birth_day ,
birth_month ,
birth_year ,
age,
contact_number ,
address ,
registration_date ,
insurance_provider ,
insurance_number  ,
email
)
select 
patient_id ,
first_name,
last_name ,
case when upper(gender) ='F' then 'female'
      when upper(gender) ='M' then 'male'
      else 'n/a'
end ,
date_of_birth,
day(date_of_birth),
month(date_of_birth),
year(date_of_birth),
datediff(year,date_of_birth,getdate())
  -CASE
    WHEN DATEADD(
        YEAR,
        DATEDIFF(YEAR, date_of_birth, GETDATE()),
       date_of_birth
    ) > GETDATE()
    THEN 1
    ELSE 0
END,
contact_number ,
address ,
registration_date ,
insurance_provider ,
insurance_number  ,
email from bronze.patients
set @end_time = getdate()
print'loading duration :'+ cast(datediff(second,@start_time,@end_time)as nvarchar) +'seconds'
select* from silver.patients




set @start_time = GETDATE()

print '==========================================================================='
print'truncate table silver.treatments   '
print'============================================================================'
truncate table silver.treatments 
print '==========================================================================='
print 'insert into silver.treatments '
print '==========================================================================='
insert into silver.treatments 
(
treatment_id ,
appointment_id ,
treatment_type ,
description  ,
cost,
treatment_date,
treatment_day ,
treatment_month ,
treatment_year
)
select treatment_id ,
appointment_id ,
treatment_type ,
description  ,
cost,
treatment_date,
day(treatment_date),
month(treatment_date),
year(treatment_date)
from bronze.treatments
set @end_time = getdate()
print'loading duration :'+ cast(datediff(second,@start_time,@end_time)as nvarchar) +'seconds'
select*from silver.treatments
end try
begin catch 
print 'error occured during loading data'
print'error message'+error_message()
print'error number : '+cast(error_number() as varchar)
print'error status : '+cast(error_state() as varchar)
end catch
end