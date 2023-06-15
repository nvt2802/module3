create database furuma_database;
use furuma_database;

create table job_position(
id_jp int primary key,
name_jp varchar(45)
);
create table academic_level(
id_al int primary key,
name_al varchar(45)
);
create table department(
id_dpm int primary key,
name_dpm varchar(45)
);
create table customer_level(
id_cl int primary key,
name_cl varchar(45)
);
create table rental_type(
id_rt int primary key,
name_rt varchar(45)
);
create table type_service(
id_ts int primary key,
name_ts varchar(45)
);
create table rerort_amenities(
id_ra int primary key,
name_ra varchar(45) not null,
price double not null,
currency_unit varchar(10) not null,
status_ra varchar(45)
);
create table employee(
id_employee int primary key,
name_employee varchar(45) not null,
dob date not null,
id_number varchar(45) not null,
salary double not null,
phone_number varchar(45) not null,
email varchar(45),
address varchar(45),
 id_job_position int  not null,
 id_academic_level int not null,
 id_department int not null,
 foreign key (id_job_position) references  job_position(id_jp),
 foreign key (id_academic_level) references  academic_level(id_al),
 foreign key (id_department) references  department(id_dpm)
);
create table customer(
id_customer int primary key,
name_customer varchar(45) not null,
dob date not null,
gender BIT(1) not null,
id_number varchar(45) not null,
phone_number varchar(45) not null,
email varchar(45),
address varchar(45),
id_customer_level int not null,
foreign key (id_customer_level) references customer_level(id_cl)
);
create table service(
id_service int primary key,
name_service varchar(45) not null,
area int,
rental_fee double not null,
max_occupancy int,
id_rental_type int not null,
id_type_service int not null,
room_criteria varchar(45),
amenities_description varchar(45),
area_pool double,
number_floors int,
foreign key (id_rental_type) references rental_type(id_rt),
foreign key (id_type_service) references type_service(id_ts)
);
create table contract(
id_contract int primary key,
contract_date date not null,
contract_end_date date  not null,
deposits double  not null,
id_employee int not null,
id_customer int not null,
id_service int not null,
foreign key (id_employee)  references employee(id_employee),
foreign key (id_customer)  references customer(id_customer),
foreign key (id_service)  references service(id_service)
);
create table detailed_contract(
id_dc int primary key,
id_contract int not null,
id_ra int not null,
quantity int,
foreign key (id_contract) references contract(id_contract),
foreign key (id_ra) references rerort_amenities(id_ra)
);