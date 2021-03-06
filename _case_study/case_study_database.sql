-- create database case_study_database;
use case_study_database;

create table loaikhach(
IDloaiKhach int,
tenLoaikhach varchar(45),
primary key(IDloaiKhach)
);
create table khachhang(
IDkhachhang int,
IDloaikhach int,
hoten varchar(45),
ngaysinh date,
soCMND varchar(45),
sdt varchar(45),
email varchar(45),
diachi varchar(45),
foreign key (IDloaikhach) references loaikhach(IDloaiKhach),
primary key (IDkhachhang)
);


create table kieuthue(
IDkieuthue int,
tenKieuThue varchar(45),
gia int,
primary key (IDkieuthue)
);
create table loaiDichVu(
IDloaidichvu int, 
tenLoaiDichVu varchar(100),
primary key(IDloaidichvu)
);
create table dichvu(
IDdichvu int,
tendichvu varchar(45),
dientich int,
sotang int,
soNguoiToiDa varchar(45),
chiPhiThue int,
IDkieuthue int(45),
IDloaidichvu int,
foreign key (IDkieuthue) references kieuthue(IDkieuthue),
foreign key (IDloaidichvu) references loaiDichVu(IDloaidichvu),
primary key (IDdichvu)
);
-- alter table dichvu
-- modify chiPhiThue int;

create table vitri(
IDvitri int,
tenViTri varchar(45),
primary key (IDvitri)
);
create table trinhdo(
IDtrinhdo int,
trinhDo varchar(45),
primary key (IDtrinhdo)
);
create table bophan(
IDbophan int,
tenBoPhan varchar(45),
primary key (IDbophan)
);
create table nhanvien(
IDnhanvien int,
hoten varchar(45),
IDvitri int, 
IDtrinhdo int,
IDbophan int,
ngaysinh date,
soCMND varchar(45),
luong int(45),
sdt varchar(45),
email varchar(45),
diachi varchar(45),
foreign key (IDvitri) references vitri(IDvitri),
foreign key (IDtrinhdo) references trinhdo(IDtrinhdo),
foreign key (IDbophan) references bophan(IDbophan),
primary key(IDnhanvien)
);


create table hopdong(
IDhopdong int,
IDnhanvien int, 
IDkhachhang int,
IDdichvu int,
ngaylamhopdong date,
ngayketthuc date,
tiendatcoc int,
tongtien int,
primary key(IDhopdong),
foreign key (IDkhachhang) references khachhang(IDkhachhang) on update cascade on delete cascade,
foreign key (IDnhanvien) references nhanvien(IDnhanvien) on update cascade on delete cascade,
foreign key (IDdichvu) references dichvu(IDdichvu)
);
create table dichvudikem(
IDdichvudikem int, 
tendichvudikem varchar(45),
gia int,
donvi int,
trangthaikhadung varchar(45),
primary key (IDdichvudikem)
);
create table hopdongchitiet(
IDhopDongChiTiet int,
IDhopdong int,
IDdichvudikem int, 
soluong int,
foreign key (IDhopdong) references hopdong(IDhopdong) on update cascade on delete cascade,
foreign key (IDdichvudikem) references dichvudikem(IDdichvudikem),
primary key (IDhopDongChiTiet)
);

-- nhap du lieu vao database

insert into bophan
value	
	(1, "Sale - Marketing"),
	(2, "Hành Chính"),
	(3, "Phục vụ"),
	(4, "Quản lý")
	;
insert into trinhdo
value 	
	(1, "Trung cấp"),
	(2, "Cao đẳng"),
	(3, "Đại học"),
	(4, "Sau đại học")
    ;
select * from trinhdo;

insert into vitri
value 
	(1, "Lễ tân"),
	(2, "Phục vụ"),
	(3, "Chuyên viên"),
	(4, "Giám sát"),
	(5, "Giám đốc")    
    ;
select * from vitri;

