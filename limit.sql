-- Limit clause is used to limit the number of records.
-- Useful if you're working with a lot of data.
-- Can be used to display a large data on pages (pagination).

select * from customers
limit 2 ;/*give you the first 2 customers*/

select * from customers
order by last_name desc limit 1;

select * from customers
limit 1, 2;/*display 2 property after the property 1*/

 