-- SELF JOIN
-- join another copy of a table to itself
-- used to compare rows
-- helps to diplay a heirarchy of data
/*insert into customers 
values (4, "Poppy", "Puff")*/
/*alter table customers 
add referral_id int;
alter table employees
add supervisor_id int;*/
/*SET SQL_SAFE_UPDATES = 0;*/
/*alter table employees
add supervisor_id int;*/
update customers
set referral_id = 2
where customer_id = 3;
update customers
set referral_id = 1
where customer_id = 2;
update customers
set referral_id = 2
where customer_id = 4;
update employees 
set supervisor_id = 5
where employee_id = 2;

update employees 
set supervisor_id = 5
where employee_id = 3;

update employees 
set supervisor_id = 5
where employee_id = 4;

update employees 
set supervisor_id = 1
where employee_id = 5;


select a.customer_id, a.first_name, a.last_name, 
		concat(b.first_name, " ",b.last_name) as "referred_by" 
from customers as a
inner join customers as b
on a.referral_id = b.customer_id;


select a.first_name, a.last_name,
	   concat(b.first_name, " ", b.last_name) as "reports to" 
from employees as a
left join employees as b
on a.supervisor_id = b.employee_id;