insert into nhanvien
values
	(1, "Tran Manh", 2, 2, 3, '2001-02-10', "986832147", 2000, "986574132", "manh@gmail.com", "Vung Tau"),
    (2, "Hoang Linh", 3, 3, 2, '2000-03-12', "987532147",3000, "326574132", "linh@gmail.com", "Phu Tho"),
    (3, "Hoang Nguyen", 1, 1, 1, '1992-06-19', "857532147",1000, "326574168", "nguyen@gmail.com.vn", "Lam Dong"),
    (4, "Vu Vinh", 5, 3, 4, '1980-11-26', "85758246",5000, "561574168", "vinh@gmail.com", "Ca Mau"),
    (5, "Thien Vi", 3, 2, 3, '1982-11-26', "85758246",3000, "561574166", "vi@gmail.com", "Bac Giang"),
	(6, "The Lam", 4, 4, 2, '1984-11-26', "85759646",4000, "481574168", "lam@gmail.com", "Dong Nai")
    ;
    
select * from nhanvien;
-- insert into nhanvien
-- value (6, "The Lam", 4, 4, 2, '1984-11-26', "85759646",4000, "481574168", "lam@gmail.com", "Dong Nai");

-- update nhanvien
-- set ngaysinh = '1984-11-26'
-- where `IDnhanvien` = 6
-- ;

-- +++++++++++++++++++++++++++    
insert into loaikhach
value 
	(1, "Diamond"),
    (2, "Platinium"),
    (3, "Gold"),
    (4, "Silver"),
    (5, "Member")    
    ;
select * from loaikhach;

-- +++++++++++++++++++++++++++   
insert into khachhang
value 
	(1, 2, "Andrew", '1981-10-26', "85758158", "09635441254885", "andrew@gmail.com", "Quang Tri"),
    (2, 5, "Peter", '1990-05-12', "55158158", "09639651254811", "peter@gmail.com", "Poland"),
    (3, 1, "Alice", '1985-03-11', "55158192", "096396512548718", "alice@gmail.com", "Ha Noi"),
	(4, 1, "Hoang Giang", '1995-03-12', "55158146", "096396822548718", "giang@gmail.com", "Quang Nam"),
    (5, 1, "Binh Dang", '1987-03-21', "55158128", "096396514448718", "binh@gmail.com", "Bac Ninh"),
    (6, 4, "Tran Dan", '1989-09-18', "55158126", "09639651254246", "dan@gmail.com", "Quang Ninh"),
	(7, 2, "Alice", '1985-03-11', "55158192", "096396512548718", "elisa@gmail.com", "Ha Noi"),
    (8, 3, "Tran Dan", '1989-09-18', "55158126", "09639651254246", "tran@gmail.com", "Quang Ninh"),
	(9, 3, "Tran Linh", '1989-09-20', "55158128", "09639651254242", "linh@gmail.com", "Quang Ngai"),
    (10, 1, "Hoang Phuoc", '1990-09-18', "45158126", "07639651254246", "phuoc@gmail.com", "Vinh"),
	(11, 2, "Brook", '1985-03-12', "55158195", "096396512548729", "brook@gmail.com", "Quang Ngai"),
	(12, 1, "Phuc Lee", '1995-03-14', "55158146", "096396822548738", "lee@gmail.com", "Da Nang")
    ;      
select * from khachhang;

-- +++++++++++++++++++++++++++
insert into kieuthue
value 
	(1, "nam", 200000),
    (2, "thang", 3000),
    (3, "ngay", 100),
    (4, "gio", 20)
    ;
select * from kieuthue;

-- +++++++++++++++++++++++++++
insert into loaidichvu
value 
	(1, "vip"),
    (2, "business"),
    (3, "normal"),
	(4, "popular"),
    (5, "special")
    ;

update  loaidichvu
set `tenLoaiDichVu` = "normal"
where `IDloaidichvu` = 3
;
select * from loaidichvu;

