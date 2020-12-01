use foreign_key;

create table customers(
id int auto_increment,
customer_name varchar(40),
address varchar(255),
email varchar(255),
primary key (id)
);
create table orders(
id int auto_increment,
staff varchar(50),
customer_id int, 
primary key(id),
foreign key(customer_id) references customers(id)
);