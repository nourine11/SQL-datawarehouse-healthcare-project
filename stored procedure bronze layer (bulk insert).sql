--exec bronze.load_raw_data

create or alter procedure bronze.load_raw_data as
begin

declare @start_time datetime , @end_time datetime , @batch_start datetime , @batch_end datetime 
set @batch_start= GETDATE()

begin try
set @start_time = GETDATE()
print '==========================================================================='
print'truncate table bronze.appointments '
print'============================================================================'
truncate table bronze.appointments
print '==========================================================================='
print 'insert into bronze.appointments'
print '==========================================================================='
bulk insert bronze.appointments 
from 'D:\healthcare_dataset\appointments.csv'
with 
(
firstrow=2,
fieldterminator=',',
ROWTERMINATOR = '0x0a',-- Specifies the end of each row
CODEPAGE = '65001',-- Specifies UTF-8 encoding(how to read the file)
tablock
);
set @end_time = getdate()
print'loading duration :'+ cast(datediff(second,@start_time,@end_time)as nvarchar) +'seconds' --datediff: calculate the difference betwwen start time and end time (the duration of the process)

select count(*) from bronze.appointments

set @start_time = GETDATE()
print '==========================================================================='
print'truncate table bronze.billing '
print'============================================================================'
truncate table bronze.billing
print '==========================================================================='
print 'insert into bronze.billing'
print '==========================================================================='
bulk insert bronze.billing
from 'D:\healthcare_dataset\billing.csv'
with 
(
firstrow=2,
fieldterminator=',',
ROWTERMINATOR = '0x0a',
CODEPAGE = '65001',
tablock
);
set @end_time = getdate()
print'loading duration :'+ cast(datediff(second,@start_time,@end_time)as nvarchar) +'seconds'

select count(*) from bronze.billing


set @start_time = GETDATE()
print '==========================================================================='
print'truncate table bronze.doctors '
print'============================================================================'
truncate table bronze.doctors
print '==========================================================================='
print 'insert into bronze.doctors'
print '==========================================================================='
bulk insert bronze.doctors 
from 'D:\healthcare_dataset\doctors.csv'
with 
(
firstrow=2,
fieldterminator=',',
ROWTERMINATOR = '0x0a',
CODEPAGE = '65001',
tablock
);
set @end_time = getdate()
print'loading duration :'+ cast(datediff(second,@start_time,@end_time)as nvarchar) +'seconds'

select count(*) from bronze.doctors


set @start_time = GETDATE()
print '==========================================================================='
print'truncate table bronze.patients '
print'============================================================================'
truncate table bronze.patients
print '==========================================================================='
print 'insert into bronze.patients'
print '==========================================================================='
bulk insert bronze.patients
from 'D:\healthcare_dataset\patients.csv'
with 
(
firstrow=2,
fieldterminator=',',
ROWTERMINATOR = '0x0a',
CODEPAGE = '65001',
tablock
);
set @end_time = getdate()
print'loading duration :'+ cast(datediff(second,@start_time,@end_time)as nvarchar) +'seconds'

select count(*) from bronze.patients


set @start_time = GETDATE()
print '==========================================================================='
print'truncate table bronze.treatments '
print'============================================================================'
truncate table bronze.treatments
print '==========================================================================='
print 'insert into bronze.treatments'
print '==========================================================================='
bulk insert bronze.treatments
from 'D:\healthcare_dataset\treatments.csv'
with 
(
firstrow=2,
fieldterminator=',',
ROWTERMINATOR = '0x0a',
CODEPAGE = '65001',
tablock
);
set @end_time = getdate()
print'loading duration :'+ cast(datediff(second,@start_time,@end_time)as nvarchar) +'seconds'


select count(*) from bronze.treatments

set @batch_end = GETDATE()
print'loading batch duration :'+ cast(datediff(second,@batch_start,@batch_end)as nvarchar) +'seconds'

end try
begin catch
print 'error occured during loading data'
print'error message'+error_message()
print'error number : '+cast(error_number() as varchar)
print'error status : '+cast(error_state() as varchar)
end catch

end