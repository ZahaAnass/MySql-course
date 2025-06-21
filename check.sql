/*CREATE TABLE employees(
	employee_id INT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    hourly_pay DECIMAL(5, 2),
    hire_date DATE
    constraint chk_hourly_pay check (hourly_pay >= 10.00)
);*/
alter table employees
add constraint chk_hourly_pay check(hourly_pay >= 10.00);/*if you want to add to an existant table*/
select * from employees; 
/*a colunm cannont be created until condition is checked*/
/*if you want to cancel the check property*/
alter table employees
drop check chk_hourly_pay