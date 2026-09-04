--insert clean data into the silver table

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


--then check the quality of the silver table
select appointment_id,count(*) from silver.appointments  --count(*) get the number of rows that having the same id after grouping by appointment_id
group by appointment_id
having count(*)>1 or appointment_id is null

select reason_for_visit , status from silver.appointments
where reason_for_visit != trim(reason_for_visit) or 
      status != trim(status) 

select* from silver.appointments



