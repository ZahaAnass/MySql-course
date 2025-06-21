/*insert into transactions (amount, customer_id)
values (1.00, null);*/
 
/*insert into customers (first_name, last_name)
values ("Poppy", "Puff");*/


select * 
from transactions inner join customers
on transactions.customer_id = customers.customer_id; 

select * 
from transactions left join customers
on transactions.customer_id = customers.customer_id; 

select * 
from transactions right join customers
on transactions.customer_id = customers.customer_id; 
