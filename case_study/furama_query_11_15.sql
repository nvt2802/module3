-- 11.	Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách hàng có ten_loai_khach là “Diamond” và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.	

select ra.id_ra, ra.name_ra
from rerort_amenities ra
join detailed_contract dc on ra.id_ra=dc.id_ra
join contract c on c.id_contract = dc.id_contract
join customer ct on ct.id_customer = c.id_customer
join customer_level cl on cl.id_cl = ct.id_customer_level 
where cl.name_cl = 'Diamond' and (ct.address like '%Vinh' or ct.address like '%Quảng Ngãi');

-- 12.	Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng), so_dien_thoai (khách hàng), 
-- ten_dich_vu, so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem), 
-- tien_dat_coc của tất cả các dịch vụ đã từng được khách hàng đặt vào 3 tháng cuối năm 2020 nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2021.

select c.id_contract,e.name_employee,ct.name_customer,ct.phone_number,s.name_service,sum(quantity),c.deposits
from contract c
left join employee e on e.id_employee = c.id_employee
left join customer ct on ct.id_customer = c.id_customer
left join service s on s.id_service = c.id_service
left join detailed_contract dc on dc.id_contract =c.id_contract
where year(contract_date)=2020 and month(contract_date) between 10 and 12
and c.id_contract not in(
select c.id_contract
from contract c
where year(contract_date)=2021 and month(contract_date) between 1 and 6
)
group by c.id_contract
;

-- 13.	Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng. (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).

-- view
create view sum_quantity as
select ra.id_ra, sum(dc.quantity) as sum
from rerort_amenities ra
group by dc.id_ra;
-- query
select ra.id_ra, ra.name_ra, sum(dc.quantity) as sum
from rerort_amenities ra
 join detailed_contract dc on ra.id_ra = dc.id_ra
 join sum_quantity sq on sq.id_ra = ra.id_ra
group by dc.id_ra
having sum(dc.quantity)=(select max(sum)
from sum_quantity
)
;

-- 14.	Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất. Thông tin hiển thị bao gồm ma_hop_dong,
-- ten_loai_dich_vu, ten_dich_vu_di_kem, so_lan_su_dung (được tính dựa trên việc count các ma_dich_vu_di_kem).

-- create view
create view ra_count as
select dc.id_ra, count(dc.id_ra) as ra_count
from detailed_contract dc 
group by dc.id_ra;
-- query
select c.id_contract,s.name_service,ra.name_ra,rc.ra_count
from detailed_contract dc 
join contract c on dc.id_contract =c.id_contract
join service  s  on s.id_service = c.id_service
join rerort_amenities ra on ra.id_ra = dc.id_ra
join ra_count rc on rc.id_ra = dc.id_ra
where rc.ra_count = 1
order by id_contract;
 
 -- 15.	Hiển thi thông tin của tất cả nhân viên bao gồm ma_nhan_vien, ho_ten, ten_trinh_do, ten_bo_phan, 
 -- so_dien_thoai, dia_chi mới chỉ lập được tối đa 3 hợp đồng từ năm 2020 đến 2021.
 
 -- view
 create view count_booking_employee as
 select id_employee,count(id_employee) as count_booking_employee
 from contract
 group by id_employee;
-- query
select e.id_employee, e.name_employee, al.name_al,d.name_dpm,phone_number,address
from employee e
join department d on e.id_department=d.id_dpm
join academic_level al on e.id_academic_level= al.id_al
join contract c on c.id_employee = e.id_employee
join count_booking_employee cbe on cbe.id_employee = c.id_employee
where cbe.count_booking_employee <=3
;





