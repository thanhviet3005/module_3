use accountbank;
create table customers(
	customer_number int not null,
	fullname char(255),
	address varchar(255),
	email varchar(255),
	phone char(50),
    primary key (customer_number)
);
create table accounts(
	account_number int not null, 
    account_type varchar(255),
    date_open date,
    balance int,
    customer_number int,
    foreign key (customer_number) references customers(customer_number),
    primary key (account_number)
);
create table transactions(
	tran_number int not null,
    date_tran date,
    amount float(2),
    descriptions varchar(255),
    account_number int not null,
    foreign key(account_number) references accounts(account_number),
    primary key(tran_number)
);