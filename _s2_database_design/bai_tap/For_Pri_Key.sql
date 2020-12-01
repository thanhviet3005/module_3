use accountBank;

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
    balance int not null,
    primary key (account_number),
    foreign key (account_number) references customers(customer_number)
);
create table transactions(
	tran_number int not null,
    account_number int not null,
    date_tran date,
    amount float(2),
    descriptions varchar(255),
    primary key(tran_number),
    foreign key(tran_number) references accounts(account_number)
);