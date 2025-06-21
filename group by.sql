-- GROUP BY = aggregate all rows by a specific column
-- 			  often used with aggregate functions
-- 			  ex. SUM(), MAX(), MIN(), AVG(), COUNT()
USE company;

select * from transactions;

describe transactions;

alter table transactions
add column order_date date;

SET SQL_SAFE_UPDATES = 0;

delete from transactions;

insert into transactions (amount, customer_id, order_date)
values (4.99, 3, "2023-01-01"),
	   (2.89, 2, "2023-01-01"),
       (3.38, 3, "2023-01-02"),
       (4.99, 1, "2023-01-02"),
       (1, null, "2023-01-03"),
       (2.49, 4, "2023-01-03"),
       (5.48, null, "2023-01-03");

select sum(amount), order_date
from transactions
group by order_date;

select max(amount), order_date
from transactions
group by order_date;

select min(amount), order_date
from transactions
group by order_date;

select avg(amount), order_date
from transactions
group by order_date;

select count(amount), order_date
from transactions
group by order_date;

select sum(amount), customer_id
from transactions
group by customer_id;

select max(amount), customer_id
from transactions
group by customer_id;

select min(amount), customer_id
from transactions
group by customer_id;

select avg(amount), customer_id
from transactions
group by customer_id;

select count(amount), customer_id
from transactions
group by customer_id
having count(amount) > 1 and customer_id is not null;/*having is like where because where is not supported for group by*/

