-- drop database CaseStudyMVC;
-- create database CaseStudyMVC;

use CaseStudyMVC;

-- __+__+__+__+__+__+__+__+__+__
create table customer_type(
	customer_type_id int, 
    customer_type_name varchar(45),
    primary key(customer_type_id)
);
-- select * from customer_type;
insert into customer_type
value 
	(1, "Diamond"),
    (2, "Platinium"),
    (3, "Gold"),
    (4, "Silver"),
    (5, "Member")
;
-- select * from customer_type;
-- drop table customer;
create table customer(
	customer_id int,
	customer_type_id int, 
    foreign key (customer_type_id) references customer_type(customer_type_id),
	customer_name varchar(45),
	customer_birthday date,
	customer_gender varchar(45),
	customer_id_card varchar(45),
	customer_phone varchar(45),
	customer_email varchar(45),
	customer_address varchar(45),
    primary key(customer_id)
);

-- __+__+__+__+__+__+__+__+__+__
create table `position`(
	position_id int,
	position_name varchar(45),
    primary key (position_id)
);
-- select * from `position`;
insert into `position`
value 
	(1, "Le tan"),
    (2, "Phuc vu"),
    (3, "Chuyen vien"),
    (4, "Giam sat"),
    (5, "Quan ly"),
    (6, "Giam doc")
;

create table education_degree(
    education_degree_id int,
    education_degree_name varchar(45),
    primary key (education_degree_id)
);
-- select * from education_degree;
insert into education_degree
value
 	(1, "Trung cap"),
    (2, "Cao dang"),
    (3, "Dai hoc"),
    (4, "Sau dai hoc")
;

create table division(
    division_id int,
    division_name varchar(45),
    primary key(division_id)
);
-- select * from division;
insert into division
value
 	(1, "Sale"),
    (2, "Hanh chinh"),
    (3, "Phuc vu"),
    (4, "Quan ly")
;

create table `role`(
	role_id int,
    role_name varchar(255),
    primary key (role_id)
);

create table `user`(
	userName varchar(255),
    `passWord` varchar(255),
    primary key (userName)
);
select * from `user`;
insert into `user`
value
 	("Hung", "2222"),
    ("Angela", "2222"),
    ("Phuc", "2222"),
    ("David", "2222"),
	("Thanh", "2222"),
    ("Linh", "2222"),
    ("Anh", "2222"),
    ("Nguyen", "2222")
;

create table user_role(
	role_id int,
    foreign key (role_id) references `role`(role_id),
	userName varchar(255),
    foreign key (userName) references `user`(userName)
);

create table employee(
	employee_id int,
	employee_name varchar(45),
	employee_birthday date,
	employee_id_card varchar(45),
	employee_salary double,
	employee_phone varchar(45),
	employee_email varchar(45),
	employee_address varchar(45),
    position_id int,
    foreign key (position_id) references `position`(position_id),
    education_degree_id int,
    foreign key (education_degree_id) references education_degree(education_degree_id),
    division_id int,
    foreign key (division_id) references division(division_id),
    userName varchar(255),
    foreign key (userName) references `user`(userName),
    primary key (employee_id)
);

-- __+__+__+__+__+__+__+__+__+__
create table rent_type(
    rent_type_id int,
    rent_type_name varchar(255),
    rent_type_cost double,
    primary key (rent_type_id)
);
-- select * from `rent_type`;
insert into `rent_type`
value
 	(1, "year", 10000),
 	(2, "month", 3000),
 	(3, "day", 500),
 	(4, "hour", 100)
;

create table service_type(
    service_type_id int,
	service_type_name varchar(255), 
    primary key (service_type_id)
);

-- select * from `service_type`;
insert into `service_type`
value
 	(1, "villa"),
 	(2, "house"),
 	(3, "room")
;


create table service(
	service_id int,
	service_name varchar(255),
	service_area int, 
	service_cost double,
	service_max_people int,
    rent_type_id int,
    foreign key (rent_type_id) references rent_type(rent_type_id),
    service_type_id int,
    foreign key (service_type_id) references service_type(service_type_id),
    standard_room  varchar(255),
    description_other_convenient  varchar(255),
    pool_area double,
    number_of_floors int,
    primary key (service_id)
);

-- __+__+__+__+__+__+__+__+__+__
-- drop table attach_service;
create table attach_service(
	attach_service_id int,
	attach_service_name varchar(255),
	attach_service_cost double,
	attach_service_unit int,
	attach_service_status varchar(45),
    primary key (attach_service_id)
);
-- select * from `attach_service`;
insert into `attach_service`
value
 	(1, "massage", 100, 1, "true"),
 	(2, "karaoke", 50, 1, "true"),
 	(3, "food", 20, 1, "true"),
 	(4, "drink", 10, 1, "true"),
 	(5, "rent car", 200, 1, "true")
