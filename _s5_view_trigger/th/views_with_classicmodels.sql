use `classicmodels`;
select * from customers;

-- ++++++++++++++++++++++++++++++++++
-- tao mot cua so view de xem 2 cot customerName va phone trong table customers
-- buoc 1: la tao cua so view
create view customer_view as
select customerName, phone
from `customers`
;
-- buoc 2: la xem trong cua so do co gi
select * from customer_view;

-- ++++++++++++++++++++++++++++++++++
-- **thuc hanh voi with check option
create view customer_view2 as
select `customerName`, phone, state
from `customers`
where state is not null
with check option
;
select * from customer_view2;
-- de update mot view thi thoa man nhieu quy tac, xem google, 
-- nhung ban ghi duoc update phai o trong view truoc do da
update customer_view2
set phone = '7025551832'
where customerName = 'Signal Gift Stores'
;


