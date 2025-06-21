-- Trigger = When an event happens, do something
-- 			 ex. (INSERT, UPDATE, DELETE)
--           checks data, handles errors, auditing tables

alter table employees
add column salary decimal(10, 2) after hourly_pay;

select * from employees;

update employees
set salary = hourly_pay * 2080;

select * from employees;

create trigger before_hourly_pay_update
before update on employees
for each row
set new.salary = (new.hourly_pay * 2080);

show triggers;

select *from employees;

update employees
set hourly_pay = 50
where employee_id = 1;

select *from employees;

update employees
set hourly_pay = hourly_pay + 1;

select *from employees;

create trigger before_hourly_pay_insert
before insert on employees
for each row
set new.salary = (new.hourly_pay * 2080);

insert into employees
values(6, "Sheldon", "Plankton", 10, null, "janitor", "2023-01-07", 5);
/*null will be (hourly_pay * 2080) beacause of trigger*/

select * from employees;

create table expenses(
	expense_id int primary key,
    expense_name varchar(50),
    expense_total decimal(10, 2)
);

insert into expenses
values (1, "salaries", 0), 
	   (2, "supplies", 0), 
       (3, "taxes", 0);
       
select * from expenses;

update expenses
set expense_total = (select sum(salary) from employees)
where expense_name = "salaries";

select * from expenses;

create trigger after_salary_delete
after delete on employees 
for each row
update expenses
set expense_total = expense_total - old.salary
where expense_name = "salaries";

delete from employees
where employee_id = 6;

select * from expenses;

create trigger after_salary_insert
after insert on employees
for each row
update expenses
set expense_total = expense_total + new.salary
where expense_name = "salaries";

insert into employees
values(6, "Sheldon", "Plankton", 10, null, "janitor", "2023-01-07", 5);

select * from expenses; 

create trigger after_salary_update
after update on employees
for each row
update expenses
set expense_total = expense_total + (new.salary - old.salary)
where expense_name = "salaries";

update employees
set hourly_pay = 100
where employee_id = 1;

select * from expenses;