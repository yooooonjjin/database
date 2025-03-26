create table member1 (
seqid number primary key		-- 중복방지, not null(내장o)
,userid varchar2(50) not null unique	-- 중복방지, not null(내장x)
,pass varchar2(100) not null
,name varchar2(50) not null
,gender char(1) check(gender in('M','F'))
,birth date default '1900-01-01'
,regdt timestamp
);
-- ---------------------------------------------------
comment on table member1 is '회원정보테이블1';
comment on column member1.seqid is '고유번호';
comment on column member1.userid is '사용자ID';
comment on column member1.pass is '비밀번호';
comment on column member1.name is '이름';
comment on column member1.gender is '성별';
comment on column member1.birth is '생년월일';
-- -----------------------------------------------------------------------------------------------------
create table member2 (
seqid number,			        -- primary key
userid varchar2(50) not null,	-- unique
pass varchar2(100) not null,
name varchar2(50),
gender char(1),		            -- check
birth date default '1900-01-01',
regdt timestamp,
-- (제약조건 키워드)(제약조건 별칭)(제약조건 이름)
constraint member2_seqid_pk primary key(seqid),
constraint member2_userid_un unique(userid),
constraint member2_gender_ck check(gender in('M','F'))
);
-- ---------------------------------------------------
insert into member2 values('1','test1','1234','테스트1','M','2000-05-05',sysdate);
insert into member2 values('2','test2','1234','테스트2','F','2000-07-05',sysdate);
-- 고유번호 중복 시 오류 메세지
-- 무결성 제약 조건(C##JAVA.MEMBER2_SEQID_PK)에 위배됩니다
-- insert into member2 values('1','test2','1234','테스트2','F','2000-07-05',sysdate);

-- 사용자ID 공백 시 오류 메세지
-- NULL을 ("C##JAVA"."MEMBER2"."SEQID") 안에 삽입할 수 없습니다
-- insert into member2 values('','test2','1234','테스트2','F','2000-07-05',sysdate);

-- 암호 공백 시 오류 메세지
--NULL을 ("C##JAVA"."MEMBER2"."PASS") 안에 삽입할 수 없습니다
-- insert into member2 values('2','test2','','테스트2','F','2000-07-05',sysdate);

-- 성별에 다른 값을 넣는 경우 메세지
-- 체크 제약조건(C##JAVA.MEMBER2_GENDER_CK)이 위배되었습니다
-- insert into member2 values('2','test2','1234','테스트2','A','2000-07-05',sysdate);

insert into member2(SEQID,USERID,PASS,NAME,GENDER,BIRTH,REGDT)
values('3','test3','1111','테스트3','F','',sysdate);

insert into member2(SEQID,USERID,PASS,NAME,GENDER,BIRTH,REGDT)
values('4','test4','1111','테스트4','F','',sysdate);
-- -----------------------------------------------------------------------------------------------------
create table jumsu (
seqid number not null,
eng number,
kor number,
p_userid varchar2(50) not null,
constraint jumsu_fk foreign key (p_userid)
                    references member2(userid)
);

create table jumsu3 (
seqid number not null,
eng number,
kor number,
p_seqid number not null,
constraint jumsu3_fk foreign key (p_seqid)
                    references member2(seqid)
);
-- ---------------------------------------------------
-- 같은 이름의 별칭을 사용하지 못함
-- 기존의 제약에 사용된 이름입니다
/*
create table jumsu4 (
seqid number not null,
eng number,
kor number,
p_seqid number not null,
constraint jumsu3_fk foreign key (p_seqid)
                    references member2(seqid)
);
*/
-- ---------------------------------------------------
create table jumsu4 (
seqid number not null,
eng number,
kor number,
p_seqid number not null,
constraint jumsu4_fk foreign key (p_seqid)
                    references member2(seqid)
);
-- ---------------------------------------------------
-- 즉, 고유값 설정의 컬럼이 아닌 경우 오류 발생
-- 이 열목록에 대해 일치하는 고유 또는 기본 키가 없습니다.
/*
create table jumsu5 (
seqid number not null,
eng number,
kor number,
p_name varchar2(50) not null,
constraint jumsu5_fk foreign key (p_name)
                    references member2(name)
);
*/
-- ---------------------------------------------------
insert into jumsu values ('1','90','80','test1');   -- 입력 성공
insert into jumsu values ('1','90','80','test11');  -- 입력 실패 (부모 키가 없습니다)

insert into jumsu values ('2','80','70','test2');   -- 입력 성공
insert into jumsu values ('3','50','30','test2');   -- 입력 성공
insert into jumsu values ('4','67','45','test2');   -- 입력 성공

-- { 데이터 삭제 }
-- (실습 1) 부모 테이블의 데이터를 삭제 시도 (자식 데이터가 있는 경우)
delete from member2 where userid = 'test1';     -- 실패(자식 레코드가 발견되었습니다)

-- (실습 2) 부모 테이블의 데이터를 삭제 시도 (자식 데이터가 없는 경우)
delete from member2 where userid = 'test3';     -- 성공 (자식 레코드가 없음)

-- (실습 3) 부모 테이블에 데이터를 삭제 시도 (자식 데이터가 있는 경우)
-- (1) 자식 테이블의 레코드를 먼저 삭제 / 부모 테이블의 레코드 삭제 시도












