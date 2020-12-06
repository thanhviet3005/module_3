-- create database huongmoney;

use huongmoney;
create table student_account(
	id int not null,
    ten varchar(50) not null,
    tuoi int not null,
    khoahoc varchar(50) not null, 
    sotien int not null
--     primary key (id)
);

insert into student_account(id, ten, tuoi, khoahoc, sotien)
value 
	(1, "Hoang", 21, "CNTT", 400000 ),
	(2, "Viet" , 19, "DTVT", 320000 ),
	(3, "Thanh", 18, "KTDN", 400000 ),
	(4, "Nhan" , 19, "CK"  , 450000 ),
	(5, "Huong", 20, "TCNH", 500000 ),
	(6, "Huong", 20, "TCNH", 200000 )
    ;
select * from student_account;
-- Hien ra nhung dong co ten la "Huong"
select * from student_account
where ten = "Huong"
;
-- Viết câu lệnh lấy ra tổng số tiền của Huong
select ten, sum(sotien) as `tong tien`
from student_account
where ten = "Huong"
;
-- Viết câu lệnh lấy ra tên danh sách của tất cả học viên, không trùng lặp
select ten 
from student_account
group by ten
;

