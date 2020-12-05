use library;
create table sinhvien(
	sinhvien_id varchar(25),
    sinhvien_ten varchar(50),
    diachi varchar(150),
    email varchar(50),        
    ngaysinh date,
    phone varchar(15),
    primary key (sinhvien_id)
);
create table thethuvien(
	mathe varchar(25),
    sinhvien_id varchar(50),
    foreign key (sinhvien_id) references sinhvien(sinhvien_id),
    primary key (mathe)
);
create table nhanvien(
	nhanvienid int,
    nhanvien_ten varchar(50),
    phone varchar(15),
    primary key (nhanvienid)
);
create table loaisach(
	loaisach varchar(50),
    soluong int,
    primary key (loaisach)
);
create table sach(
	masach varchar(25),
    tensach varchar(50),
    nhaxuatban varchar(50),
    tacgia varchar(50),
    namxuatban varchar(15),
    solanxuatban int,
    giaban int,     
    loaisach varchar(50),
    foreign key (loaisach) references loaisach(loaisach),
    primary key (masach)
);

create table phieumuonsach(
	phieumuonsach_id int,
    ngaymuon date,
    ngaytra date,
    soluong int,
	masach varchar(25),
    foreign key (masach) references sach(masach),
	mathe varchar(25),
    foreign key(mathe) references `thethuvien`(`mathe`),
    nhanvienid int,
    foreign key(nhanvienid) references nhanvien(nhanvienid),
    primary key (phieumuonsach_id) 
);