-- +++++++++++++++++++++++++++
insert into dichvu
value 
	(1, "villa", 200, 4, 15, 150, 1, 1),
    (2, "room", 100, 1, 3, 50, 3, 3),
    (3, "house", 250, 2, 16, 100, 2, 3),
    (4, "villa", 160, 6, 12, 300, 3, 1),
	(5, "room", 80, 1, 15, 150, 1, 1),
	(6, "villa", 180, 5, 12, 300, 3, 2),
	(7, "villa", 200, 4, 15, 150, 1, 4),
    (8, "room", 100, 1, 3, 50, 3, 5)
    ;
select * from dichvu;

-- +++++++++++++++++++++++++++
insert into dichvudikem
value 
	(1, "massage", 50, 1, "on" ),
	(2, "karaoke", 30, 1, "off" ),
	(3, "thức ăn", 10, 1, "on" ),
	(4, "nước uống", 5, 1, "on" ),
    (5, "thuê xe tham quan", 80, 1, "on" ),
	(6, "leo núi", 80, 1, "on"  )
    ;
select * from dichvudikem;

-- +++++++++++++++++++++++++++


-- select * from hopdongchitiet;
-- select * from dichvudikem;
-- +++++++++++++++++++++++++++
insert into hopdong
values
	(1, 1, 1, 3, '2019-08-15', '2019-11-2', 200, 1600),
    (2, 4, 3, 1, '2019-06-09', '2019-10-14', 100, 2400),
    (3, 2, 2, 2, '2019-10-06', '2019-12-11', 150, 3700),
    (6, 5, 5, 3, '2018-10-06', '2018-12-12', 200, 1600),        
    (4, 3, 9, 8, '2019-10-06', '2019-12-11', 150, 3700),
	(7, 2, 3, 2, '2020-02-06', '2019-02-11', 150, 300),
	(8, 2, 3, 3, '2020-03-02', '2020-03-05', 200, 250),
    (9, 5, 4, 3, '2019-02-06', '2019-02-12', 200, 300),    
	(10, 5, 4, 5, '2018-02-15', '2018-02-18', 200, 300),      
	(11, 5, 4, 6, '2017-02-20', '2017-02-22', 200, 300),
	(12, 4, 10, 8, '2018-06-15', '2018-07-23', 200, 600),
	(13, 3, 11, 8, '2014-06-15', '2014-07-23', 200, 600),
    (14, 1, 1, 7, '2012-08-15', '2012-11-2', 200, 1800),
	(15, 1, 1, 7, '2018-08-15', '2018-11-2', 200, 1800),
	(17, 1, 9, 7, '2018-07-15', '2018-07-22', 200, 500),
	(16, 5, 4, 1, '2019-02-20', '2019-02-22', 200, 3000),
	(18, 2, 2, 3, '2019-10-07', '2019-10-12', 150, 370)
    ;
-- update hopdong
-- set IDkhachhang = 12
-- where IDhopdong = 14
-- ;
insert into hopdongchitiet
value 
	(1, 1, 3, 8),
    (2, 2, 5, 15),
    (3, 2, 4, 9),
    (4, 4, 2, 12),
	(6, 4, 2, 3),
    (7, 6, 1, 4),
    (8, 9, 3, 12),
    (9, 8, 5, 6),
    (10, 10, 4, 5),
    (11, 11, 6, 1),
	(12, 12, 4, 12),
    (16, 17, 5, 3)
    ;
select * from hopdong;

-- +++++++++++++++++++++++++++
-- TASK 2: Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt 
-- đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 ký tự.
select * from `nhanvien`
where length(hoten) <= 15 and ( hoten like 'H%' or 'K%' or 'T')
;
select * from `nhanvien`;

-- +++++++++++++++++++++++++++
-- TASK 3: Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và 
-- có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
select * from `khachhang`
where  ( diachi = "Quang Tri" or diachi = "Da Nang" )
and (year(ngaysinh) between ( year(now()) - 50) and year(now()) - 18 ) 
;

