create table nboard(
seqid number not null primary key,
title varchar2(100) not null,
pass varchar2(100) not null,
name varchar2(20),
hits number default 0,
content varchar2(4000),
rdate timestamp,	-- 등록일
udate timestamp		-- 변경일(최종일)
);

-- 1. 등록 처리 SQL 작성
insert into nboard(SEQID,TITLE,PASS,NAME,HITS,CONTENT,RDATE,UDATE)
values(nboard_seq.nextval,'abc1','1111','홍길동11','0','aaa11',sysdate,'');

insert into nboard(SEQID,TITLE,PASS,NAME,HITS,CONTENT,RDATE,UDATE)
values(nboard_seq.nextval,'abc2','1111','홍길동22','0','aaa11',sysdate,'');

insert into nboard(SEQID,TITLE,PASS,NAME,HITS,CONTENT,RDATE,UDATE)
values(nboard_seq.nextval,'abc3','1111','홍길동33','0','aaa11',sysdate,'');

insert into nboard(SEQID,TITLE,PASS,NAME,HITS,CONTENT,RDATE,UDATE)
values(nboard_seq.nextval,'abc4','1111','홍길동44','0','aaa11',sysdate,'');

insert into nboard(SEQID,TITLE,PASS,NAME,HITS,CONTENT,RDATE,UDATE)
values(nboard_seq.nextval,'abc5','1111','홍길동55','0','aaa11',sysdate,'');

insert into nboard(SEQID,TITLE,PASS,NAME,HITS,CONTENT,RDATE,UDATE)
values(nboard_seq.nextval,'abc6','1111','홍길동66','0','aaa11',sysdate,'');

insert into nboard(SEQID,TITLE,PASS,NAME,HITS,CONTENT,RDATE,UDATE)
values(nboard_seq.nextval,'abc7','1111','홍길동77','0','aaa11',sysdate,'');

insert into nboard(SEQID,TITLE,PASS,NAME,HITS,CONTENT,RDATE,UDATE)
values(nboard_seq.nextval,'abc8','1111','홍길동88','0','aaa11',sysdate,'');

insert into nboard(SEQID,TITLE,PASS,NAME,HITS,CONTENT,RDATE,UDATE)
values(nboard_seq.nextval,'abc9','1111','홍길동99','0','aaa11',sysdate,'');

insert into nboard(SEQID,TITLE,PASS,NAME,HITS,CONTENT,RDATE,UDATE)
values(nboard_seq.nextval,'abc10','1111','홍길동1010','0','aaa11',sysdate,'');

insert into nboard(SEQID,TITLE,PASS,NAME,HITS,CONTENT,RDATE,UDATE)
values(nboard_seq.nextval,'abc11','1111','홍길동1111','0','aaa11',sysdate,'');

insert into nboard(SEQID,TITLE,PASS,NAME,HITS,CONTENT,RDATE,UDATE)
values(nboard_seq.nextval,'abc12','1111','홍길동1212','0','aaa11',sysdate,'');

insert into nboard(SEQID,TITLE,PASS,NAME,HITS,CONTENT,RDATE,UDATE)
values(nboard_seq.nextval,'abc13','1111','홍길동1313','0','aaa11',sysdate,'');
-- --------------------------------------------------------------------
-- 2. 목록출력 SQL 작성 (최근 게시물 순으로 출력)
-- 번호(시퀀스), 제목, 글쓴이, 조회수, 등록일(년-월-일) 출력
SELECT  seqid
        ,title
        ,name
        ,hits
        ,to_char(rdate,'yyyy-mm-dd') rdate
FROM
        nboard
ORDER BY
        seqid DESC;
-- --------------------------------------------------------------------
-- 3. 상세출력 SQL 작성 (특정 seqid 값을 조건으로 한 출력)
-- 제목, 글쓴이, 내용, 조회수, 등록일, 변경일 출력
SELECT  title
        ,name
        ,content
        ,hits
        ,to_char(rdate,'yyyy-mm-dd') rdate
        ,to_char(udate,'yyyy-mm-dd') udate
FROM 
        nboard
WHERE
        seqid = 2;
-- --------------------------------------------------------------------
-- 4. 조회수 증가 SQL 작성 (특정 seqid 값을 설정하여 작성한다.)
UPDATE nboard SET hits = hits+1
WHERE seqid ='2';
-- --------------------------------------------------------------------
-- 5. 수정처리 SQL 작성 (seqid 값과 pass를 조건으로 한 수정 처리)
-- 제목, 글쓴이, 내용, 변경일
UPDATE  nboard
SET
        title = 'asas'      -- user
        ,name = 'may'       -- user
        ,content = 'ccc777' -- user
        ,udate = sysdate    -- system
WHERE
        seqid = '2'	        -- system
AND
        pass = '121212';  	-- user
-- --------------------------------------------------------------------
-- 6. 삭제처리 SQL 작성 (seqid 값과 pass를 조건으로 한 삭제 처리)
DELETE FROM nboard
WHERE seqid = '2'	-- system
  AND pass = '121212';	-- user
-- --------------------------------------------------------------------
-- 7. 목록출력 > 검색 SQL 작성 (특정 단어를 제목에서 찾는 설정으로 작성한다.)
SELECT	seqid
	,title
	,name
	,hits
	,to_char(rdate,'yyyy-mm-dd') rdate
FROM
	nboard
WHERE
	title LIKE '%html%'
ORDER BY
	seqid DESC;
-- --------------------------------------------------------------------   
-- 8. 목록출력 > 페이징 SQL 작성 (한 화면에 10개씩 보여주는 설정으로 2페이지를 설정한다.)
-- rownum 활용 범위 설정

SELECT b.*FROM (
    SELECT rownum rn, a.* FROM (
        SELECT	
            title
            ,name
            ,hits
            ,to_char(rdate,'yyyy-mm-dd') rdate
        FROM
            nboard
        ORDER BY
            seqid DESC )a ) b
WHERE 
    rn >= 1 and rn <=10;        -- 1페이지
    -- rn >= 11 and rn <=20;    -- 2페이지
    -- rn >= 21 and rn <=30;    -- 3페이지

-- 뷰 처리
create view v_nboradList as 
	SELECT b.*FROM (
		SELECT rownum rn, a.* FROM (
			SELECT	
			    title
			    ,name
			    ,hits
			    ,to_char(rdate,'yyyy-mm-dd') rdate
			FROM
			    nboard
			ORDER BY
			    seqid DESC )a ) b;
                
-- 뷰를 이용한 페이징 처리              
SELECT * FROM v_nboradList
WHERE 
    rn >= 1 and rn <=10;
