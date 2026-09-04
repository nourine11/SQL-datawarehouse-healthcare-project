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

select * from silver.doctors