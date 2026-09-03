if exists (select 1 from sys.databases where name='heathcareDB')
begin 
alter database heathcareDB set single_user with rollback immediate
drop database heathcareDB
end 
go

create database heathcareDB 


create schema bronze
go
create schema silver
go
create schema gold