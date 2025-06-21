-- wild card characters % _
-- used to substitute one or more characters in a string

select * from employees
where first_name like "sp%";

select * from employees
where hire_date like "2023%";

select * from employees
where last_name like "%r";

select * from employees
where job like "_ook";

select * from employees
where hire_date like "____-__-02";

select * from employees
where job like "_a%"