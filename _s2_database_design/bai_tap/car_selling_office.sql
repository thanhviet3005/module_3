use `carselling`;
create table offices (
	officeCode varchar(10) not null,
    city varchar(50) not null,
    phone varchar(50) not null,
    addressLine1 varchar(50) not null,
    addressLine2 varchar(50) not null,
    `state` varchar(50) not null,
    country varchar(50) not null,
    postalCode varchar(15) not null,
    primary key (officeCode)
);
create table employees(
	employeeNumber int not null,
    lastName varchar(50) not null,
    firstName varchar(50) not null,
    email varchar(100) not null,
    jobTitle varchar(50) not null,
    officeCode varchar(10) not null,
    foreign key (officeCode) references offices(officeCode),
    primary key (employeeNumber)
);
create table customers_s2 (
	customerNumber int not null,
    customerName varchar(50) not null,
    contactLastName varchar(50) not null,
    contactFirstName  varchar(50) not null,
    phone varchar(50) not null,
    addressLine1  varchar(50) not null,
    addressLine2  varchar(50),
    city varchar(50) not null,
    state varchar(50) not null,
    postalCode varchar(15) not null,
    country varchar(50) not null,
    creditLimit float(2),
    employeeNumber int not null,
    foreign key (employeeNumber) references employees(employeeNumber),
    primary key(customerNumber)    
);
create table orders (
	orderNumber int not null,
    orderDate date not null,
    requiredDate date not null,
    shippedDate date not null,
    `status`  varchar(15) not null,
    comments text(5000),
    quantityOrdered int not null,
    priceEach float(2) not null,
    customerNumber int not null,
    foreign key (customerNumber) references customers_s2(customerNumber),
    primary key(orderNumber)
);
create table payments(
    amount float(2) not null,
	customerNumber int not null,
    checkNumber varchar(50) not null,
    paymentDate date not null,

    foreign key (customerNumber) references customers_s2(customerNumber),
    primary key(paymentDate)
);
create table productLines(
	productLine  varchar(50) not null,
    textDescription text(5000),
    image varchar(500),
    primary key(productLine)
);
create table products(
	productCode varchar(15) not null,
    productName varchar(70) not null,
    productScale varchar(10) not null,
    productVendor varchar(50) not null,
    productDescription text(5000) not null,
    quantityInStock int not null,
    buyPrice float(2) not null,
    MRSP float(2) not null,
    productLine  varchar(50) not null,
    foreign key (productLine) references productLines(productLine),
    primary key(productCode)
);
create table OrderDetails (
	productCode varchar(15) not null,
	orderNumber int not null,
    foreign key (productCode) references products(productCode),
    foreign key(orderNumber) references orders(orderNumber)
);






