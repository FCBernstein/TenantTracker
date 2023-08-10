use TenantDB
GO

delete Tenant 
go

insert Tenant(TenantName, ContactName, ContactEmail, ContactPhone, UnitNumber, Active, UnitSquareFootage, OriginalLeaseStartDate, CurrentLeaseStartDate, RentStartDate, LeaseEndDate, YearlyIncreaseRate,IncreaseMonth, BasicRent, AdditionalRent, LateFeeDate, LateFeeRatePercent, RenewOptions, SecurityDeposit, Notes)
select 'DeLorenzo''s','douglas','delostheburg@gmail.com', null, 1, 1, 3250, '4/1/2022', null, null,
'3/31/2027','3.50%','September',
4791.04,286.46,'5th of month',5,2, 11239.58, ''
union select 'Fog City Vapor','Ken','fogcityvaporlevittown@gmail.com',null,2,
1,6151,'6/30/2015', '6/30/2017', '7/1/2015','7/1/2027','add $1000 to monthly rent',
'July',14352.00,335.87,'5th of month' ,5,1, 3600,''
union select 'GoPuff','David','Facilities@gopuff.com','8482504400',3,
1,3628,'10/1/2018',null, null,'10/31/2028','3% or market value- whichever is more',
'November',6334.00,2507.21,'10th of month' ,5, 0,6334,''
union select '3 Rivers Bar','David','david.reeves@gopuff.com','8482504400',4,
1,2350,'3/1/2023',null, null,'3/31/2028','3%',
'November',6000.00,874.79 ,'3rd of month' ,5, 2 ,2210,''
union select 'Music Forte','Chris','musicforte85@gmail.com','2158337572',5,
1,11269,'12/1/2021', null, '10/16/2022','10/31/2027','3%',
'October',27233.00,890.95 ,'5th of month' ,5, 0 ,5000,'do not increase until end of first lease term 2025. After that increase each April'
union select 'Natural Nail Bar','Thomas','thomasvphung@gmail.com','2154310009', 11,
1,2030,'11/1/2020',null, null,'11/2/2025','3%',
'November',6485.00,2000.00,'5th of month' ,5, 0 ,1564,'NO CAM'