-- +++++++++++++++++++++++++++
-- TASK 4: Đếm xem tương ứng với mỗi khách hàng đã
-- từng đặt phòng bao nhiêu lần.  
-- Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng. 
-- Chỉ đếm những khách hàng nào có Tên loại khách hàng là "Diamond".
select `khachhang`.`hoten`, `loaikhach`.`tenloaikhach`, `khachhang`.`IDloaikhach`, count(`hopdong`.`IDhopdong`) as solandatphong
from `khachhang` inner join `hopdong` on `khachhang`.`IDkhachhang` = `hopdong`.`IDkhachhang`
				inner join `loaikhach` on `khachhang`.`IDloaikhach` = `loaikhach`.`IDloaikhach`
where `tenLoaikhach` = "Diamond" 
group by `khachhang`.`hoten`    	
order by solandatphong asc
;

-- +++++++++++++++++++++++++++
-- TASK 5: Hiển thị IDKhachHang, HoTen, TenLoaiKhach, IDHopDong, TenDichVu, NgayLamHopDong, NgayKetThuc, TongTien 
-- (Với TongTien được tính theo công thức như sau: ChiPhiThue + SoLuong*Gia, với SoLuong và Giá là từ bảng DichVuDiKem)
-- cho tất cả các Khách hàng đã từng đặt phỏng. (Những Khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).

select `khachhang`.IDkhachhang, `khachhang`.hoten, 
	`loaikhach`.tenLoaikhach,
    `dichvu`.tendichvu,
	`hopdong`.IDhopdong, `hopdong`.ngaylamhopdong, `hopdong`.ngayketthuc,
    (`dichvu`.chiPhiThue + `hopdongchitiet`.soluong * `dichvudikem`.gia) as tongtien    
from `khachhang`
	left join `loaikhach` on `khachhang`.IDloaiKhach = `loaikhach`.IDloaiKhach
	left join `hopdong` on `khachhang`.IDkhachhang = `hopdong`.IDkhachhang
	left join `dichvu` on `hopdong`.IDdichvu = `dichvu`.IDdichvu
	left join `hopdongchitiet` on `hopdong`.IDhopdong = `hopdongchitiet`.IDhopdong
    left join `dichvudikem` 	on `hopdongchitiet`.IDdichvudikem = `dichvudikem`.IDdichvudikem
group by `khachhang`.IDkhachhang
    ;
select * from `dichvudikem`;

-- +++++++++++++++++++++++++++
-- TASK 6: Hiển thị IDDichVu, TenDichVu, DienTich, ChiPhiThue, TenLoaiDichVu của tất cả các loại Dịch vụ 
-- chưa từng được Khách hàng thực hiện đặt từ quý 1 của năm 2019 (Quý 1 là tháng 1, 2, 3).
-- 1. hien ra tat ca cac loai dich vu gom villa vip, villa bussiness, villa normal, house, room tuong tu
-- trong hop dong trong moi khoang thoi gian tu 2019 -2020
-- 2. hien ra tat ca cac loai dich vu chua xuat hien trong nam 2019 -2020

select
   	`hopdong`.IDhopdong , `hopdong`.ngaylamhopdong as hop_dong_gan_nhat, `hopdong`.ngayketthuc,
	`dichvu`.IDdichvu, `dichvu`.tendichvu , `dichvu`.dientich, `dichvu`.chiPhiThue,
	`loaidichvu`.tenLoaiDichVu
from `hopdong`
	left join `dichvu` on `hopdong`.IDdichvu = `dichvu`.IDdichvu   
    left join `loaidichvu` on `dichvu`.IDloaidichvu = `loaidichvu`.IDloaidichvu
where tenLoaiDichVu not in 
(select
	`loaidichvu`.tenLoaiDichVu
from `hopdong`
	left join `dichvu` on `hopdong`.IDdichvu = `dichvu`.IDdichvu   
    left join `loaidichvu` on `dichvu`.IDloaidichvu = `loaidichvu`.IDloaidichvu
where(	year(`hopdong`.ngaylamhopdong) between 2019 and 2020	)
)
;

