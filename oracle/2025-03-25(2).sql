create table board101(
seqid number primary key,
title varchar2(100) not null,
pass varchar2(100) not null,
name varchar2(50) not null,
content varchar2(4000),
regdt timestamp
);

create table board102(
seqid number,
title varchar2(100) not null,
pass varchar2(100) not null,
name varchar2(50) not null,
content varchar2(4000),
regdt timestamp,
constraint board102_pk1 primary key(seqid)
);

create table board104(
seqid number,
title varchar2(100) not null,
pass varchar2(100) not null,
name varchar2(50) not null,
content varchar2(4000),
regdt timestamp,
constraint board104_pk1 primary key(seqid,name)
);

insert into board104 values(1, 'aa', '1234', '홍1', '', sysdate);	        -- ok
insert into board104 values(2, 'aa', '33334', '홍7', '', sysdate);	        -- ok
insert into board104 values(2, 'aa', '33334', '김', '', sysdate);	        -- ok
-- 무결성 제약 조건(C##JAVA.BOARD104_PK1)에 위배됩니다
-- insert into board104 values(1, 'aa', '66334', '홍1', 'sss', sysdate);	    -- error
insert into board104 values(3, 'aa', '66334', '홍1', 'sss', sysdate);	    -- ok
-- 무결성 제약 조건(C##JAVA.BOARD104_PK1)에 위배됩니다
-- insert into board104 values(3, 'assa', '7777', '홍1', 'sss', sysdate);	-- error
insert into board104 values(3, 'aa', '66334', '만두', 'sss', sysdate);	    -- ok





















