use classicmodels;

-- tao procedure dau tien ten la findAllCustomers
-- sau tu khoa delimiter phai co dau cach ra , neu khong se bao loi
DELIMITER $$
create procedure findAllCustomers()
begin 
	select * from `customers`;
end $$
DELIMITER 

call findAllCustomers();
DELIMITER $$
drop procedure if exists `findAllCustomers`$$
create procedure findAllCustomers()
begin 
	select * from `customers` where customerNumber = 175;
end; $$
DELIMITER 



