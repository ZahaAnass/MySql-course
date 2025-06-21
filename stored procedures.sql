-- use company;
-- Stored procedure = is prepared SQL code that you can save
--                    great if there's a query that you write often
					  -- reduces network traffic
					  -- increases performance
					  -- secure, admin can grant permission to use
					  -- increases memory usage of every connection

delimiter $$
create procedure get_customers()
begin
	select * from customers;
end $$
delimiter ;

call get_customers();

drop procedure get_customers;

delimiter $$
create procedure find_customer(in id int)/*procedure_name(in parametre data_type)*/ 
begin
	select * from customers 
    where customer_id = id;
end $$
delimiter ;

call find_customer(3);

drop procedure find_customer;

delimiter $$
create procedure find_customer(in f_name varchar(50), in l_name varchar(50))
begin
	select * from customers
    where first_name = f_name and last_name = l_name;
end $$
delimiter ;

call find_customer("Larry", "Lobster");

drop procedure find_customer;