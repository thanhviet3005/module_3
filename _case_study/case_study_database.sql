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
chiPhiThue varchar(45),
IDkieuthue int(45),
IDloaidichvu int,
foreign key (IDkieuthue) references kieuthue(IDkieuthue),
foreign key (IDloaidichvu) references loaiDichVu(IDloaidichvu),
primary key (IDdichvu)
);


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
luong varchar(45),
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
primary key (IDhopDongChiTiet),
foreign key (IDhopdong) references hopdong(IDhopdong),
foreign key (IDdichvudikem) references dichvudikem(IDdichvudikem)
);