use carselling;

alter table customers_caselling
		modify column customer_name varchar(50);
	


-- create table carselling.customers_carselling(
-- 	customer_number_id int not null,
-- 	customer_name char(255), 	--> EDIT not null varchar(50) la ten cong ty khach hang, ko phai ten khach hang
--  ADD customer_first_name varchar(50) not null
--  ADD customer_last_name varchar(50) not null
-- 	phone char(30),  --> varchar(50)
-- 	address varchar(255), --> EDIT address_line1 varchar(50) not null, address_line2 varchar(50),
--  ADD city varchar(50) not null,
--  ADD state varchar(50) not null,
--  ADD postalCode varchar(15) not null, 
--  ADD country varchar(50) not null,
--  ADD credit_limit float(2),
-- 	primary key(customer_number_id)
-- );







-- create table carselling.productsline(
-- 	product_line_id int not null,
--     `description` text, 
--     primary key(product_line_id)
-- );
-- create table carselling.product(
-- 	product_code_id int not null,
--     product_name varchar(255),
--     manufacterd varchar(255),
--     quantity int not null,
--     price_input float(2),
--     price_sale float(2),
--     primary key(product_code_id)
-- );
-- create table carselling.orders(
-- 	order_number_id int not null,
--     date_sale date,
--     date_ship_order date,
--     date_ship_real date,
--     price float(2),
--     primary key(order_number_id)
-- );
-- create table carselling.payments(
-- 	payment_id int not null,
--     payment_date date,
--     money float(2),
--     primary key (payment_id)    
-- );
-- create table carselling.employees(
-- employee_id int not null,
-- name_ char(255),
-- email varchar(255),
-- task varchar(255),
-- primary key(employee_id)
-- );
-- create table carselling.offices(
-- office_code int not null,
-- address varchar(255),
-- phone char(255),
-- national_ char(255),
-- primary key(office_code)
-- );

