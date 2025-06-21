/*create table products (
	product_id int,
    product_name varchar(25) unique,
    price decimal(4, 2)
);*//*unique is for don't duplicate this value*/
/*alter table products
add constraint
unique(product_name)*//*if you forget to add unique when you create table*/


/*insert into products
values (100, "humburger", 3.99),
	   (101, "fries", 1.89),
	   (102, "soda", 1.00),
       (103, "ice cream", 1.49);*/
       
select * from products;

drop table products;