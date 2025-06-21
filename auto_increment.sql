#drop table transactions;

/*create table transactions (
	transaction_id int primary key auto_increment,#by default start with 1
    amount decimal (5, 2)
);

insert into transactions (amount)
values (4.99),(2.99),(3.38),(4.99);*/

alter table transactions auto_increment = 1000;#to set dafault value of increment

delete from transactions;

insert into transactions (amount)
values (4.99),(2.99),(3.38),(4.99);

select * from transactions;
