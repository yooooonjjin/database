create procedure proc_emp_deptno1(p_tablename in varchar2)
is
	v_cnt number;
begin
	select count(*) into v_cnt from emp where deptno is null;
	if v_cnt = 0 then
		dbms_output.put_line('업데이트 할 내용이 없습니다.');
	else
		update emp set deptno = 0 where deptno is null;
		dbms_output.put_line(v_cnt||'건 업데이트 완료!!');
	end if;
	
end;
/
-- 프로시저 우클릭 -> 실행


-- -----------------------------------------------------------------------------------------------------

-- (1) 사원번호와 급여를 입력받아 update 처리하는 프로시저

create procedure proc_emp_sal1
	(v_empno in number, v_sal in number)
is
	v_cnt number;
begin
	select count(*) into v_cnt from emp where empno = v_empno;
	if v_cnt = 0 then
		dbms_output.put_line('없는 사원번호 입니다.');
	else
		update emp set sal=v_sal where empno = v_empno;
		dbms_output.put_line('급여 업데이트 완료!');
	end if;
end;
/


