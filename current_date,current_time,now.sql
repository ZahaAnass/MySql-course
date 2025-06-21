/*create table test(
	my_date date,
    my_time time,
	my_datetime datetime
);*/

select * from test;
insert into test
values(current_date(), current_time(), now());/*you can add days by incremente current_date by +(some value)*/

select * from test;

drop table test;
