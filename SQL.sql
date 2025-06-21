-- drop database company;
CREATE DATABASE company;
USE company;
CREATE TABLE employees(
	employee_id INT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    hourly_pay DECIMAL(5, 2),
    hire_date DATE
);
rename table employees to workers;/*to rename a table*/
rename table workers to employees;
/*drop table employees;*//*to drop a table*/
alter table employees
add phone_number varchar(15);/*add an atribut to a table*/
alter table employees 
rename column phone_number to email;
alter table employees
modify column email varchar(100)/*to modify data type of an element of the table*/
after last_name ;/*to select the position you can use just first to set element in the top of columns*/
alter table employees drop column email ;/*if you want to delete from table*/
select * from employees;/*select all element of a table*/
insert into employees /*(employee_id,first_name,last_name)if tou want to give just these data for an elmployee*/
/*insert rows to a table*/
values(1,"Eugene","Krabs",25.50,"2023-01-02"),
(2,"Squidward","Tentcles",15.00,"2023-01-03"),
(3,"Spongebob","Squarepants",12.50,"2023-01-04"),
(4,"Patrick","Star",12.50,"2023-01-05"),
(5,"Sandy","Cheeks",17.25,"2023-01-06");
/*(6 , "Sheldon", "Plankton");*/
select * from employees;
describe employees;