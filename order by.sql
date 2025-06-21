select * from employees
order by last_name desc;/* asc for defult order and desc fro desanding order*/

select * from employees
order by first_name;

select * from employees
order by hire_date asc;

select * from transactions
order by amount asc, customer_id desc;/*when we have to equal value we can add an condition*/
