/*create table transactions(
	transaction_id int primary key,
    amount decimal(5, 2)
);*/
#alter table transactions add constraint primary key(transaction_id);/*if you want to add pk to an existing table*/

insert into transactions
values (1000, 4.99),
	   (1001, 2.89),
       (1002, 3.38),
	   (1003, 4.99);
	
select amount
from transactions
where transaction_id = 1003;

select * from transactions;