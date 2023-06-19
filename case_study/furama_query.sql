-- 2
 
select *
from employee
where (name_employee like 'H%' or name_employee like 'T%' or name_employee like 'K%' )and (length(name_employee) <=15);

-- 3

select *,timestampdiff(year,dob,curdate())
from customer
where timestampdiff(year,dob,curdate())>=18 and timestampdiff(year,dob,curdate())<50 and address like '%Đà Nẵng' or address like '%Quảng Trị';

-- 4

select cus.id_customer,cus.name_customer, count(con.id_customer) as timescontract
from customer cus
join contract con
on cus.id_customer = con.id_customer
where cus.id_customer_level = 1
group by con.id_customer
order by count(con.id_customer);

-- 5

select c.id_customer,name_customer, name_cl, ctr.id_contract,name_service,contract_date,contract_end_date, rental_fee+price*quantity as 'total price'
from customer c
join customer_level cl
on cl.id_cl = c.id_customer_level
left join contract ctr
on ctr.id_customer=c.id_customer
left join  service sv
on sv.id_service = ctr.id_service
left join detailed_contract dc
on dc.id_contract=ctr.id_contract
left join rerort_amenities ra
on ra.id_ra = dc.id_ra;


-- -----------------------check-------------------------- 

select *
from contract;

select *
from detailed_contract;