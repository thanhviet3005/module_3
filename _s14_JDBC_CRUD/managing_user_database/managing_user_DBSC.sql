-- create database demo;
use demo;
create table users(
	id int(3) not null auto_increment,
    `name` varchar(120) not null,
    email varchar(220),
    country varchar(120),
    primary key (id)
);
insert into users(`name`, email, country)
value 
	('Minh','minh@codegym.vn','Viet Nam'),
	('Kante', 'kante@che.uk','Kenia')
;
select * from users;
SELECT id, `name`, email, country FROM users WHERE id= 2;
INSERT INTO users (`name`, email, country) VALUE ("Tam", "tam@gmail.com", "Brazil");
DELETE FROM users WHERE id = 4;
UPDATE users set `name` = "Tam", email = "tam12@yahoo.com", country = "Myanmar" where id = 5;