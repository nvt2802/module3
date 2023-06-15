create database managerment_product;
use managerment_product;
create table customer(
cID int primary key,
cName varchar(50),
cAge int
);
create table `Order`(
oID int primary key,
cID int,
oDate date,
oTotalPrice bigint,
foreign key (cID) references customer(cID)
);
create table Product(
pId int primary key,
pName varchar(100),
pPrice bigint
);
create table OrderDetail(
oID int,
pID int,
odQTY int,
primary key(oID,pID),
foreign key (oID) references `Order`(oID),
foreign key (pID) references Product(pID)
);