-- +++++++++++++++++++++++++++
-- 7.	Hiển thị thông tin IDDichVu, TenDichVu, DienTich, SoNguoiToiDa, ChiPhiThue, TenLoaiDichVu của 
-- tất cả các loại dịch vụ đã từng được Khách hàng đặt phòng trong năm 2018 nhưng chưa từng 
-- được Khách hàng đặt phòng  trong năm 2019.

select
   	`hopdong`.IDhopdong , `hopdong`.ngaylamhopdong as hop_dong_gan_nhat, `hopdong`.ngayketthuc,
	`dichvu`.IDdichvu, `dichvu`.tendichvu , `dichvu`.dientich, `dichvu`.chiPhiThue,
	`loaidichvu`.tenLoaiDichVu
from `hopdong`
	left join `dichvu` on `hopdong`.IDdichvu = `dichvu`.IDdichvu   
    left join `loaidichvu` on `dichvu`.IDloaidichvu = `loaidichvu`.IDloaidichvu
where year(`hopdong`.ngaylamhopdong) = 2018 
and `loaidichvu`.tenLoaiDichVu not in
(
select
	`loaidichvu`.tenLoaiDichVu
from `hopdong`
	left join `dichvu` on `hopdong`.IDdichvu = `dichvu`.IDdichvu   
    left join `loaidichvu` on `dichvu`.IDloaidichvu = `loaidichvu`.IDloaidichvu
where year(`hopdong`.ngaylamhopdong) = 2019)
;
--    	`hopdong`.IDhopdong , `hopdong`.ngaylamhopdong as hop_dong_gan_nhat, `hopdong`.ngayketthuc,
-- 	`dichvu`.IDdichvu, `dichvu`.tendichvu , `dichvu`.dientich, `dichvu`.chiPhiThue,

-- +++++++++++++++++++++++++++
-- 8.	Hiển thị thông tin HoTenKhachHang có trong hệ thống, 
-- với yêu cầu HoThenKhachHang không trùng nhau. 
-- Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên
-- cach 1: dung group by
select hoten, count(hoten) as soLanDatPhong
 from `khachhang`
group by hoten
;
-- cach 2: dung distinc
select distinct hoten
from  `khachhang`
;
-- cach 3: dung union
select hoten from `khachhang`
union
select hoten from `khachhang`
;

-- +++++++++++++++++++++++++++
-- 9.	Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng 
-- trong năm 2019 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.

select month(`hopdong`.ngaylamhopdong) as thang, 
	year(`hopdong`.ngaylamhopdong) as nam, count(IDkhachhang) as soKhachDatPhong
from `hopdong`
where year(`hopdong`.ngaylamhopdong) = 2019
group by thang
;
select * from `hopdong`
where year(`hopdong`.ngaylamhopdong) = 2019
;
-- +++++++++++++++++++++++++++
-- 10.	Hiển thị thông tin tương ứng với từng Hợp đồng thì đã sử dụng bao nhiêu Dịch vụ đi kèm
-- Kết quả hiển thị bao gồm IDHopDong, NgayLamHopDong, NgayKetthuc, TienDatCoc, 
-- SoLuongDichVuDiKem (được tính dựa trên việc count các IDHopDongChiTiet).
select `hopdong`.IDhopdong, `hopdong`.ngaylamhopdong, `hopdong`.ngayketthuc , `hopdong`.tiendatcoc,
	`hopdongchitiet`.IDdichvudikem, sum(`hopdongchitiet`.soluong) as soLuongDichVuDiKem
from `hopdong`
	left join `hopdongchitiet` on `hopdong`.IDhopdong = `hopdongchitiet`.IDhopdong
group by `hopdongchitiet`.IDhopdong
;
select * from hopdongchitiet;

-- 11.	Hiển thị thông tin các Dịch vụ đi kèm đã được sử dụng bởi những Khách 
-- hàng có TenLoaiKhachHang là “Diamond” và có địa chỉ là “Vinh” hoặc “Quảng Ngãi”.
select `khachhang`.hoten, `loaikhach`.tenLoaikhach, `khachhang`.diachi,
	`dichvudikem`.tendichvudikem, `hopdongchitiet`.soluong
