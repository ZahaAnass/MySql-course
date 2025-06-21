/*alter table employees
add column job varchar(25) after hourly_pay;*/


/*update employees
set job = "manager" 
where employee_id = 1 ;

update employees
set job = "cashier" 
where employee_id = 2 ;

update employees
set job = "cook" 
where employee_id = 3 ;

update employees
set job = "cook" 
where employee_id = 4 ;

update employees
set job = "asst. manager" 
where employee_id = 5 ;*/

select * from employees 
where hire_date < "2023-01-5" and job = "cook";

select * from employees
where job = "cook" or job = "cashier";

select * from employees
where not job = "manager" and not job = "cook";

select * from employees
where hire_date between "2023-01-04" and "2023-01-07";

select * from employees
where job in ("cook", "cashier");

select * from employees;

