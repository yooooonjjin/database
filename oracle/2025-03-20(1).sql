-- (1)
select max(sal), min(sal) from emp;
select count(*), max(sal), min(sal) from emp;
select distinct(job) from emp where job != 'PRESIDENT';

-- (2),(3)
select	sum(sal) sum
		,round(avg(sal),2) avgSal
		,max(sal) maxSal
		,min(sal) minSal
from
		emp;

-- (4)
select	sum(sal) sum
		,round(avg(sal),2) avgSal
		,ceil(avg(sal)) ceiSal
		,floor(avg(sal)) floorSal
		,max(sal) maxSal
		,min(sal) minSal
from
		emp;

-- (5)
select	sum(comm)
		,avg(comm)
from
		emp;

-- (6)
select count(*) from emp;

-- (7)


-- {풀어보기}
-- (1) 사장님 제외
select max(sal) from emp where deptno = '10' and job != 'PRESIDENT';
-- (2)
select * from emp
    where sal >= 1000 and sal <= 2000;
-- (3)
select * from emp
    where deptno = '10' or deptno = '20';
select * from emp
    where deptno in (10,20);
-- (4)
select * from emp where mgr = '7566';
select * from emp where mgr in ('7566');
-- (5)
select count(*) from emp where job = 'ANALYST';
select count(*) from emp where upper(job) = upper('ANALYst');  -- 소문자 -> 대문자로 변경
-- (6), (7)
select  ename
        ,to_char(hiredate,'yyyy/mm/dd') as hiredate
from
        emp
where
        to_number(to_char(hiredate,'yyyy')) >= 2000;












