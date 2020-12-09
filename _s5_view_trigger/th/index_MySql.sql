use `classicmodels`;
explain select * from `customers`
where customerNumber = 175
;
alter table `customers` add index idx_customerNumber(customerNumber);
explain select * from `customers`
where customerNumber = 175
;
-- lam theo bai thuc hanh voi index theo cap la khong duoc, khong ro ly do, bo qua
alter table `customers` add index idx_customerNumber_2(contactLastName, contactFirstName);
EXPLAIN SELECT * FROM customers WHERE contactFirstName = 'Jean' or contactFirstName = 'King';