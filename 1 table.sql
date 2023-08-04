use TenantDB
go

drop table if exists Tenant
go
create table dbo.Tenant(
    TenantId int identity primary key,
    TenantName varchar(50) not null constraint ck_Tenant_TenantName_cannot_be_blank check(TenantName > ''),
    ContactName varchar(50) not null constraint ck_Tenant_ContactName_cannot_be_blank check(ContactName > ''),
    ContactEmail varchar(50) null constraint ck_Tenant_ContactEmail_cannot_be_blank check(ContactEmail > ''),
                             constraint ck_Tenant_ContactEmail_must_be_valid_email check(ContactEmail like '%@%.%'),
    ContactPhone varchar(12) null constraint ck_Tenant_ContactPhone_cannot_be_blank check(ContactPhone > ''),
    UnitNumber int not null constraint ck_Tenant_UnitNumber_must_be_between_1_and_20 check(UnitNumber between 1 and 20),
    UnitSquareFootage int not null constraint ck_Tenant_UnitSquareFootage_must_be_greater_than_0 check(UnitSquareFootage > 0),
    LeaseStartDate date not null,
    RentStartDate date null,
    LeaseEndDate date not null constraint ck_Tenant_LeaseEndDate_past_2012 check(year(LeaseEndDate) > 2012),
    YearlyIncreaseRate varchar(100) not null constraint ck_Tenant_YearlyIncreaseRate_cannot_be_blank check(YearlyIncreaseRate > ''),
    IncreaseMonth varchar(9) not null constraint ck_Tenant_IncreaseMonth_must_be_valid_month check(IncreaseMonth in ('January','February','March','April','May','June','July','August','September','October','November','December')),
    BasicRent decimal(10, 2) not null constraint ck_Tenant_CurrentRent_must_be_greater_than_0 check(BasicRent > 0),
    AdditionalRent decimal(10,2) not null default 0,
    TotalMonthlyRent as BasicRent + AdditionalRent,
    LateFeeDate varchar(50) not null,
    LateFeeRatePercent decimal(4,2) not null,
    RenewOptions int not null default 0,
    SecurityDeposit decimal(10,2) not null,
    Notes varchar(max) not null default '',
    Active bit not null default 1,
    constraint ck_Tenant_LeaseEndDate_must_be_after_LeaseStartDate check(LeaseEndDate > LeaseStartDate)
)
go
