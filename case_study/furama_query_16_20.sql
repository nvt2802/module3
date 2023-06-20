-- 16.	Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.
set sql_safe_updates =0;

delete from employee
where id_employee not in ( 
select *
from(
		select e.id_employee
		from employee e
		join contract c on e.id_employee = c.id_employee
		where year(c.contract_date) between 2019 and 2021) as p
);

set sql_safe_updates =1;

-- 17.	Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond,
-- chỉ cập nhật những khách hàng đã từng đặt phòng với Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ.

update customer c
join customer_level cl on  c.id_customer_level = cl.id_cl
set c.id_customer_level = 1
where id_customer in (
	select *
	from (
		select  ctr.id_customer
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
on ra.id_ra = dc.id_ra
where year(contract_date)=2021 and cl.name_cl = 'Platinium'
group by ctr.id_customer 
having sum(rental_fee+(price*quantity)) >=10000000  
	) as p
)
;
-- check
select * 
from customer;

-- 18.	Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng).

SET FOREIGN_KEY_CHECKS=0;
set sql_safe_updates =0;
delete from customer
where id_customer in(
	select*
    from(
		select id_customer
		from contract
		where year(contract_date) < 2021
    ) as p
);
set sql_safe_updates =1;
SET FOREIGN_KEY_CHECKS=1;

-- 19.	Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi.
set sql_safe_updates =0;

update rerort_amenities ra
join detailed_contract dc on ra.id_ra=dc.id_ra
set ra.price = ra.price*2
where dc.quantity >10;

set sql_safe_updates =1;

-- 20.	Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống, 
-- thông tin hiển thị bao gồm id (ma_nhan_vien, ma_khach_hang), ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi.

select id_employee as id ,name_employee as name ,e.email,e.phone_number,e.dob,e.address
from employee e
union all
select id_customer,name_customer,c.email,c.phone_number,c.dob,c.address
from customer c;

