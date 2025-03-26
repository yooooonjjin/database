create table goods_tbl(
gds_cd number primary key,
gds_nm varchar2(50) not null,
gds_prc number default 0 not null,
gds_com varchar2(50) not null,
gds_dts timestamp,
gds_mgr varchar2(50) not null check(gds_mgr in('a1','a2','a3')) 
);

create table sale_tbl(
sale_cd number primary key,
gds_cd number,
sale_qty number default 0,
sale_dts timestamp,
sale_pay char(1) check(sale_pay in('Y','N')),
constraint sale_tbl_fk foreign key(gds_cd) references goods_tbl(gds_cd)
);


insert into goods_tbl values
	((select nvl(max(gds_cd),1000)+1 from goods_tbl)
	,'맥심목화커피'
	,'5000'
	,'제일제당'
	,sysdate
	,'a1');
    
insert into goods_tbl values
    ((select nvl(max(gds_cd),1000)+1 from goods_tbl)
    ,'신라면'
    ,'1100'
    ,'농심'
    ,sysdate
    ,'a2');

insert into goods_tbl values
    ((select nvl(max(gds_cd),1000)+1 from goods_tbl)
    ,'진라면'
    ,'1150'
    ,'오뚜기'
    ,sysdate
    ,'a2');

insert into goods_tbl values
    ((select nvl(max(gds_cd),1000)+1 from goods_tbl)
    ,'진로소주'
    ,'1500'
    ,'진로'
    ,sysdate
    ,'a3');
    
-- commit;

insert into sale_tbl values(10001,'1002','5',sysdate,'Y');
insert into sale_tbl values(10002,'1002','2',sysdate,'Y');
insert into sale_tbl values(10003,'1004','2',sysdate,'Y');
insert into sale_tbl values(10004,'1004','3',sysdate,'N');
insert into sale_tbl values(10005,'1001','10',sysdate,'Y');

-- 무결성 제약조건(C##JAVA.SALE_TBL_FK)이 위배되었습니다- 자식 레코드가 발견되었습니다
-- delete from goods_tbl where gds_cd ='1002'; 
-- delete from goods_tbl where gds_cd ='1003'; 
-- rollback;
    