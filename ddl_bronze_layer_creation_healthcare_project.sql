if object_id ('bronze.appointments','U')is not null
drop table bronze.appointments 

create table bronze.appointments
(
appointment_id varchar(10) ,
patient_id  varchar(10),
doctor_id  varchar(10),
appointment_date date ,
appointment_time  time ,
reason_for_visit varchar(60), 
status varchar(50)
);

if object_id (' bronze.billing','U')is not null
drop table  bronze.billing 

create table bronze.billing
(
bill_id varchar(10),
patient_id varchar(10),
treatment_id varchar(10),
bill_date date ,
amount decimal(10,3),
payment_method varchar(50),
payment_status varchar(50)
);

if object_id ('bronze.doctors','U')is not null
drop table bronze.doctors 
create table bronze.doctors
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

if object_id ('bronze.patients','U')is not null
drop table bronze.patients 
create table bronze.patients
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

if object_id ('bronze.treatments','U')is not null
drop table bronze.treatments 
create table bronze.treatments
(
treatment_id varchar(10),
appointment_id varchar(10),
treatment_type  varchar(50),
description  varchar(50),
cost decimal(10,3),
treatment_date date
);