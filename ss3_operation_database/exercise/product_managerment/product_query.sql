 --  Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order

SELECT 
    oID, oDate, oTotalPrice
FROM
    `order`;

-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách 

SELECT 
    *
FROM
    customer c
        JOIN
    `order` o ON o.cID = c.cID
        JOIN
    orderdetail od ON o.oID = od.oID
        JOIN
    product p ON p.pId = od.pID;  

-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào 

SELECT 
    customer.*
FROM
    customer c
        LEFT JOIN
    `order` o ON o.cID = c.cID
WHERE
    o.cID IS NULL;
 
 -- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn  
 
SELECT 
    o.oID, oDate, p.pPrice * od.odQTY AS 'total price'
FROM
    `order` o
        JOIN
    orderdetail od ON o.oID = od.oID
        JOIN
    product p ON p.pId = od.pID; 
 