;

create table contract(
	contract_id int, 
	contract_start_date date,
	contract_end_date date, 
	contract_deposition double,
	contract_total_money double,
	employee_id int,
    foreign key (employee_id) references employee(employee_id),
	customer_id int,
    foreign key (customer_id) references customer(customer_id),
	service_id int,
    foreign key (service_id) references service(service_id),
    primary key(contract_id)
);

create table contract_detail(
	contract_detail_id int, 
	contract_id int, 
    foreign key (contract_id) references contract(contract_id),
    attach_service_id int,
    foreign key (attach_service_id) references attach_service(attach_service_id),
    quantity int,
    primary key(contract_detail_id)
);

use demo2;

-- __+__+__+__+__+__+__+__+__+__+__+__+__+__
-- Cac phuong thuc C-R-U-D
-- drop procedure getAllCustomer;
delimiter $$
create procedure getAllCustomer() 
begin
	select customer_id, customer_type.customer_type_id, customer_type_name, customer_name, customer_birthday,
		customer_gender, customer_id_card, customer_phone, customer_email, customer_address
    from customer 
    join customer_type on customer.customer_type_id = customer_type.customer_type_id;
end$$
delimiter ;
-- call getAllCustomer

-- __+__+__+__+
-- drop procedure getCustomerById;
delimiter $$
create procedure getCustomerById(in id int) 
begin
	select customer_id, customer.customer_type_id, customer_type_name, customer_name, customer_birthday,
		customer_gender, customer_id_card, customer_phone, customer_email, customer_address
    from customer 
    join customer_type on customer.customer_type_id = customer_type.customer_type_id
    where customer_id = id;
end$$
delimiter ;
-- call getCustomerById(2)

insert into customer
value (1, 1, "Giang", "1980-06-15", "female", "876544565", "0725631525","giang@gmail.com","Quang Ngai")
;
-- update customer
-- set customer_email = "linh18@gmail.com"
-- where customer_id = 3
-- ;
call getAllCustomer
-- __+__+__+__+
delimiter $$
create procedure insertCustomer(
in customer_id int,
in customer_type_id int,
in customer_name varchar(45),
in customer_birthday date,
in customer_gender varchar(45),
in customer_id_card varchar(45),
in customer_phone varchar(45),
in customer_email varchar(45),
in customer_address varchar(45)
)
begin
	insert into customer
    values(customer_id, customer_type_id, customer_name, customer_birthday, customer_gender, 
		customer_id_card, customer_phone, customer_email, customer_address);
end$$
delimiter ;

-- __+__+__+__+
delimiter $$
create procedure updateCustomer(
in id int,
in type_id int,
in `name` varchar(45),
in birthday date,
in gender varchar(45),
in id_card varchar(45),
in phone varchar(45),
in email varchar(45),
in address varchar(45)
)
begin
	update customer
    set 
    customer_type_id = type_id,
    customer_name = `name`,
    customer_birthday = birthday,
    customer_gender = gender,
    customer_id_card = id_card,
    customer_phone = phone,
    customer_email = email,
    customer_address = address
	where customer_id = id;
end$$
delimiter ;

-- __+__+__+__+
-- DROP PROCEDURE deleteCustomer;
delimiter $$
create procedure deleteCustomerById(in id int) 
begin
	delete from customer
    where customer_id = id;
end$$
delimiter ;

-- __+__+__+__+
delimiter $$
create procedure searchCustomerByName(in `name` VARCHAR(255)) 
begin
	select customer_id, customer_type.customer_type_id, customer_type_name, customer_name, customer_birthday,
		customer_gender, customer_id_card, customer_phone, customer_email, customer_address
    from customer 
    join customer_type on customer.customer_type_id = customer_type.customer_type_id
    WHERE customer_name LIKE concat('%',`name` ,'%') ;
end$$
delimiter ;
-- call searchCustomerByName("m")

-- __+__+__+__+
-- DROP PROCEDURE getAllCustomerType;
delimiter $$
create procedure getAllCustomerType() 
begin
	select customer_type_id, customer_type_name  from customer_type;
end$$
delimiter ;
call getAllCustomerType

-- __+__+__+__+__+__+__+__+__+__+__+__+__+__+__+__+__+__+__+__+__+__+__+__+
-- PROCEDURE EMPLOYEE 