from `khachhang` 
	left join `loaikhach` on `khachhang`.IDloaiKhach = `loaikhach`.IDloaiKhach
    left join `hopdong` on `khachhang`.IDkhachhang = `hopdong`.IDkhachhang
    left join `hopdongchitiet` on `hopdong`.IDhopdong = `hopdongchitiet`.IDhopdong 
    left join `dichvudikem` on `hopdongchitiet`.IDdichvudikem = `dichvudikem`.IDdichvudikem
where
	`loaikhach`.tenLoaikhach = "Diamond"
    and (`khachhang`.diachi = "Vinh" or `khachhang`.diachi = "Quang Ngai" )
    ;
select * from khachhang;

-- +++++++++++++++++++++++++++++++++++++
-- 12.	Hiển thị thông tin TenKhachHang, SoDienThoaiKhachHang, TenNhanVien, IDHopDong, TenDichVu, 
-- SoLuongDichVuDikem (được tính dựa trên tổng Hợp đồng chi tiết), TienDatCoc của tất cả các dịch vụ đã 
-- từng được khách hàng đặt vào 3 tháng cuối năm 2019 nhưng chưa từng được khách hàng đặt 
-- vào 6 tháng đầu năm 2019.
select `khachhang`.hoten, `khachhang`.sdt, 
	`nhanvien`.hoten as tenNhanVien,
	`hopdong`.IDhopdong, `hopdong`.ngaylamhopdong, `hopdong`.tiendatcoc,
    `dichvu`.tendichvu, `dichvu`.IDdichvu,
	sum(`hopdongchitiet`.soluong) as soLuongDichVuDiKem    
from `dichvu`
	join `hopdong` on `dichvu`.IDdichvu = `hopdong`.IDdichvu
    join `khachhang` on `khachhang`.IDkhachhang = `hopdong`.IDkhachhang
    join `nhanvien` on `hopdong`.IDnhanvien = `nhanvien`.IDnhanvien 
    join `hopdongchitiet` on `hopdong`.IDhopdong = `hopdongchitiet`.IDhopdong      
where year(`hopdong`.ngaylamhopdong) = 2019 
	and (month(`hopdong`.ngaylamhopdong) between 10 and 12)
    and 
    `dichvu`.tendichvu not in 
    (    
	select `dichvu`.tendichvu
	from `dichvu`
		join `hopdong` on `dichvu`.IDdichvu = `hopdong`.IDdichvu
		join `khachhang` on `khachhang`.IDkhachhang = `hopdong`.IDkhachhang
		join `nhanvien` on `hopdong`.IDnhanvien = `nhanvien`.IDnhanvien 
		join `hopdongchitiet` on `hopdong`.IDhopdong = `hopdongchitiet`.IDhopdong        
	where year(`hopdong`.ngaylamhopdong) = 2019 
		and (month(`hopdong`.ngaylamhopdong) between 1 and 6)
	group by `hopdong`.IDhopdong
    )     
group by `hopdong`.IDhopdong
;

-- +++++++++++++++++++++++++++++++++++++
-- 13.	Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng. 
-- (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau). 
select `dichvudikem`.tendichvudikem, sum(`hopdongchitiet`.soluong) as soLuongLonNhat
from `hopdong`
	left join `hopdongchitiet` on `hopdong`.IDhopdong = `hopdongchitiet`.IDhopdong 
    left join `dichvudikem` on `hopdongchitiet`.IDdichvudikem = `dichvudikem`.IDdichvudikem
group by `dichvudikem`.tendichvudikem 
having soLuongLonNhat = (
select sum(`hopdongchitiet`.soluong) as soLuongLonNhat
from `hopdong`
	left join `hopdongchitiet` on `hopdong`.IDhopdong = `hopdongchitiet`.IDhopdong 
    left join `dichvudikem` on `hopdongchitiet`.IDdichvudikem = `dichvudikem`.IDdichvudikem
group by `dichvudikem`.tendichvudikem 
order by soLuongLonNhat desc
limit 1
)
;
select * from dichvudikem;

