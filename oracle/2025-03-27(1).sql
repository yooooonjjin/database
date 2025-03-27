-- emp - (null 출력 제외)
-- 1. 부서명 / 평균급여 >> 부서번호가 아닌 부서명을 출력한다.
select	ename     사원이름
        ,dname    부서명
        ,sal      급여
from
        emp e, dept d
where
        e.deptno = d.deptno;
-- -----------------------------------------
select	dname		        부서명
        ,round(avg(sal))	평균급여
from
        emp e, dept d
where
        e.deptno = d.deptno
group by
        dname;
-- -----------------------------------------
select	dname			부서명
        ,round(avg(sal))	평균급여
from
        emp e, dept d
where
        e.deptno = d.deptno
group by
        dname
order by
        avg(sal);		-- asc 생략됨, 순차적 정렬 (오름차순 정렬)
-- ---------------------------------------------------------------------------------
-- 2. 입사년도 / 사원수 >> 입사년도별로 그룹화를 하여 사원수를 출력한다.
select	to_char(hiredate,'yyyy')	입사년도
        ,count(*)			사원수
from
        emp
group by
        to_char(hiredate,'yyyy')
order by
        to_char(hiredate,'yyyy');	-- asc 생략됨, 순차적 정렬 (오름차순 정렬)
-- -----------------------------------------
select	to_char(hiredate,'yyyy')	입사년도
        ,count(*)			사원수
from
        emp
group by
        to_char(hiredate,'yyyy')
having
        to_char(hiredate,'yyyy') >= 2000
order by
        입사년도;
-- ---------------------------------------------------------------------------------
-- 3. 매니져명 / 사원수 >> 매니져별로 그룹화를 하여 관리하는 사원수를 출력한다.
select	e1.empno	사원번호
        ,e1.ename	사원이름
        ,e1.mgr		매니저번호
        ,e2.ename	매니저이름
from
        emp e1, emp e2
where
        e1.mgr = e2.empno;
-- -----------------------------------------
select	e2.ename	매니저이름
        ,count(*)	사원수
from
        emp e1, emp e2
group by
        e2.ename
order by
        매니저이름;

-- ---------------------------------------------------------------------------------
-- post 테이블
-- 1. 서울특별시에 각 구들을 출력한다.
select * from post1
where
        p2 like '%서울%';
-- -----------------------------------------
select distinct(p3)
from
        post1
where
        p2 like '%서울%';
-- -----------------------------------------
select	p3
from
        post1
where
        p2 like '%서울%'
group by
        p3;
-- ---------------------------------------------------------------------------------
-- 2. 서울특별시에 각 구들의 하위 동의 개수를 출력한다.
select	p3
        ,count(*)
from
        post1
where
        p2 like '%서울%'
group by
        p3;
-- ---------------------------------------------------------------------------------	
-- 3. 서울특별시의 중구에 하위 동들을 출력한다.
-- ---------------------------------------------------------------------------------
--  구리시
select  p4          동이름
        ,count(*)   주소개수
from
        post1
where
        p3 = '구리시'
group by
        p4
having
        p4 is not null
order by
        주소개수;
-- ---------------------------------------------------------------------------------
-- resinfo 테이블
-- 1. 각 사용자들의 예약 건수를 출력한다.
select	usrid       사용자
        ,count(*)   예약건수
from
        resinfo
group by
        usrid;
-- ---------------------------------------------------------------------------------
-- 2. 각 사용자들의 예약 건수를 출력한다. - 단, 2024년도만 -
select	usrid       사용자
        ,count(*)   예약건수
from
        resinfo
where	
        to_char(sdt,'yyyy') = 2024
group by
        usrid;



