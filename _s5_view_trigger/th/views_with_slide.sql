use thunghiem_view;

create table customers(
	id int,
    `name` varchar(50),
    age int,
    address varchar(100),
    salary int    
);
insert into customers
value 
	(1, "Ramesh", 32, "Ahmedabad", 2000),
	(2, "Khilan", 25, "Delhi", 1500),
	(3, "Kaushik", 23, "Kota", 2000),
	(4, "Chaitali", 25, "Mumbai", 6500),
	(5, "Hardik", 27, "Bhopal", 8000),
	(6, "Samatha", null , "Mumbai", 1600),
    (7, "Komai", 22, "Mp", 4500)
    ;
select * from customers;

create view test_view as
select id, `name`, age, salary
from customers
where age is not null
with check option
;
select * from test_view;
-- update row co id = 2 trong test_view, luu y phai co primary key thi moi dung duoc lenh update
update test_view
set age = 26
where id = 2
;
-- xoa mot hang khoi view, dong thoi se tu xoa luon trong table tuong ung
delete from test_view
where id = 2
;

-- xoa mot view da tao
drop view test_view;

-- su dung index de tang toc do truy van du lieu
-- ++ dung explain de check xem ctrinh chay het bao nhieu dong
explain select * from customers
where id = 4
;
