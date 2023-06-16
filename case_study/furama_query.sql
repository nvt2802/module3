select *
from employee
where (name_employee like 'H%' or name_employee like 'T%' or name_employee like 'K%' )and (length(name_employee) <=15);

select *,timestampdiff(year,dob,curdate())
from customer
where timestampdiff(year,dob,curdate())>=18 and timestampdiff(year,dob,curdate())<50 and address like '%Đà Nẵng' or address like '%Quảng Trị';

select cus.id_customer,cus.name_customer, count(con.id_customer) as timescontract
from customer cus
join contract con
on cus.id_customer = con.id_customer
where cus.id_customer_level = 1
group by con.id_customer
order by count(con.id_customer);

select*
from contract;

