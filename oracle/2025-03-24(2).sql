create table board2(
seqid number,
title varchar2(100) not null,
content varchar2(4000),
regdt date default '1900-01-01' not null,
hits number default 0 not null,
constraint board2_seqid_pk primary key(seqid)
);

create table board2sub(
seqid number primary key,
content varchar2(1000),
regdt date default '1900-01-01' not null,
p_seqid number not null,
constraint  board2sub_fk
            foreign key(p_seqid)
            references board2(seqid)
            on delete cascade   -- 부모 / 자식레벨 데이터 동시 삭제
);


insert into board2 values('1','aa1','ccc1','sysdate','0');
insert into board2 values('2','aa2','ccc2','sysdate','0');











