-- (1)
desc emp;
-- (2)
select count(*) from emp;
-- (3)
select * from emp where deptno = 10;
-- (4)
select * from emp where sal >= 1500;
-- (5)
select grade ||'등급' from salgrade
                        where losal <= 1500
                        and hisal >= 1500;
-- (6)
select * from emp
        where job != 'PRESIDENT'
        and mgr is null;
        
-- (7)
-- abcdef -> ab**** --> 'ab'||'****'
-- rpad('ab',6,'*') -> ab****

select 
    -- substr(ename,1,2)||'**' as ename
    -- substr( ename,1,2 )||
    rpad( substr(ename,1,2),length(ename),'*' )
from
    emp;
    




