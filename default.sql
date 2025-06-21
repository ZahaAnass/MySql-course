#SET SQL_SAFE_UPDATES = 0;
#delete from products where product_id = 104;
/*insert into products
values (104, "straw", 0.00),
	   (105, "napkin", 0.00),
       (106, "fork", 0.00),
       (107, "spoon", 0.00);*/
#delete from products where product_id >= 104;

/*create table products(
	product_id int,
    product_name varchar(25),
    price decimal(4, 2) default 0 
);*/#to set a default value when you create table for the first time

alter table products
alter price set default 0;#to set a default value after creating a table

/*insert into products(product_id, product_name)
values (104, "straw"),
	   (105, "napkin"),
       (106, "fork"),
       (107, "spoon");*/
       
select * from products;

/*create table transactions(
	transaction_id int,
    amount decimal(5, 2),
    transaction_date datetime default now()
);*/

insert into transactions(transaction_id, amount)
values(1, 4.99),
	  (2, 2.89),
	  (3, 8.37);

select * from transactions;
drop table transactions