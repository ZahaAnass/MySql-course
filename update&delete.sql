/*SET SQL_SAFE_UPDATES = 0;*//*set 0 to disable safe mode and 1 to enable safe mode*/

SELECT * FROM employees;

UPDATE employees 
SET hourly_pay = 20.00, 
    hire_date = '2023-01-07', 
    first_name = "Sheldon"
WHERE employee_id = 3;/*this methode is to select a specefic element*/
/*set hourly_pay = 10.25*//*this methode is for change value of all rows*/
SELECT * FROM employees;

delete from employees /*be shure don't forget to select a row*/
where employee_id = 3;/*delete a specefic row*/
select * from employees;

