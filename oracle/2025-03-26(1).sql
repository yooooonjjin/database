-- 7. 예약정보 출력 (입실일 기준 최근순) - 예약번호/방번호/입실일/퇴실일/사용자ID/결재여부
select b.*from(
	select rownum rn, a.* from(
	    select	resno					                resno
		    ,rno					                rno
		    ,to_char(sdt,'yyyy-mm-dd')		        sdt
		    ,to_char(edt,'yyyy-mm-dd')		        edt
		    ,usrid					                usrid
		    ,decode(pay,'Y','결재완료','N','미결재')	pay
	    from
		    resinfo
	    order by
		    sdt desc) a) b
where
        -- rn >= 1=1 and rn <= 10;
        -- rn >= 11 and rn <= 20;
        rn between 1 and 10;
-- -----------------------------------------------------------------------------------------------------------------------
-- 8. 2025년01월의 이용정보 출력 - 예약번호/방번호/입실일/퇴실일
select	resno				        resno
        ,rno				        rno
        ,to_char(sdt,'yyyy-mm-dd')	sdt
        ,to_char(edt,'yyyy-mm-dd')	edt
from
        resinfo
where
        to_char(sdt,'yyyy-mm') = '2025-01';
-- -----------------------------------------------------------------------------------------------------------------------
-- 9 - (1) 'a1' 회원의 이용정보 
select	resno				        resno
        ,rno				        rno
        ,to_char(sdt,'yyyy-mm-dd')	sdt
        ,to_char(edt,'yyyy-mm-dd')	edt
from
        resinfo
where
        usrid = 'a1'
order by
        sdt desc;
-- --------------------------------------------    
-- 9 - (2) 'a1' 회원의 이용정보
select	s.usrid				            usrid
        ,p.phone				        phone
        ,s.resno
        ,to_char(s.sdt,'yyyy-mm-dd')	sdt
        ,to_char(s.edt,'yyyy-mm-dd')	edt
        ,s.rno				            rmo
        ,m.rprc				            rprc
from
        resinfo s, p_member p, roominfo m
where
        s.usrid = p.usrid
and
        s.rno = m.rno
and
        s.usrid = 'a1'
order by
        s.sdt desc;
-- -----------------------------------------------------------------------------------------------------------------------
-- 10. 사용자별 이용 횟수 - 예약번호/방번호/입실일/퇴실일/박수/총금액
select	usrid	usrid
        ,phone	phone
        ,(select count(*) from resinfo where usrid=p.usrid) cnt
from
        p_member p;
-- -----------------------------------------------------------------------------------------------------------------------
-- 11 - (1) 예약번호/방번호/입실일/퇴실일/박수 -- 1/2, 2/3 (1박 2일, 2박 3일)
-- ex) 1/2
select
    (to_date('2025-03-25','yyyy-mm-dd')
    - to_date('2025-03-24','yyyy-mm-dd'))||'/'||
    (to_date('2025-03-25','yyyy-mm-dd')
    - to_date('2025-03-24','yyyy-mm-dd')+1) as result
from dual;
-- -------------------------------------------- 
-- ex)
select  resno                           resno
        ,sdt                            sdt
        ,edt                            edt
        ,(edt-sdt)||'/'|| (edt-sdt+1)   result
from
        resinfo;
-- -------------------------------------------- 
-- 11 - (2) 예약번호/방번호/입실일/퇴실일/박수/금액(단가*숙박일)
select	s.resno					                            resno
        ,s.rno					                            rno
        ,to_char(s.sdt,'yyyy-mm-dd')	                    sdt
        ,to_char(s.edt,'yyyy-mm-dd')	                    edt
        ,(s.edt-s.sdt) ||'/'|| (s.edt-s.sdt+1)	            result
        ,to_char((m.rprc*(s.edt-s.sdt)),'FM999,999,999')    money
from
        resinfo s, roominfo m
where
        s.rno = m.rno;
-- -----------------------------------------------------------------------------------------------------------------------
-- 12. 작년도 매출액 출력	
select	s.resno		                    resno
        ,s.rno		                    rno
        ,m.rprc	   	                    rprc	-- 단가
        ,to_char(s.sdt,'yyyy-mm-dd')	sdt
        ,to_char(s.edt,'yyyy-mm-dd')	edt
        ,(m.rprc*(s.edt-s.sdt))         money
from
        resinfo s, roominfo m
where
        s.rno = m.rno
and
        s.pay ='Y'
and
        to_char(s.sdt,'yyyy') = '2024';
-- -------------------------------------------- 
select	
        ('2024년 매출액:' || to_char(sum(m.rprc*(s.edt-s.sdt)),'FM999,999,999')) salesum
from
        resinfo s, roominfo m
where
        s.rno = m.rno
and
        s.pay ='Y'
and
        to_char(s.sdt,'yyyy') = '2024';
-- -----------------------------------------------------------------------------------------------------------------------
-- 13. 룸번호 / 이용회수
select	rno
        ,(select count(*) from resinfo where rno=m.rno) totalcnt
from
        roominfo m;









