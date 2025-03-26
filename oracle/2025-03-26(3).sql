-- (Q1) 부서별 사원수 조회
-- (1)
select  deptno      부서번호
        ,count(*)   사원수
from
        emp
group by
        deptno;
--(2) 부서 지정이 안되어있는 사원들은 제외 (부서번호가 null로 되어있음)
select  deptno      부서번호
        ,count(*)   사원수
from
        emp
where
        deptno is not null
group by
        deptno;
-- -------------------------------------------------------------
-- (Q2) 부서별 사원수 급여평균 급여합계 출력
     -- decode(데이터값,비교값,결과값,비교값,결과값,기타)
select  decode(deptno,null,'수습',deptno) 부서번호
        ,count(*)                        사원수
        ,round(avg(sal))                 급여평균
        ,sum(sal)		                 급여합계
from
        emp
group by
        deptno;
-- -------------------------------------------------------------
-- (Q3) 사원수가 5명이 넘는 부서명과 사원수를 출력한다.
select	deptno		부서번호
        ,count(*)	사원수
from
        emp
group by
        deptno
having count(*) >= 5;
-- -------------------------------------------------------------
-- (Q4) 부서별 최저급여를 출력하시오.
select  deptno      부서번호
        ,min(sal)	최저급여
from
        emp
where
        deptno is not null
group by deptno;
-- -------------------------------------------------------------
-- (Q5) 직원들의 나이를 출력한다.
--      사원명 / 업무 / 나이 / 급여