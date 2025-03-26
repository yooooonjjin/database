-- 시퀀스 생성
create sequence masale_seq
start with 1
increment by 1
maxvalue 999999;

-- 테이블 생성
create table mysale(
seqid number not null primary key,
code varchar2(50) not null,
subject varchar2(100) not null,
price number default 0,
saledt timestamp
);


insert into mysale( SEQID
                    ,CODE
                    ,SUBJECT
                    ,PRICE
                    ,SALEDT)
            values( masale_seq.nextval
                    ,'a101'
                    ,'java책'
                    ,'5000'
                    ,sysdate
            );

insert into mysale( SEQID
                    ,CODE
                    ,SUBJECT
                    ,PRICE
                    ,SALEDT)
            values( masale_seq.nextval
                    ,'a102'
                    ,'html책'
                    ,''
                    ,sysdate
            );

insert into mysale( SEQID
                    ,CODE
                    ,SUBJECT
                    ,PRICE
                    ,SALEDT)
            values( masale_seq.nextval
                    ,'a103'
                    ,'리눅스책'
                    ,'1500'
                    ,sysdate
            );
            
-- commit;

-- 출력
--(1)
SELECT	SEQID		SEQID
        ,CODE		CODE
        ,SUBJECT	SUBJECT
        ,PRICE		PRICE
        ,to_char(SALEDT,'yyyy-mm-dd')		SALEDT
FROM
	mysale;

--(2)
SELECT	SEQID				아이디
        ,CODE				상품명
        ,nvl2(PRICE,'미결재','결재완료')	결재여부
        -- NVL2(데이터값, 널값이아닌경우, 널값인경우)
FROM
	mysale;
















