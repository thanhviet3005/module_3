use classicmodels;
select * from customers;
select * from productlines;
select * from products;
-- Quan sát 2 bảng product và productlines trong cơ sở dữ liệu classicmodels.
-- Bây giờ nếu muốn hiển thị ra các sản phẩm có giá lớn hơn 56.76 và 
-- số lượng trong kho lớn hơn 10 sử dụng truy vấn như sau:

select productCode, productName, buyPrice, quantityInStock, productLine 
from products 
where buyPrice > 56.76 and quantityInStock >= 6791
;

-- giá mua nằm trong khoảng từ 56.76 đến 95.59
select productCode, productname, buyPrice, productlines.productLine
from products join productlines
on products.productLine = productlines.productLine
where 56.76 <= buyPrice and buyPrice <= 95.59
;

-- Bây giờ nếu muốn hiển thị ra các sản phẩm có loại sản phẩm là Classic Cars hoặc 
-- nhà cung cấp là 'Min Lin Diecast' sử dụng truy vấn như sau:
select productCode, products.productLine, productname, productVendor
from products join productlines
on products.productLine = productlines.productLine
where products.productLine = "Classic Cars" or productVendor = "Min Lin Diecast"
;

-- Bây giờ, nếu bạn muốn lấy customerNumber, customerName, phone, paymentDate, amount từ 
-- hai bảng customers và payments với điều kiện là các khách hàng sống ở 
-- thành phố Las Vegas thực hiện truy vấn sau: 
select customers.customerNumber, customers.customerName, city, phone, paymentDate, amount
from customers join `payments`
on customers.customerNumber = payments.customerNumber
where city = 'Las Vegas'
;

-- Để tìm tất cả các đơn hàng thuộc từng khách hàng, bạn có thể sử dụng mệnh đề LEFT JOIN như sau:
select customers.customerNumber, customers.customerName, orders.orderNumber
from customers left join `orders`
on customers.customerNumber = orders.customerNumber
;

-- Để tìm tất cả khách hàng chưa đặt hàng bất kỳ sản phẩm nào, bạn có thể sử dụng truy vấn sau: 
select customers.customerNumber, customerName, orderNumber
from customers left join `orders`
on customers.customerNumber = orders.customerNumber
where orderNumber is null
;

-- Để biết được có bao nhiêu trạng thái của đơn hàng. Thực hiện như thế nào?
select `status`, count(`status`) as quantity from `orders`
group by `status`
;

-- Hãy thực hiện tính tổng số tiền của các đơn hàng theo trạng thái đặt hàng
select `status`, sum(`quantityOrdered` * `priceEach`) as amount
from `orders` inner join `orderdetails` 
on orders.orderNumber = orderdetails.orderNumber
group by `status`
;

-- Một yêu cầu khác là tính tổng tiền của từng đơn hàng, thực hiện lệnh truy vấn sau:
select `orderNumber`, sum(`quantityOrdered` * `priceEach`) as "total per orderNumber"
from `orderdetails`
group by `orderNumber`
;

-- Truy vấn sau đây sử dụng mệnh đề HAVING để bao gồm tổng doanh thu của những năm lớn hơn năm 2003.
select year(`orderDate`) as `year`, sum(`quantityOrdered` * `priceEach`) as totalAmount
from `orders` inner join `orderdetails` 
on orders.orderNumber = `orderdetails`.orderNumber
where status = "Shipped"
group by `year`
having year > 2003
;




