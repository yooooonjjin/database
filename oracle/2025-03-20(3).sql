create table pop1 as select b.* from (
    select rownum rn, a.* from (
        select * from popSeoul
        order by (s2+s3) desc) a ) b;
        
select * from  pop1
    where rn >= 6 and rn <=10;
    

create view pop11 as select b.* from (
    select rownum rn, a.* from (
        select * from popSeoul
        order by (s2+s3) desc) a ) b;
        
select * from pop11
where rn >= 6 and rn <= 10;