-- +++++++++++++++++++++++++++++++++++++
-- 14.	Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất. 
-- Thông tin hiển thị bao gồm IDHopDong, TenLoaiDichVu, TenDichVuDiKem, SoLanSuDung.
select `hopdong`.IDhopdong,
	`dichvudikem`.tendichvudikem,
    `loaidichvu`.tenLoaiDichVu,
    `hopdongchitiet`.soluong as SoLanSuDung
from `hopdong`
	left join `hopdongchitiet` on `hopdong`.IDhopdong = `hopdongchitiet`.IDhopdong 
 	left join `dichvudikem` on `hopdongchitiet`.IDdichvudikem = `dichvudikem`.IDdichvudikem
    left join `dichvu` on `hopdong`.IDdichvu = `dichvu`.IDdichvu    
	left join `loaidichvu` on `dichvu`.IDloaidichvu = `loaidichvu`.IDloaidichvu
where `hopdongchitiet`.soluong = 1;
;

-- +++++++++++++++++++++++++++++++++++++
-- 15.	Hiển thi thông tin của tất cả nhân viên bao gồm IDNhanVien, HoTen, TrinhDo, TenBoPhan, SoDienThoai, DiaChi 
-- mới chỉ lập được tối đa 3 hợp đồng từ năm 2018 đến 2019.
select count(`hopdong`.IDhopdong) as SoLuongHopDong, `hopdong`.IDNhanVien,
	`nhanvien`.hoten, `trinhdo`.trinhDo, `bophan`.tenBoPhan, `nhanvien`.sdt, `nhanvien`.diachi
from `hopdong`
	left join `nhanvien` on `hopdong`.IDnhanvien = `nhanvien`.IDnhanvien
    left join `trinhdo` on `nhanvien`.IDtrinhdo = `trinhdo`.IDtrinhdo
    left join `vitri` on `nhanvien`.IDvitri = `vitri`.IDvitri
    left join `bophan` on `nhanvien`.IDbophan = `bophan`.IDbophan
where year(`hopdong`.ngaylamhopdong) between 2018 and 2019
group by(`hopdong`.IDNhanVien)
having SoLuongHopDong <= 3
;

-- 16.	Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2017 đến năm 2019.

-- select `nhanvien`.IDNhanVien, `nhanvien`.hoten
SET SQL_SAFE_UPDATES = 0;
delete
from `nhanvien`
where not exists
	(
select `hopdong`.IDNhanVien
from `hopdong`
where year(`hopdong`.ngaylamhopdong) between 2017 and 2019 and hopdong.IDNhanVien = nhanvien.IDNhanVien
	)
;
select * from nhanvien;
-- lenh "join" va "not in" thi trong subquery dung de select view duoc, nhung khong dung cho lenh delete duoc vi se vo hieu lenh
-- join ben trong subquery
-- voi delete thi dung "exists" va chuyen cac cot tham chieu tuong ung xuong dong lenh where moi dung duoc lenh delete 

-- +++++++++++++++++++++++++
-- 17.	Cập nhật thông tin những khách hàng có TenLoaiKhachHang từ  Platinium lên Diamond, chỉ cập nhật 
-- những khách hàng đã từng đặt phòng với tổng Tiền thanh toán trong năm 2019 là lớn hơn 3000$.
select * from khachhang;
update khachhang
set IDloaikhach = 1
where exists
	(
select `hopdong`.IDkhachhang
from `hopdong`
where year(ngaylamhopdong) = 2019 and tongtien >= 3000
	)
;

-- +++++++++++++++++++++++++
-- 18.	Xóa những khách hàng 
-- có hợp đồng trước năm 2016 (chú ý ràng buộc giữa các bảng).

