-- 1. 등가 조인

-- (1) 사원 번호, 사원 이름, 부서 이름
select	empno
        ,ename
        ,dname
from
        emp, dept
where
        emp.deptno=dept.deptno;
-- ----------------------------------------------------
-- (2) 사원 번호, 사원 이름, 부서 이름, 부서 번호
select	empno
        ,ename
        ,dname
        ,emp.deptno
where
        emp.deptno=dept.deptno;
-- ----------------------------------------------------
-- (3) 사원 번호, 사원 이름, 부서 이름, 부서 번호
select	e.empno		empno
from
        emp, dept
        ,e.ename	ename
        ,d.dname	dname
        ,e.deptno	deptno
from
        emp e, dept d
where
        e.deptno=d.deptno;
-- ----------------------------------------------------
-- (4) 번외 ~~ (2중 SELECT)
-- -----------------------------------------------------------------------------------------  
-- 2. 비 등가 조인 - 사원 번호, 사원 이름, 급여, 등급

-- (1) 기본 설정
select	empno
        ,ename
        ,sal
        ,grade
from
        emp e, salgrade s
where
        e.sal >= s.losal
and
        e.sal <= s.hisal;
-- -------------------------------------------	
-- (2) between 설정
select	empno
        ,ename
        ,sal
        ,grade
from
        emp e, salgrade s
where
        e.sal between s.losal and s.hisal;   
-- -----------------------------------------------------------------------------------------  
-- { between ~ and } - 급여 1500 이상 ~ 2000 이하
select * from emp
where 
        sal between 1500 and 2000;
-- -------------------------------------------	
select * from emp
where 
        sal >= 1500
and
        sal <= 2000;  
-- -----------------------------------------------------------------------------------------  
-- { in } - 10번 부서나 20번 부서에서 근무하는 직원
select * from emp
where
        deptno in('10','20');
-- ----------------------------------------------------------------------------------------- 
-- 3. 아웃터 조인 (등가 조인 이외의 데이터까지 출력)

-- (1) 사원 번호, 사원 이름, 부서 이름, 부서 번호
select	e.empno		empno
        ,e.ename	ename
        ,d.dname	dname
        ,e.deptno	deptno
from
        emp e, dept d
where
        -- 조인 조건에 부합되지 않은 데이터까지 출력하는 기호임 "+"
        e.deptno=d.deptno(+); 
        -- e.deptno(+)=d.deptno;
        -- e.deptno(+)=d.deptno(+); -- error   
-- -----------------------------------------------------------------------------------------
-- 4. 셀프 조인

-- (1) 사원 번호, 사원 이름, 매니져 번호, 매니져 이름
select	e1.empno	empno
        ,e1.ename	ename
        ,e1.mgr		mgr
        ,e2.ename	mgrname
from
        emp e1, emp e2
where
        e1.mgr = e2.empno;
