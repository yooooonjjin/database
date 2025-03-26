create table roominfo(
rno number primary key, 
ras varchar2(50),
rprc number default 50000 not null, -- 원
rsiz number default 15			    -- 평수
);

insert into roominfo values(1001,'별사랑방','150000',15);
insert into roominfo values(1002,'달이야기','200000',20);
insert into roominfo values(1003,'바다뷰','300000',30);
insert into roominfo values(1004,'산뷰','150000',15);
-- -----------------------------------------------------------------------------
create table resinfo(
resno number primary key,		    -- 10001
rno number not null,
sdt date,
edt date,
usrid varchar2(50) not null,
pay char(1) default 'N',
constraint resinfo_fk foreign key(rno)
    references roominfo(rno),
constraint resinfo_ck check(pay in('Y','N'))	
);
-- -----------------------------------------------------------------------------
create table p_member(
usrid varchar2(50) primary key,
pass varchar2(100) not null,
name varchar2(50),
phone varchar2(50) not null,
regdt date
);

insert into p_member values('a1','1111','홍길동','010-7777-8888','2025-03-21');
insert into p_member values('a2','121212','손흥민','010-2222-8888','2025-03-23');
insert into p_member values('a3','56565','차범근','010-7775-4556','2025-03-25');

-- -----------------------------------------------------------------------------------------------------------------------------------------
-- 1. 각 테이블들의 기본 출력
select	rno 	rno
        ,ras	ras
        ,rprc	rprc
        ,rsiz	rsiz
from
        roominfo;
    
-- --------------------------------------------------
select	resno			            resno
        ,rno			            rno
        ,to_char(sdt,'yyyy-mm-dd')  sdt
        ,to_char(edt,'yyyy-mm-dd')  edt
        ,usrid			            usrid
from
	resinfo;
-- --------------------------------------------------
select	usrid	                        usrid
        ,pass	                        pass
        ,name	                        name
        ,phone	                        phone
        ,to_char(regdt,'yyyy-mm-dd')    regdt
from
        p_member;
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- 2. 방번호 / 입실일(년-월-일) / 퇴실일(년-월-일) / 사용자ID
select  rno                         rno
        ,to_char(sdt,'yyyy-mm-dd')  sdt
        ,to_char(edt,'yyyy-mm-dd')  edt
        ,usrid                      usrid
from
        resinfo;
        
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- 3. 예약번호 / 방번호 / 방가격 / 입실일(년-월-일) / 퇴실일(년-월-일) / 사용자ID	- 조인       
select	s.resno                             resno
        ,s.rno                              rno
        ,to_char(m.rprc,'FM999,999,999')    rprc
        ,to_char(s.sdt,'yyyy-mm-dd')        sdt
        ,to_char(s.edt,'yyyy-mm-dd')        edt
        ,s.usrid                            usrid
from    
        resinfo s, roominfo m
where
        s.rno = m.rno;        
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- 4. 예약번호 / 입실일(년-월-일) / 퇴실일(년-월-일) / 사용자ID / 연락처  - 조인
select	s.resno				            resno
        ,to_char(s.sdt,'yyyy-mm-dd')    sdt
        ,to_char(s.edt,'yyyy-mm-dd')    edt
        ,s.usrid                        usrid
        ,p.phone			            phone	
from    
        resinfo s, p_member p
where
        s.usrid = p.usrid;
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- 5. 예약번호 / 입실일(년-월-일) / 퇴실일(년-월-일) / 사용자ID    - 작년에 등록한 정보      
select	resno				        resno
        ,to_char(sdt,'yyyy-mm-dd')	sdt
        ,to_char(edt,'yyyy-mm-dd')	edt
        ,usrid				        usrid
from
        resinfo
where
        to_char(sdt,'yyyy') = (to_char(sysdate,'yyyy')-1);
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- 6. 예약번호 / 입실일(년-월-일) / 퇴실일(년-월-일) / 결재여부(결재완료/미결재)
select	resno				                        resno
        ,to_char(sdt,'yyyy-mm-dd')	                sdt
        ,to_char(edt,'yyyy-mm-dd')	                edt
        ,usrid				                        usrid
        ,decode(pay,'Y','결재완료','N','미결재','x')	pay
from
	resinfo;