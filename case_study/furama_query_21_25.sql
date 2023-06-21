-- 21.	Tạo khung nhìn có tên là v_nhan_vien để lấy được thông tin của tất cả các nhân viên có địa chỉ là “Hải Châu”
-- và đã từng lập hợp đồng cho một hoặc nhiều khách hàng bất kì với ngày lập hợp đồng là “12/12/2019”.


create view v_employee as
select e.* 
from employee e
join contract c on c.id_employee = e.id_employee 
where address like '%Hải Châu%' 
and contract_date = '2019-12-12'
group by c.id_employee
having count(c.id_employee)>0;

-- 22.	Thông qua khung nhìn v_nhan_vien thực hiện cập nhật địa chỉ thành “Liên Chiểu” đối với tất cả các nhân viên được nhìn thấy bởi khung nhìn này.

set sql_safe_updates =0;

update employee e
set e.address = replace(e.address,'Hải Châu','Liên Chiểu')
where e.id_employee in (
	select id_employee
    from v_employee
);

set sql_safe_updates =1;

-- 23.	Tạo Stored Procedure sp_xoa_khach_hang dùng để xóa thông tin của một khách hàng nào đó với ma_khach_hang được truyền vào như là 1 tham số của sp_xoa_khach_hang.

DELIMITER //

CREATE PROCEDURE delete_customer(in id int)

BEGIN
	SET FOREIGN_KEY_CHECKS=0;
	set sql_safe_updates =0;
	delete from customer c
	where c.id_customer = id;
	SET FOREIGN_KEY_CHECKS=1;
	set sql_safe_updates =1;
END //

DELIMITER ;


-- 24.	Tạo Stored Procedure sp_them_moi_hop_dong dùng để thêm mới vào bảng hop_dong với yêu cầu sp_them_moi_hop_dong phải thực hiện kiểm tra tính hợp lệ của dữ liệu bổ sung, 
-- với nguyên tắc không được trùng khóa chính và đảm bảo toàn vẹn tham chiếu đến các bảng liên quan.

DELIMITER //

CREATE PROCEDURE add_contract(
     IN id_contract INT,
     IN contract_date DATE,
     IN contract_end_date DATE,
     IN deposits FLOAT,
     IN id_employee INT,
     IN id_customer INT,
     IN id_service INT)
 BEGIN
     
	SET FOREIGN_KEY_CHECKS=0;

     IF EXISTS (SELECT * FROM contract c WHERE c.id_contract = id_contract) THEN
         SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Mã hợp đồng đã tồn tại.';
     ELSEIF NOT EXISTS (SELECT * FROM employee e WHERE e.id_employee = id_employee) THEN
         SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Nhân viên không tồn tại.';
     ELSEIF NOT EXISTS (SELECT * FROM customer ct WHERE ct.id_customer = id_customer) THEN
         SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Khách hàng không tồn tại.';
     ELSEIF NOT EXISTS (SELECT * FROM service s WHERE s.id_service = id_service) THEN
         SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Dịch vụ không tồn tại.';
     ELSE
         INSERT INTO contract (id_contract, contract_date, contract_end_date, deposits, id_employee, id_customer, id_service)
         VALUES (id_contract, contract_date, contract_end_date, deposits, id_employee, id_customer, id_service);
         SET FOREIGN_KEY_CHECKS=1;
     END IF;
 END //

DELIMITER ;

CALL add_contract(50, '2022-01-01', '2022-12-31', 1000, 2, 2, 3);

-- 25.	Tạo Trigger có tên tr_xoa_hop_dong khi xóa bản ghi trong bảng hop_dong thì hiển thị tổng số lượng bản ghi còn lại có trong bảng hop_dong ra giao 
-- diện console của database.
-- Lưu ý: Đối với MySQL thì sử dụng SIGNAL hoặc ghi log thay cho việc ghi ở console.

DELIMITER //

CREATE TRIGGER tr_delete_contract
AFTER DELETE ON contract
FOR EACH row
BEGIN 
    DECLARE count_contract INT;
    DECLARE str VARCHAR(50);
    SELECT COUNT(*) INTO count_contract FROM contract;
    SELECT CONCAT('Số lượng hợp đồng còn lại: ', count_contract) INTO str FROM contract group by CONCAT('Số lượng hợp đồng còn lại: ', count_contract);
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = str;
END //
DELIMITER ;

drop trigger tr_delete_contract;

SET FOREIGN_KEY_CHECKS=0;

delete from contract 
where contract.id_contract = 13;

SET FOREIGN_KEY_CHECKS=1;