delimiter $$
create procedure getAllPosition() 
begin
	select position_id, position_name     
    from position;
end$$
delimiter ;
-- call getAllPosition

 -- __+__+__+__+__+
 delimiter $$
create procedure getAllDegree() 
begin
	select education_degree_id, education_degree_name
    from education_degree;
end$$
delimiter ;
-- call getAllDegree

 -- __+__+__+__+__+
  delimiter $$
create procedure getAllDivision() 
begin
	select division_id, division_name
    from division;
end$$
delimiter ;
-- call getAllDivision


 -- __+__+__+__+__+
--  drop procedure getAllUser;

  delimiter $$
create procedure getAllUser() 
begin
	select userName, `passWord`
    from `user`;
end$$
delimiter ;
-- call getAllUser

 -- __+__+__+__+__+
delimiter $$
create procedure getAllEmployee() 
begin
	select employee_id, employee_name, employee_birthday, employee_id_card, employee_salary
		, employee_phone, employee_email, employee_address
        , position.position_name, education_degree.education_degree_name, division.division_name
        , userName
    from employee 
    join `position` on employee.position_id = `position`.position_id
    join division on employee.division_id = division.division_id
    join education_degree on employee.education_degree_id = education_degree.education_degree_id
    ;
end$$
delimiter ;
-- insert into employee
-- value (1, "John", "1995-11-14", "869745326", 500, "0772963532", "john@furama.com", "Brazil", 2, 2, 2, "David");
-- call getAllEmployee

-- __+__+__+__+
-- drop procedure getEmployeeById;
delimiter $$
create procedure getEmployeeById(in id int) 
begin
	select 
    employee_id
    , employee_name
    , employee_birthday
    , employee_id_card
    , employee_salary
	, employee_phone
    , employee_email
    , employee_address
	, position.position_name
    , education_degree.education_degree_name
    , division.division_name
	, userName
    from employee 
		join `position` on employee.position_id = `position`.position_id
		join division on employee.division_id = division.division_id
		join education_degree on employee.education_degree_id = education_degree.education_degree_id
    where employee_id = id;
end$$
delimiter ;
-- call getCustomerById(2)

-- __+__+__+__+
-- drop procedure insertEmployee;
delimiter $$
create procedure insertEmployee(
	in employee_id int,
    in employee_name varchar(45),
    in employee_birthday date,
    in employee_id_card varchar(45),
    in employee_salary double,
    in employee_phone varchar(45),
    in employee_email varchar(45),
    in employee_address varchar(45),
    in position_id int,
    in education_degree_id int,
    in division_id int,
    in userName varchar(255)
)
begin
	insert into employee
    values 
		(employee_id
        , employee_name
        , employee_birthday
        , employee_id_card
        , employee_salary
        , employee_phone
        , employee_email
        , employee_address
        , position_id
        , education_degree_id
        , division_id
        , userName)
	;
end$$
delimiter ;

-- __+__+__+__+
-- drop procedure updateEmployee
delimiter $$
create procedure updateEmployee(
	in id int,
    in `name` varchar(45),
    in birthday date,
    in id_card varchar(45),
    in salary double,
    in phone varchar(45),
    in email varchar(45),
    in address varchar(45),
    in pos_id int,
    in edu_degree_id int,
    in div_id int,
    in uName varchar(255)
)
begin
	update employee
    set 
-- 		employee_id = _id,
        employee_name = `name`,
        employee_birthday = birthday,
        employee_id_card = id_card,
        employee_salary = salary,
        employee_phone = phone,
        employee_email = email,
        employee_address = address,
        position_id = pos_id,
        education_degree_id = edu_degree_id,
        division_id = div_id,
        userName = uName        
	where employee_id = id;
end$$
delimiter ;

-- __+__+__+__+
-- DROP PROCEDURE deleteEmployeeById;
delimiter $$
create procedure deleteEmployeeById(in id int) 
begin
	delete from employee
    where employee_id = id;
end$$
delimiter ;
-- call getAllEmployee

-- __+__+__+__+
delimiter $$
create procedure searchByName(in `name` VARCHAR(255)) 
begin
	select employee_id, employee_name, employee_birthday, employee_id_card, employee_salary
		, employee_phone, employee_email, employee_address
        , position.position_name, education_degree.education_degree_name, division.division_name
        , userName
    from employee 
    join `position` on employee.position_id = `position`.position_id
    join division on employee.division_id = division.division_id
    join education_degree on employee.education_degree_id = education_degree.education_degree_id
    WHERE employee_name LIKE concat('%',`name` ,'%') ;
end$$
delimiter ;
-- call searchByName("Serena")
