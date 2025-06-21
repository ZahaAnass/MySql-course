/*create table products(
		product_id int,
        product_name varchar(25),
        price decimal(4, 2) not null
);*//*not null is for that value don't be null*/
/*alter table products 
modify price decimal(4, 2) not null;*/

insert into products 
values  (100, "hamburger", 3.99),
		(101, "fries", 1.89),
        (102, "soda", 1.00),
		(103, "ice cream", 1.49),
		(104, "cookie", 0);

select * from products;


