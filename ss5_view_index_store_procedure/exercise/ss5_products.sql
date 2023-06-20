create database demo;

create table products(
id int primary key auto_increment,
`code` int ,
name varchar(50),
price double,
amount int,
description varchar(100),
status varchar(50)
);
-- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)
create unique index index_code on products(code);
-- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
create index idx_name_price on products(name,price);
-- So sánh câu truy vấn trước và sau khi tạo index
-- before
explain select * 
from products 
where code =1;
-- create index
create unique index index_code on products(code);
-- after
explain select * 
from products 
where code =1;

--  Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.
create view product_view as 
select code,name,price,status
from products;

-- Tiến hành sửa đổi view

alter view product_view as 
select code,name,price,status
from products;

-- Tiến hành xoá view
drop view product_view;

-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product

DELIMITER //

CREATE PROCEDURE selectAllProduct()

BEGIN

  SELECT * FROM products;

END //

DELIMITER ;

-- Tạo store procedure thêm một sản phẩm mới

DELIMITER //

CREATE PROCEDURE addProduct(in id int,
`code` int ,
name varchar(50),
price double,
amount int,
description varchar(100),
status varchar(50)
)

BEGIN

  insert into products
  value(id,`code`,name,price,amount,description,status);

END //

DELIMITER ;

-- Tạo store procedure sửa thông tin sản phẩm theo id

DELIMITER //

CREATE PROCEDURE editProduct(in id int,
`code` int ,
name varchar(50),
price double,
amount int,
description varchar(100),
status varchar(50)
)

BEGIN
 set sql_safe_updates=0;
  update products p
  set  p.`code`=`code`,p.name=name,p.price=price,p.description=description,p.status=status
  where p.id = id;
set sql_safe_updates=1;
END //

DELIMITER ;

-- Tạo store procedure xoá sản phẩm theo id

DELIMITER //

CREATE PROCEDURE deleteProduct(in id int)

BEGIN

  delete from products p
  where p.id = id;

END //

DELIMITER ;

