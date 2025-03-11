select substring('academy',1,3);	-- 1번부터 3개
select substring('academy',2,3);	-- 2번부터 3개
select substring('academy',5,3);	-- 5번부터 3개

select left('academy',4);			-- 좌측 기준으로 4개 잘라내기
select right('academy',4);			-- 우측 기준으로 4개 잘라내기

select concat('my','sql');
select concat('html','을 배우고 있습니다.');
select concat('10+20=',(10+20));

select length('html');

select lpad('mysql',7,'*');			-- (데이터값, 출력길이, 채울값) , 남는 공간이 왼쪽에 채워짐
select rpad('mysql',7,'*');			-- (데이터값, 출력길이, 채울값) , 남는 공간이 오른쪽에 채워짐
select rpad('901225-',14,'*');

select md5('123456');				-- 암호화

select lcase('MySQL');				-- 대문자 -> 소문자
select ucase('MySQL');				-- 소문자 -> 대문자

-- java : Math.abs(-100)
select abs(-100);					-- 부호를 없애는 함수

-- java : Math.min(30,20)			-- java는 두개의 값만 비교 가능
select least(30,20,100,3);			-- 가장 작은 값 리턴

select greatest(30,20,100,3);		-- 가장 큰 값 리턴

select round(1.58);					-- 2 (반올림 함수)
select ceil(1.001);					-- 2 (올림 함수)

select floor(1.001);				-- 1

select 35/10;						-- 3.5
select 35%10;						-- 5 (나눈 나머지 값)
select mod(35,10);					-- 5 (나눈 나머지 값)
