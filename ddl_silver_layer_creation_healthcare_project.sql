--the ddl of the silver layer is similar to the bronze lyer
if object_id ('silver.appointments','U')is not null
drop table silver.appointments 

create table silver.appointments
(
appointment_id varchar(10) ,
patient_id  varchar(10),
doctor_id  varchar(10),
appointment_date date ,
appointment_time  time ,
reason_for_visit varchar(60), 
status varchar(50)
);

if object_id (' silver.billing','U')is not null
drop table  silver.billing 

create table silver.billing
(
bill_id varchar(10),
patient_id varchar(10),
treatment_id varchar(10),
bill_date date ,
amount decimal(10,3),
payment_method varchar(50),
payment_status varchar(50)
);

if object_id ('silver.doctors','U')is not null
drop table silver.doctors 
create table silver.doctors
(
doctor_id varchar(10),
first_name varchar(50),
last_name varchar(50),
specialization varchar(60),
phone_number varchar(12),
years_experience int ,
hospital_branch varchar(60),
email varchar(60)
);

if object_id ('silver.patients','U')is not null
drop table silver.patients 
create table silver.patients
(
patient_id varchar(10),
first_name varchar(50),
last_name varchar(50),
gender varchar(10),
date_of_birth date,
contact_number varchar(12),
address varchar(50),
registration_date date,
insurance_provider varchar(50),
insurance_number  varchar(50),
email varchar(50)
);

if object_id ('silver.treatments','U')is not null
drop table silver.treatments 
create table silver.treatments
(
treatment_id varchar(10),
appointment_id varchar(10),
treatment_type  varchar(50),
description  varchar(50),
cost decimal(10,3),
treatment_date date
);