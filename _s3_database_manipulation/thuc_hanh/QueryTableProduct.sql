use morequery;
select * from products;
-- +++++++++++++++++++++++++++++++++
-- Thuc hanh: "Truy van nang cao"
insert into products
value 
	("s10_4757","1972 alpha romeo gta","cars","Motor city art classics1","attention car enthuiast",3752,85.68),
    ("s12_1984","1952 alpittss 1300","motorcycles","Motor city art classics1","attention car enthuiast",1249,105.2),
    ("s18_5697","1972 belta sshtssyt","cars","Motor city art classics1","attention car enthuiast",823,115)
    ;
select productCode, productName, buyPrice, quantityInStock from products
	where quantityInStock > 1500 and buyPrice < 100;

create table product_line(
	productLine varchar(150),
    textDescription varchar(255),
    imageDescription varchar(255)
);

insert into product_line
value 
	("motorcycles","ATTENTION motorcyrcle","motor"),
    ("cars","ATTENTION car","car"),
    ("bicycle","ATTENTION bicycle","bicycle")
    ;

select productCode, productName, buyPrice, textDescription
from products inner join product_line on products.productLine = product_line. productLine
where 90 < buyPrice and buyPrice < 110; 

select productCode, productName, buyPrice, quantityInStock, textDescription
from products inner join product_line on products.productLine = product_line.productLine
where buyPrice > 90 or productName = "'1952 alpittss 1300'";

-- +++++++++++++++++++++++++++++++++
-- Thuc hanh: "Truy van du lieu tu nhieu bang"
create table customers(
	customerNumber int,
    customerName varchar(50),
    phone int,
    addressLine1 varchar(50),
    city varchar(50),
    country varchar(100),    
    primary key (customerNumber)
);
create table orders(
	orderNumber int,
    orderDate date,    
    requireDate date,
    shippedDate date,
    customerNumber int,
    primary key (orderNumber)
);
create table payments(
	checkNumber int,
	customerNumber int,
    paymentDate date,
    amount float(2),
    primary key (checkNumber)
);

