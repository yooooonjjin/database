-- 테이블 생성 명령어 : create table 테이블명( 컬럼들 세팅 )
create table mycolor( name varchar(10) );
-- 테이블 출력 : select 컬럼명 from 테이블명;
select * from mycolor;
-- 데이터 입력 : insert into 테이블명(컬럼명) values(데이터값)
insert into mycolor(name) values('노랑');

select name from mycolor;

-- 구조 확인 --
desc mycolor;

-- 구조 변경 --
alter table mycolor add memo varchar(100);		-- 컬럼 추가
alter table mycolor modify name varchar(50);	-- 컬럼 변경
alter table mycolor drop memo;					-- 컬럼 삭제

select * from mycolor;
truncate mycolor;								-- 모든 데이터 삭제
drop table mycolor;