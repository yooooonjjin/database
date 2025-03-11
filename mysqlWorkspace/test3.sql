create table sports(code int, name varchar(10) );

insert into sports (code, name) values(101,'축구');
insert into sports (code, name) values(102,'야구');
insert into sports (code, name) values(103,'배구');

select * from sports;
-- select code,name from sports;

set sql_safe_updates = 0;
update sports set name='마라톤' where code=101;

delete from sports where code=101;

