create database store;
use store;
-- drop database store;
create table products(
	product_id int primary key auto_increment,
    product_name varchar(50),
    price decimal(6, 2),
	stock int
);

create table customers(
	customer_id int primary key auto_increment,
    first_name varchar(50),
    last_name varchar(50),
    email varchar(80) unique
);

create table orders(
	order_id int primary key auto_increment,
    customer_id int,
    order_date date,
    foreign key(customer_id) references customers(customer_id)
);

create table order_items(
	order_item_id int primary key auto_increment,
    order_id int,
    product_id int,
    quantity int,
    foreign key(order_id) references orders(order_id),
    foreign key(product_id) references products(product_id)
);

insert into products(product_name, price, stock)
values ("Laptop", 100, 10), 
	   ("Headphones", 50, 15),
	   ("Mouse", 30, 30);

insert into customers(first_name, last_name, email)
values ("michel", "skofield", "skofiel@gmail.com"), 
	   ("linkon", "borose", "linkon@gmail.com");

insert into orders(customer_id, order_date)
values (1, "2025-01-29"),
	   (2, "2025-01-30");

insert into order_items(order_id, product_id, quantity)
values (1, 1, 2),
	   (2, 2, 3),
       (2, 3, 4);

select * from products
where price > 50;

select * from orders inner join customers
on orders.customer_id = customers.customer_id
where first_name = "michel";

select sum(price * quantity) as total
from order_items inner join products
on order_items.product_id = products.product_id
group by order_id;

select * from customers left join orders
on customers.customer_id = orders.customer_id
where orders.customer_id is null;

-- You need to learn switch case
update products
set stock = stock - case product_id
	when 1 then 2
    when 2 then 3
    when 3 then 4
    else 0
end
where product_id in (1, 2, 3);

delete from customers 
where customer_id = 3;

select * from products;
select * from customers;
select * from orders;
select * from order_items;
