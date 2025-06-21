-- Views
-- a virtual table based on the result-set of an SQL statement
-- The fields in view are fields from one or more real tables in the database
-- They're not real tables, but can be interacted with as if they were

create view employee_attendance as 
select first_name, last_name
from employees;

select * from employee_attendance
order by last_name asc;

drop view employee_attendance;

/*alter table customers
add column email varchar(50);*/
update customers
set email = "FFish@gmail.com"
where customer_id = 1;
update customers
set email = "LLobster@gmail.com"
where customer_id = 2;
update customers
set email = "BBass@gmail.com"
where customer_id = 3;
update customers
set email = "PPuff@gmail.com"
where customer_id = 4;

select * from customers;

create view customer_emails as
select email
from customers;

select * from customer_emails;

insert into customers 
values (5, "Pearl", "Krabs", null, "PKrabs@gmail.com");

select * from customers;

select * from customer_emails;