-- create database demo2;
use demo2;
create table users(
	id int(3) not null auto_increment,
    `name` varchar(120) not null,
    age int(3),
    gender varchar(45),
    email varchar(220),
    country varchar(120),
    primary key (id)
);
insert into users(`name`, age, gender, email, country)
value 
	('Minh', 25, "male",'minh@codegym.vn','Viet Nam'),
	('Kante', 28, "female", 'kante@che.uk','Kenia')
;
select * from users;
SELECT id, `name`, age, gender, email, country FROM users WHERE id=2;
INSERT INTO users (`name`, age, gender, email, country) VALUE ("Tam", 22, "female", "tam@gmail.com", "Brazil");
DELETE FROM users WHERE id = 2;
UPDATE users set `name` = "Tam", age = 26, gender = "female", email = "tam12@yahoo.com", country = "Myanmar" where id = 3;

-- __+__+__+__+__+__+__+__+__+__+
delimiter $$
create procedure get_user_by_id(in user_id int) 
begin
	select id, `name`, age, gender, email, country
    from users 
    where id = user_id;
end$$
delimiter ;
-- __+__+__+__+__+__+__+__+__+__+
-- DROP PROCEDURE insertUser;
delimiter $$
create procedure insertUser(
in user_name varchar(120),
in user_age int,
in user_gender varchar(50),
in user_email varchar(220),
in user_country varchar(120)
)
begin
	insert into users(`name`, age, gender, email, country)
    values(user_name, user_age, user_gender, user_email, user_country);
end$$
delimiter ;
-- __+__+__+__+__+__+__+__+__+__+
-- call get_user_by_id(2);
call insertUser("Thanh", 18, "Nu", "thanh19@gmail.com", "Poland");