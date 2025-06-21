-- UNION combines the results of two or more SELECT statements
-- UNION don't allow duplicate but UNION all allow duplicate
/*create table income(
	income_name varchar(25),
    amount decimal(10, 2)
);

create table expenses(
	expense_name varchar(25),
    amount decimal(10, 2)
);

 insert into income 
 values("orders", 1000000),
	   ("merchandise", 50000),
	   ("services", 125000);

insert into expenses
values("wages", -250000.00),
	  ("tax", -50000.00), 
      ("repairs", -15000);*/

select * from income
union 
select * from expenses;

/*insert into customers 
values(5, "Sheldon", "Plank");*/

select first_name, last_name from employees
union /*all*/
select first_name, last_name from customers;

