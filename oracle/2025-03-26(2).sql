-- (1) 급여 합계 / 평균
select sum(sal) from emp;
select avg(sal) from emp;
-- ----------------------------------------------------------------------------------------------------------------------
-- (2) 부서별 합계 출력
select
	(select sum(sal) from emp where deptno = 10) "10번 부서"   -- 부서번호 10번
    ,(select sum(sal) from emp where deptno = 20) "20번 부서"  -- 부서번호 20번
from
    dual;
-- 10번부서 20번부서
--  7120    4500
-- ----------------------------------------------------------------------------------------------------------------------
-- (3) 부서별 합계 출력 (레코드 형식의 출력 - UNION 사용)
select 10 deptno, sum(sal) from emp where deptno=10
union
select 20 deptno, sum(sal) from emp where deptno=20
union
select 30 deptno, sum(sal) from emp where deptno=30
union
select 40 deptno, sum(sal) from emp where deptno=40;
-- ----------------------------------------------------------------------------------------------------------------------
-- (4) 부서별 합계 출력 (레코드 형식의 출력 - GROUP BY 사용)
-- select deptno, sum(sal) from emp;			- error
-- ----------------------------------------------------------------------------------------------------------------------
-- (5) 부서번호를 그룹으로 만들어서 부서번호와 급여 합계를 출력한다.
select  deptno, sum(sal) from emp group by deptno;	
select deptno, sum(sal), avg(sal) from emp group by deptno;
-- ----------------------------------------------------------------------------------------------------------------------
-- (6) 정상 출력
select  deptno              부서번호
        ,sum(sal)           급여합계
        ,round(avg(sal),2)  급여평균
        ,max(sal)           최고급여
        ,min(sal)           최저급여
from
        emp
group by
        deptno
order by
        deptno asc; -- 순차적 정렬, 올림차순
-- ----------------------------------------------------------------------------------------------------------------------
-- (7) 오류사항 (1) group by 와 order by의 순서 바뀌면 오류
select  deptno              부서번호
        ,sum(sal)           급여합계
        ,round(avg(sal),2)  급여평균
        ,max(sal)           최고급여
        ,min(sal)           최저급여
from
        emp
order by
        deptno asc	-- 순차적 정렬, 올림차순
group by
        deptno;
-- ----------------------------------------------------------------------------------------------------------------------
-- (8) 그룹 묶음의 주최 컬럼 이외에는 출력 불가
select  empno			사원번호 -- error	
	,deptno			부서번호
        ,sum(sal)		급여합계
        ,round(avg(sal),2)	급여평균
        ,max(sal)		최고급여
        ,min(sal)		최저급여
from
        emp
group by
        deptno
order by
        deptno asc;
-- ----------------------------------------------------------------------------------------------------------------------        
-- (9) 부서별 그룹 후 평균이 500 이상인 부서들만 출력     == 정상 출력 ==
select	deptno			    부서번호
        ,round(avg(sal),2)	급여평균
from
        emp
group by
        deptno
having  -- 그룹에 대한 조건식
        avg(sal) >= 500;
-- ----------------------------------------------------------------------------------------------------------------------        
-- (10) == 잘못된 사례 ==
/*
select	deptno			    부서번호
        ,round(avg(sal),2)	급여평균
from
        emp
group by
        deptno
where
        avg(sal) >= 500;
*/
-- -------------------------------------------------------------
-- (11) == 잘못된 사례 == 그룹 함수는 허가되지 않습니다
/*
select	deptno			    부서번호
        ,round(avg(sal),2)	급여평균
from
        emp
where
        avg(sal) >= 500 -- where 조건에 그룹함수 사용 불가
group by
        deptno;
*/
-- ----------------------------------------------------------------------------------------------------------------------
-- (12) 
select	deptno			    부서번호
        ,round(avg(sal),2)	급여평균
from
        emp
where
        sal >= 1000     -- 1번째 해석 : 전직원에서 1000만원 이상만 추려냄
group by                -- 2번째 해석 : 1000만원 이상의 직원들에서 그룹으로 묶음
        deptno;
        
-- ======================================================================================================================

-- 2. 업무별 그룹화

--(1) 업무별 급여합계
select	job		    업무명
        ,sum(sal)	급여합계
        ,max(sal)   최고급여
        ,min(sal)   최저급여
        ,count(*)   인원수
from
        emp
group by job;

-- ======================================================================================================================
-- (1)
select avg(sal) from emp group by deptno;
-- (2)
select min(avg(sal)) from emp group by deptno;

-- (3)
select  empno
        ,ename
        ,sal
from
        emp
where 
        sal <= 250;
        
        




