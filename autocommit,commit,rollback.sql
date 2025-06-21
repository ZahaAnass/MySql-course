select * from employees;
set autocommit = off;/*change methode of saving to typing commit to save a section*/
commit;/*checkpoint*/

delete from employees;

select * from employees;
rollback;/*return all data before the checkpoint*/
select * from employees;
set autocommit = on;