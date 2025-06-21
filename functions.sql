select count(amount) as "today's transactions" /*to rename the row*/
from transactions;/*to calculate the columns of propertie*/

select max(amount) as maximum /*to rename the row*/
from transactions;/*return the maximum columns of propertie*/

select min(amount) as minimum /*to rename the row*/
from transactions;/*return the minimum columns of propertie*/

select avg(amount) as average /*to rename the row*/
from transactions;/*return the average columns of propertie*/

select sum(amount) as sum /*to rename the row*/
from transactions;/*return the sum columns of propertie*/

select * from employees;

select concat(first_name, " ", last_name) as full_name from employees;/*to create a new row and match 2 properties*/

