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
select* from silver.patients