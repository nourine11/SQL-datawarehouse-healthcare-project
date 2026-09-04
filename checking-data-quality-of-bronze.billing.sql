select* from bronze.billing

--check data quality of appointments table
--check nulls or duplicates of the primary key
select bill_id,count(*) from bronze.billing  --count(*) get the number of rows that having the same id after grouping by appointment_id
group by bill_id
having count(*)>1 or bill_id is null
-- result : no duplicates or nulls


--check unwanted spaces for string values only
select payment_method , payment_status from bronze.billing
where payment_method != trim(payment_method) or 
      payment_status != trim(payment_status) 
--result : no unwanted spaces

select distinct payment_status from bronze.billing