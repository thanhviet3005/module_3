-- create database demo;
use demo;
create table users(
	id int(3) not null auto_increment,
    `name` varchar(120) not null,
    email varchar(220) not null,
    country varchar(120),
    primary key (id)
);
insert into users(`name`, email, country)
value 
	('Minh','minh@codegym.vn','Viet Nam'),
	('Kante','kante@che.uk','Kenia')
;
select * from users;