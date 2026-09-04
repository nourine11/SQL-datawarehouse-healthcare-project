select* from bronze.patients


--check data quality of appointments table
--check nulls or duplicates of the primary key
select patient_id,count(*) from bronze.patients  --count(*) get the number of rows that having the same id after grouping by appointment_id
group by patient_id
having count(*)>1 or patient_id is null
-- result : no duplicates or nulls


--check unwanted spaces for string values only
select first_name , last_name , insurance_provider ,email from bronze.patients
where first_name != trim(first_name) or 
      last_name != trim(last_name) or
      insurance_provider!= trim(insurance_provider) or
      email != trim(email) 
--result : no unwanted spaces



select* from bronze.treatments


--check data quality of appointments table
--check nulls or duplicates of the primary key
select treatment_id,count(*) from bronze.treatments--count(*) get the number of rows that having the same id after grouping by appointment_id
group by treatment_id
having count(*)>1 or treatment_id is null
-- result : no duplicates or nulls


--check unwanted spaces for string values only
select treatment_type , description  from bronze.treatments
where treatment_type != trim(treatment_type) or 
      description != trim(description) 
--result : no unwanted spaces

select distinct description  from bronze.treatments