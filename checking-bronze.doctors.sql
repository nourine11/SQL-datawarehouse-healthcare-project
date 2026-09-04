select * from bronze.doctors

--check data quality of appointments table
--check nulls or duplicates of the primary key
select doctor_id,count(*) from bronze.doctors  --count(*) get the number of rows that having the same id after grouping by appointment_id
group by doctor_id
having count(*)>1 or doctor_id is null
-- result : no duplicates or nulls


--check unwanted spaces for string values only
select first_name , last_name , specialization , hospital_branch,email from bronze.doctors
where first_name != trim(first_name) or 
      last_name != trim(last_name) or
      specialization != trim(specialization) or
      hospital_branch != trim(hospital_branch) or
      email != trim(email) 
--result : no unwanted spaces