SET SQL_SAFE_UPDATES = 0;
select * from hopdong;
delete
from khachhang 
where exists (
select 	
    `khachhang`.IDkhachhang
from `hopdong`
where year(`hopdong`.ngaylamhopdong) < 2016 and `khachhang`.IDkhachhang = `hopdong`.IDkhachhang
)
;
-- de xoa duoc row o nhung bang co  khoa ngoai tham chieu khoa chinh voi nhau thi o moi dong tham chieu khi
-- tao bang can de dong chu sau: 
-- vi du la_  foreign key (IDhopdong) references hopdong(IDhopdong) on update cascade on delete cascade,
-- o nhung bang co lien ket voi nhau deu can lam nhu vay

-- +++++++++++++++++++++++++
-- 19.	Cập nhật giá cho các Dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2019 lên gấp đôi.
-- 	`dichvudikem`.gia as usd,
-- 	`hopdongchitiet`.soluong,
--     `hopdong`.IDhopdong, `hopdong`.ngaylamhopdong,
SET SQL_SAFE_UPDATES = 0;
update dichvudikem
set dichvudikem.gia = 2 * dichvudikem.gia
where dichvudikem.IDdichvudikem in
	(
select 	`hopdongchitiet`.IDdichvudikem
from `hopdongchitiet`
    left join `hopdong` on `hopdong`.IDhopdong = `hopdongchitiet`.IDhopdong 
where 	hopdongchitiet.soluong >= 10 and `hopdong`.IDhopdong = `hopdongchitiet`.IDhopdong 
	and year(`hopdong`.ngaylamhopdong) = 2019
	)
;
select * from dichvudikem;
-- khi update hay delete ma trong subquery co join table thi cu giu nguyen join va copy bieu thuc lien ket dang sau
-- tu khoa "on" roi paste xuong dong lenh where la duoc

-- ++++++++++++++++++++++++++++
-- 20.	Hiển thị thông tin của tất cả các Nhân viên và Khách hàng có trong hệ thống, thông tin hiển thị 
-- bao gồm ID (IDNhanVien, IDKhachHang), HoTen, Email, SoDienThoai, NgaySinh, DiaChi.
select nhanvien.IDnhanvien, nhanvien.hoten as TenNV, nhanvien.email as EmailNV, 
	nhanvien.sdt as SdtNV, nhanvien.ngaysinh as NgaySinhNV, nhanvien.diachi as DiaChiNV
from nhanvien
;
select    khachhang.IDkhachhang, khachhang.hoten as TenKH, khachhang.email as EmailKH,
    khachhang.sdt as SdtKH, khachhang.ngaysinh as NgaySinhKH, khachhang.diachi as DiaChiKH
from khachhang
;

-- ++++++++++++++++++
-- select `nhanvien`.hoten,
-- 	`khachhang`.hoten, 
--     `hopdong`.IDhopdong,
--     `dichvu`.tendichvu
-- from `khachhang`
-- 	left join `hopdong` on `khachhang`.IDkhachhang = `hopdong`.IDkhachhang
--     left join `nhanvien` on `hopdong`.IDnhanvien = `nhanvien`.IDnhanvien
--     left join `dichvu` on `hopdong`.IDdichvu = `dichvu`.IDdichvu
--     
--     left join `loaikhach` on `khachhang`.IDloaiKhach = `loaikhach`.IDloaiKhach 
--     
--     left join `kieuthue` on `dichvu`.IDkieuthue = `kieuthue`.IDkieuthue
--     left join `loaidichvu` on `dichvu`.IDloaidichvu = `loaidichvu`.IDloaidichvu
--     
--     left join `trinhdo` on `nhanvien`.IDtrinhdo = `trinhdo`.IDtrinhdo
--     left join `vitri` on `nhanvien`.IDvitri = `vitri`.IDvitri
--     left join `bophan` on `nhanvien`.IDbophan = `bophan`.IDbophan
--     
--     left join `hopdongchitiet` on `hopdong`.IDhopdong = `hopdongchitiet`.IDhopdong 
-- 	left join `dichvudikem` on `hopdongchitiet`.IDdichvudikem = `dichvudikem`.IDdichvudikem
-- ;