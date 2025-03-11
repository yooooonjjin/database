-- 테이블 생성
/*
create table bookInfo (
code int,
title varchar(100),
writer varchar(50),
price int,
maker varchar(50)
);
-- 구조 확인
desc bookInfo;
*/

insert into bookInfo(code, title, writer, price, maker)
			values('1','java1교재','홍길동','35000','영진');

-- 빈 데이터는 공백이 채워짐
insert into bookInfo(code, title, writer, price, maker)
			values('2','java2교재','홍길동','.38000','');
		
-- 세팅이 안된 컬럼에는  null값이 채워짐
insert into bookInfo(code, title, writer)
			values('3','mysql교재','이순신');

--  컬럼세팅 생략 가능 --> 단, 모든 데이터 삽입에 대한 조건 
insert into bookInfo
			values('4','linux 첫걸음','리눅이','50000','한빛');		-- OK

-- 모둔 데이터 삽입에 대한 조건에 부합되지 않음
insert into bookInfo
			values('5','html 첫걸음','손코딩');						-- 오류

-- 숫자 타입의 데이터 값 생략 불가 (기본으로 0 채우기 가능)
insert into bookInfo(code, title, writer, price, maker)
			values('6','java1교재','','','영진');					-- 오류

-- 문자 타입의 데이터는 반드시 홑따옴표 표기를 해야함
insert into bookInfo(code, title, writer, maker)
			values('7','스프링책','봄봄','영진');					-- 오류

select * from bookInfo;

-- [ count 함수 ]
-- 행(row,레코드)의 개수를 얻어주는 함수
-- 전체 데이터 개수 확인
select count(*) from bookInfo;			-- 6

-- { 코드 } 컬럼의 데이터 개수 확인
select count(code) from bookInfo;		-- 6

-- { 글쓴이 } 컬럼의 데이터 개수 확인, 공백을 개수에 포함
select count(writer) from bookInfo;		-- 6

-- { 가격 } 컬럼의 데이터 개수 확인, null값은 수량에서 제외
select count(price) from bookInfo;		-- 4

-- { 메이커 } 컬럼의 데이터 개수 확인, 공백은 포함, null값은 수량에서 제외
select count(maker) from bookInfo;		-- 5

-- select count(code, maker) from bookInfo;	-- 오류 (복수 세팅 불가능)

-- { 풀어보기 }

-- 1. 'linux의 첫걸음'으로 제목이 되어있는 레코드 출력
select * from bookInfo where title = 'linux 첫걸음';
-- 1-1. 지은이가 '리눅이'로 되어있는 레코드 출력
select * from bookInfo where writer = '리눅이';

-- 2. maker에서 공백인 데이터 출력
select * from bookInfo where maker = '';		-- null값은 안나옴

-- 3. maker가 null값인 데이터 출력	
select * from bookInfo where maker = 'null';	-- 안나옴
select * from bookInfo where maker = null;		-- 안나옴
select * from bookInfo where maker is null;		-- 출력(o)
-- 3-1. price에서 null값인 데이터 출력
select * from bookInfo where price is null;	
-- 3-2. price에서 null값이 아닌 데이터 출력
select * from bookInfo where price is not null;

-- 4. maker에서 완전한 데이터들만 출력 (null값도 아니고 공백도 아니고)
select * from bookInfo where maker != '' and maker is not null;
-- 4-1. maker + price에서 완전 데이터들만 출력
select * from bookInfo
	where maker != ''
    and maker is not null
    and price is not null;

-- 5. price가 null로 되어있는 데이터의 값으로 0을 세팅한다.
update bookInfo set price = 0 where price is null;
select * from bookInfo;

-- 6. maker가 null로 되어있는 데이터의 값으로 '하이미디어'로 세팅
update bookInfo set maker = '하이미디어' where maker is null;
select * from bookInfo;
select count(*) from bookInfo where maker is null;		-- 0

-- sum() 함수 : 컬럼(세로)합계, avg() 함수
-- *** 가격의 합계와 평균 ***

select sum(price) from bookInfo;
select avg(price) from bookInfo;
 select sum(price),avg(price) from bookInfo;

update bookInfo set price=null where code = 7;
select * from bookInfo;

-- -----------------------------------------

-- 1. 영진 출판사가 몇개가 있는지 출력
select count(*) from bookInfo where maker = '영진';

-- 2. "linux 첫걸음 교재의 가격은 50000원 입니다." 형식으로 출력
select concat(title,' 교재의 가격은 ',price,'원 입니다.') from bookInfo where title = 'linux 첫걸음';

-- 3. "linux 첫걸음(9)" 형식으로 출력
select concat(title,'(', length(title),')') from bookInfo;


