-- ROLLUP, extension of the GROUP BY clause
-- produces another row and shows the GRAND TOTAL (super-aggregate value)

select sum(amount), order_date
from transactions
group by order_date with rollup;

select count(transaction_id), order_date
from transactions
group by order_date with rollup;

select count(transaction_id) as '# of orders', customer_id
from transactions
group by customer_id with rollup;

select sum(hourly_pay) as "hourly_pay", employee_id 
from employees
group by employee_id with rollup;


