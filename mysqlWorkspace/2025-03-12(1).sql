/*
create table typeTest (
a1 char(20),				-- 고정 길이 : 고정 크기 설정 - 작은 데이터 입력 시에도 설정 크기가 그대로 세팅됨

a2 varchar(20),				-- 회원 아이디 ( 6 ~ 20 )
							-- 가변 길이 : 최대 크기 설정 - 작은 데이터 입력 시에 그 크기만큼 공간이 확보됨
							-- 최대 공간 크기 : 65300
							-- 5.x 버전 : 255(최대), 8.x 버전 : 65,000
                                    
a3 text,					-- 가변 길이 : 65300으로 크기가 고정됨
a4 tinyint,					-- -128 ~ 127
a5 int,
a6 double,
a7 date,
a8 datetime,
a9 enum('M','F'),			-- 혼합 설정 불가
a10 set('a','b','c','d')	-- 혼합 설정 가능
);
*/
-- (1)
insert into typeTest values ('aa1', 'aa2', 'aa3', 10, 10, 10, '2025-03-12', '2025-03-12 10:35:30', 'M', 'a');
select * from typeTest;

insert into typeTest values ('aa1', 'aa2', 'aa3', 127, 300, 10.123, '2025/03/12', '2025-03-12', 'F', 'b');
select * from typeTest;

-- 테이블 구조 변경
alter table typeTest modify a1 char(5);
alter table typeTest modify a2 varchar(5);

-- 오류 발생 : 문자 타입의 최대 크기를 벗어남
/*
insert into typeTest values ('1234567', 'abcdef', 'aa3', 127, 300, 10.123, '2025/03/12', '2025-03-12', 'F', 'b');
select * from typeTest;
*/

-- 정상 입력
insert into typeTest values ('12345', 'abcde', 'aa3', 127, 300, 10.123, '2025/03/12', '2025-03-12', 'F', 'b');
select * from typeTest;

-- 정상 입력 : 정수 타입에 실수값을 넣었을 경우 (자동)정수형으로 변환됨
insert into typeTest values ('444', 'nnn', 'aa33', 88.123, 77.123, 77.123, '2025-03-12', '2025-03-12', 'F', 'A');
select * from typeTest;

--  오류
insert into typeTest values ('444', 'nnn', 'aa33', 88.123, 77.123, 77.123, '2025-03-12', '2025-03-12', 'M,F', 'a,b');
select * from typeTest;

-- 정상 입력
insert into typeTest values ('444', 'nnn', 'aa33', 88.123, 77.123, 77.123, '2025-03-12', '2025-03-12', 'M', 'a,b,c,d');
select * from typeTest;

-- 오류
insert into typeTest values ('444', 'nnn', 'aa33', 88.123, 77.123, 77.123, '2025-03-12', '2025-03-12', 'M', 'a,b,c,d,f');
select * from typeTest;

-- delete from typeTest;
-- select * from typeTest; 