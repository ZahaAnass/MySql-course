select first_name, last_name
from employees;/*to return just these element of table*/

select * from employees where employee_id = 1;/*to select a specefic row*/

select * from employees where hourly_pay >= 15;

select * from employees where first_name != "Sandy";

select * from employees where hire_date is null;