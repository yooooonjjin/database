-- (풀어보기 1)
-- 사원번호
-- 1. 없는 사원번호 입니다.
-- 2. 사원번호 / 사원명 / 급여(+ 커미션) / 입사년도 / 부서명

declare
	v_empno varchar2 := &사원번호;
	v_cnt   number;
	v_ename varchar2;
	v_sal   number;
	v_year  varchar2;
	v_dname varchar2;
begin
	select count(*) from emp where empno = v_empno;
	if v_cnt = 0 then
		dbms_output.put_line(v_empno||'는 없는 사원번호 입니다.');
	else
		select	ename
                ,(sal+nvl(comm,0))
                ,to_char(hiredate,'yyyy')
                ,dname
            into
                v_ename
                ,v_sal
                ,v_year
                ,v_dname
		from
                emp e, dept d
		where
                e.deptno = d.deptno
		and
                e.empno = 7788; 
        dbms_output.put_line('사원번호'||v_empno);
        dbms_output.put_line('사원이름'||v_ename);
        dbms_output.put_line('사원급여'||v_sal);
        dbms_output.put_line('입사년도'||v_year);
        dbms_output.put_line('부서명'||v_dname);
    end if;
end;
/
-- ----------------------------------
-- 사원번호 / 사원명 / 급여(+ 커미션) / 입사년도 / 부서명
select	empno
	,ename
	,(sal+nal(comm,0))
	,to_char(hiredate,'yyyy')
	,dname
from
	emp e, dept d
where
	e.deptno = d.deptno;



-- ------------------------------------------------------------------------------------
-- (풀어보기 2)
declare
	v_deptno dept.deptno%type := &p_deptno;
	v_dname dept.dname%type := '&p_dname';
	v_loc dept.loc%type := '&p_loc';
	v_cnt number := 0;
begin
	select count(deptno) into v_cnt from dept
	where deptno = v_deptno;
	
	if v_cnt = 0 then
		insert into dept values(v_deptno,v_dname,v_loc);
		dbms_output.put_line('저장처리 되었습니다.');
	else
		update dept set dname = v_dname, loc = v_loc
		where deptno = v_deptno;
		dbms_output.put_line('업데이트 처리 되었습니다.');
	end if;
end;
/

select * from dept;