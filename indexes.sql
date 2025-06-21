-- INDEX (BTree data structure)
-- Indexes are used to find values within a specific column more quickly
-- MySQL normally searches sequentially though a column
-- The longer the column, the more expensive the operation is
-- UPDATE takes more time, SELECT takes less time

select * from transactions;

/*create index last_name_idx
on customers(last_name);*/

show indexes from customers;

select * from customers
where last_name = "Puff";

/*create index last_name_first_name_idx
on customers(last_name, first_name);*/

show indexes from customers;

alter table customers
drop index last_name_idx;

show indexes from customers;

select * from customers
where last_name = "Puff" and first_name = "Poppy";