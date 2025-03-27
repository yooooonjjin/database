-- [ 풀어보기 1 ]
declare
    v_deptno number := &p_deptno;
    v_sum_sal number;
begin
    select sum(sal) into v_sum_sal from emp where deptno = v_deptno;
    dbms_output.put_line(v_deptno||'번 부서의 평균 급여는'||v_sum_sal||'입니다.'); 
end;
/
-- ------------------------------------------------------------------------------
-- [ 풀어보기 2 ]

declare
    v_deptno number := &부서번호;
    v_comm number := &수당;
begin
    update emp set comm = nvl(comm,0)+v_comm where deptno = v_deptno;
    dbms_output.put_line(v_deptno||'번 부서의 수당을'||v_comm||'증가 시켰습니다.');
end;
/

-- nvl은 null인 경우에만 세팅
update emp set comm = nvl(comm,0)+400 where deptno = 10;

-- nvl2는 null인 경우와 null이 아닌 경우 2가지 세팅 가능
update emp set comm = nvl2(comm,comm,0)+400 where deptno = 10;

-- decode 함수를 쓰는 경우
update emp set comm = decode(comm,null,0,comm)+400 where deptno = 10;
-- ------------------------------------------------------------------------------
-- [ 조건문 ]
declare
    v_deptno number := &부서번호;
    v_comm number := &수당;
    v_cnt number;
begin
    select count(*) into v_cnt from emp where deptno=v_deptno;
    if v_cnt =0 then
        dbms_output.put_line('해당 부서에 속한 사원이 없습니다.');
    else
		update emp set comm = nvl(comm,0)+v_comm where deptno = v_deptno;
	end if;	
    dbms_output.put_line(v_deptno||'번 부서의 수당을'||v_comm||'증가 시켰습니다.');
end;
/