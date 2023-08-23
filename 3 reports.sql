use TenantDB 
go

-- Reports: for starters, I would like to be able to see a list of current tenants. 
select * 
from Tenant t
where t.Active = 1
-- Also, those whose leases are due to expire within the next 6 months -I just need the name, contact info and lease end date- sorted by end date (closer end dates on top)
select t.TenantName, t.ContactName, t.ContactEmail, t.ContactPhone, t.LeaseEndDate
from tenant t
where t.LeaseEndDate < dateadd(month, 6, getdate())
order by t.LeaseEndDate
-- I'd also like a list of those tenants whose rent needs to be increased next month
select t.TenantName
from Tenant t
where t.IncreaseMonth = format(dateadd(month, 1, GETDATE()), 'MMMM')
-- It would also be great to be able to analyze the average current rent for offices vs. Store fronts
;
with x as(
    select t.TenantId, OfficeType = case when t.UnitNumber between 1 and 10 then 'Storefront' else 'Office' end
    from Tenant t
)
select x.OfficeType, AvgCurrentRent = avg(t.TotalMonthlyRent)
from tenant t
join x
on t.TenantId = x.TenantId
where t.Active = 1
group by x.OfficeType

