-- subquery
-- a query within another query
-- query(subquery)

select first_name, last_name, hourly_pay, (select avg(hourly_pay) from employees) as avg_pay
from employees;

select first_name, last_name, hourly_pay
from employees
where hourly_pay > (select avg(hourly_pay) from employees);

select * from employees;

-- distinct is to eleminate the occurence
select first_name, last_name
from customers
where customer_id in (select distinct customer_id
from transactions
where customer_id is not null);-- it's equal to in (1, 2, 3)

select * from transactions;