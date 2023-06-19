-- 6 

select distinct s.id_service,name_service,area,rental_fee,name_rt
from service s
left join rental_type rt on s.id_rental_type = rt.id_rt
left join contract c on c.id_service=s.id_service
where concat(year(contract_date),month(contract_date)) != "20211"
and concat(year(contract_date),month(contract_date)) != "20212"
and concat(year(contract_date),month(contract_date)) != "20213";


select distinct *
from service s
left join contract c on c.id_service=s.id_service;
-- 7

select distinct s.id_service ,name_service,area,max_occupancy,rental_fee,name_ts
from service s
join type_service ts on s.id_type_service = ts.id_ts
join contract c on c.id_service=s.id_service
where year(contract_date) =2020 and 
s.id_service not in (
select s2.id_service
from service s2
join type_service ts2 on s2.id_type_service = ts2.id_ts
join contract c2 on c2.id_service=s2.id_service
 where year(contract_date) = 2021
 );

-- 8

select distinct name_customer
from customer;

select name_customer
from customer
group by name_customer;

-- 9
 
 select month(contract_date) as 'Month', count(month(contract_date)) as 'Times booking'
 from contract
 where year(contract_date) = 2021 
 group by month(contract_date)
 order by month(contract_date);

-- 10

select c.id_contract,c.contract_date,c.contract_end_date, sum(quantity)
from contract c
left join detailed_contract dc on dc.id_contract = c.id_contract
group by c.id_contract;

