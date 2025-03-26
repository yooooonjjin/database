create table popSeoul(
s1 varchar2(50),    -- 서울시(구)
s2 number,	    -- 전체(남)
s3 number,	    -- 전체(여)
s4 number,	    -- 한국(남)
s5 number,	    -- 한국(여)
s6 number,	    -- 와국(남)
s7 number,	    -- 외국(여)
s8 number           -- 고령자
);

comment on table popSeoul is '서울시 인구 테이블';
comment on column popSeoul.s1 is '서울시(구이름)';
comment on column popSeoul.s2 is '전체(남)';
comment on column popSeoul.s3 is '전체(여)';
comment on column popSeoul.s4 is '한국인(남)';
comment on column popSeoul.s5 is '한국인(여)';
comment on column popSeoul.s6 is '외국인(남)';
comment on column popSeoul.s7 is '외국인(여)';
comment on column popSeoul.s8 is '고령자';



select * from popSeoul;

-- (1) 전체 남자, 여자의 수
select  to_char(sum(s2),'FM999,999,999') 남
        ,to_char(sum(s3),'FM999,999,999,') 여
from
        popSeoul;
-- (2) 전체 인구 수
select sum(s2)+sum(s3) total from popSeoul;

-- (3) 남/여별로 인구수가 가장 많은 순으로 출력한다.
--     {구이름, 인구수(남)} -- 남자별 역순차적 적용
--     {구이름, 인구수(여)} -- 여자별 역순차적 적용

select s1,s2 from popSeoul order by s2 desc;	        -- 역순
select s1,s3 from popSeoul order by s3 desc;            -- 역순
select s1,(s2+s3) from popSeoul order by (s2+s3) desc;  -- 통합 역순

-- (4) 외국인이 가장 많이 사는 순으로 출력한다. - 남, 여 합계 -
select s1,(s6+s7) total from popSeoul order by (s6+s7) desc;

-- (5) 노령층이 가장 많이 사는 순으로 출력한다.
select s1,s8 노령층 from popSeoul order by s8 desc;

-- (6) 외국인이 가장 많이 사는 순으로 TOP3 출력한다.
select  s1,
        (s6+s7) total
from
        popSeoul
where
        rownum < 4
order by
        (s6+s7) desc;   -- 엉뚱한 값
-- -----------------------------------------------------
select rownum,a.* from (
select  s1
        ,(s6+s7) total
from
        popSeoul
order by
        (s6+s7) desc) a
where
       rownum < 4;
        
-- ---------------------------------------------------------------------------------------------------------------------------------------
select rownum,s1, s2 from popSeoul where rownum < 4;

select rownum, ename, job from emp;
select rownum, ename, job from emp where rownum < 5; -- 1 ~ 4
-- select rownum, ename, job from emp where rownum >= 5; (X)
-- 3 ~ 5
select * from(select rownum rn,ename, job from emp)
	where rn >= 3 and rn <= 5;
-- ---------------------------------------------------------------------------------------------------------------------------------------
-- (7) 전체 인구 수가 평균에 못미치는 데이터를 출력한다. {구이름, 인구수}
select avg(s2+s3) from popSeoul;    -- 401037.08

select  s1 구이름
        ,(s2+s3) 인구수
        ,(select avg(s2+s3) from popSeoul) 평균인구수
from
        popSeoul
where
        (s2+s3) >= (select avg(s2+s3) from popSeoul)
order by
        인구수 desc;

-- ---------------------------------------------------------------------------------------------------------------------------------------
-- 1. 구 이름별 출력
select b.* from (
    select rownum rn, a.* from(
        select * from popSeoul
            order by s1 asc) a ) b
where
        rn >= 6 and rn <= 10;
-- -----------------------------------------------------
-- 2. 인구수별 역순 정렬
select b.* from (
    select rownum rn, a.* from (
        select * from popSeoul
        order by (s2+s3) desc) a ) b;
-- -----------------------------------------------------







