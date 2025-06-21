-- ON DELETE SET NULL = When a FK is deleted, replace FK with NULL
-- ON DELETE CASCADE  = When a FK is deleted, delete row
set autocommit = off;


select * from transactions;

/*create table transactions (
	transaction_id int primary key auto_increment,
    amount decimal(5, 2),
    customer_id int,
    foreign key(customer_id) references customers(customer_id)
	on delete set null
);*/
alter table transactions drop foreign key fk_customer_id;

alter table transactions
add constraint fk_customer_id
foreign key(customer_id) references customers(customer_id) 
on delete set null;

commit;

delete from customers
where customer_id = 4;

rollback;

alter table transactions drop foreign key fk_customer_id;

alter table transactions
add constraint fk_customer_id
foreign key(customer_id) references customers(customer_id) 
on delete cascade;

commit;

delete from customers
where customer_id = 4;

rollback;

set autocommit = on;