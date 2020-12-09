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
hoten int,
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
foreign key (IDkhachhang) references khachhang(IDkhachhang),
foreign key (IDnhanvien) references nhanvien(IDnhanvien),
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
foreign key (IDhopdong) references hopdong(IDhopdong),
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
value
	(1, "Tran Manh", 2, 2, 3, '2001-02-10', "986832147", 2000, "986574132", "manh@gmail.com", "Vung Tau"),
    (2, "Hoang Linh", 3, 3, 2, '2000-03-12', "987532147",3000, "326574132", "linh@gmail.com", "Phu Tho"),
    (3, "Hoang Nguyen", 1, 1, 1, '1992-06-19', "857532147",1000, "326574168", "nguyen@gmail.com.vn", "Lam Dong"),
    (4, "Vu Vinh", 5, 3, 4, '1980-11-26', "85758246",5000, "561574168", "vinh@gmail.com", "Ca Mau"),
    (5, "Thien Vi", 3, 2, 3, '1982-11-26', "85758246",3000, "561574166", "vi@gmail.com", "Bac Giang"),
	(6, "The Lam", 4, 4, 2, '1984-11-26', "85759646",4000, "481574168", "lam@gmail.com", "Dong Nai")
    ;
update nhanvien
set ngaysinh = '1984-11-26'
where `IDnhanvien` = 6
;
select * from nhanvien;
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
    (6, 4, "Tran Dan", '1989-09-18', "55158126", "09639651254246", "dan@gmail.com", "Quang Ninh")
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
    (3, "normal")
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
	(6, "villa", 180, 5, 12, 300, 3, 2)
    ;
select * from dichvu;

-- +++++++++++++++++++++++++++
insert into dichvudikem
value 
	(1, "massage", 50, 1, "on" ),
	(2, "karaoke", 30, 1, "off" ),
	(3, "thức ăn", 10, 1, "on" ),
	(4, "nước uống", 5, 1, "on" ),
    (5, "thuê xe tham quan", 80, 1, "on" )
    ;
select * from dichvudikem;

-- +++++++++++++++++++++++++++
insert into hopdongchitiet
value 
	(1, 1, 3, 8),
    (2, 3, 5, 15),
    (3, 2, 4, 9),
    (4, 4, 2, 12),
	(6, 7, 2, 3),
    (7, 6, 1, 4),
    (8, 9, 3, 12),
    (9, 8, 5, 6),
    (10, 10, 4, 5),
    (11, 11, 5, 2)
    ;
select * from dichvudikem;

-- insert into hopdongchitiet
-- value 
-- 	(6, 7, 2, 3),
--     (7, 6, 1, 4),
--     (8, 9, 3, 12),
--     (9, 8, 5, 6),
--     (10, 10, 4, 5),
--     (11, 11, 5, 2)
--     ;
-- +++++++++++++++++++++++++++
insert into hopdong
value 
	(1, 1, 1, 3, '2019-08-15', '2019-11-2', 200, 1600),
    (2, 4, 3, 1, '2019-06-09', '2019-10-14', 100, 2400),
    (3, 2, 2, 2, '2019-10-06', '2019-12-11', 150, 3700),
    (6, 5, 5, 3, '2018-10-06', '2018-12-12', 200, 1600),        
    (4, 3, 4, 1, '2019-10-06', '2019-12-11', 150, 3700),
	(7, 2, 3, 2, '2020-02-06', '2019-02-11', 150, 300),
	(8, 2, 3, 3, '2020-03-02', '2020-03-05', 200, 250),
    (9, 5, 4, 3, '2019-02-06', '2019-02-12', 200, 300),    
	(10, 5, 4, 5, '2018-02-15', '2018-02-18', 200, 300),      
	(11, 5, 4, 6, '2017-02-20', '2017-02-22', 200, 300)       
    ;
select * from hopdong;
-- update hopdong
-- set ngaylamhopdong = '2018-02-15', ngayketthuc = '2018-02-18'
-- where IDhopdong = 10
-- ;

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
   	`hopdong`.IDhopdong , `hopdong`.ngaylamhopdong, `hopdong`.ngayketthuc,
	`dichvu`.IDdichvu, `dichvu`.tendichvu , `dichvu`.dientich, `dichvu`.chiPhiThue,
	`hopdongchitiet`.IDhopDongChiTiet, `dichvudikem`.tendichvudikem
from `hopdong`
	left join `dichvu` on `hopdong`.IDdichvu = `dichvu`.IDdichvu   
	-- dang lam toi hien ra nhung cot ma co join lai de lam cot ben ngoai, cot ben trong where chua lam
where(
	year(`hopdong`.ngaylamhopdong) between 2019 and 2020
    and `dichvu`.tendichvu = 'house' and `loaidichvu`.tenLoaiDichVu = 'business'
	)


;
select * from `dichvudikem`;
