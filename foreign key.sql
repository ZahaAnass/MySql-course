#drop table transactions;
/*create table customers (
	customer_id int primary key auto_increment,
    first_name varchar(50),
    last_name varchar(50)
);*/

/*insert into customers (first_name, last_name)
values ("Fred", "Fish"), 
	   ("Larry", "Lobster"),
       ("Bubble", "Bass");*/

/*create table transactions (
	transaction_id int primary key auto_increment,
    amount decimal(5, 2),
    customer_id int,
    foreign key(customer_id) references customers(customer_id)
);*/
#alter table transactions drop foreign key transactions_ibfk_1;#to drop an forein key
#alter table transactions add constraint fk_customer_id foreign key(customer_id) references customers(customer_id);#to add an foreign key to an exitant table

alter table transactions auto_increment = 1000;

/*insert into transactions (amount, customer_id)
values (4.99, 3), (2.89, 2), (3.38, 3), (4.99, 1);*/

select * from customers;
select * from transactions;