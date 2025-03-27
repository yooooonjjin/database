-- set serveroutput on; -- dbms 출력을 위한 처리

-- 1. 연봉을 12로 나누어 결과를 출력한다.
declare
    v_sal number(8) := 3000;
    m_sal number(8);
    v_eng number := 98;
    v_ret number;
begin
    m_sal := v_sal/12;
    v_ret := mod(v_eng,10); -- mod : 나머지값
    
    dbms_output.put_line('내 급여는'||m_sal||'입니다.');
    dbms_output.put_line('결과 : '||v_ret);
end;
/
-- ------------------------------------------------------------------------
-- 2. 부서테이블 : BOSTON을 검색 조건으로 조회한다. (부서번호, 부서이름)
declare
    v_deptno dept.deptno%type;	-- 테이블 컬럼 타입을 따르겠다.
	v_dname dept.dname%type;	-- 테이블 컬럼 타입을 따르겠다.
begin
    select deptno,dname into v_deptno,v_dname from dept
    where loc = 'BOSTON';
    
    dbms_output.put_line(v_deptno || ',' || v_dname);
end;
/
-- ------------------------------------------------------------------------
-- 3. 사원번호가 7788인 사원의 사원이름, 업무를 출력한다.
declare
    v_ename emp.ename%type;	-- 출력용도
    v_job emp.job%type;	-- 출력용도
begin
	select	ename
            ,job
	into
            v_ename
            ,v_job
	from
            emp
	where
            empno='7788';
   dbms_output.put_line(v_ename || ',' || v_job); 
end;
/
-- ------------------------------------------------------------------------
-- 4. 데이터 입력
declare
    v_deptno number := 90;
    v_dname varchar2(100) := '총무부';
    v_loc varchar2(100) := '부산';
begin
    insert into dept values(v_deptno,v_dname,v_loc);
    dbms_output.put_line('저장완료!!'); 
end;
/
-- ------------------------------------------------------------------------
-- 5. 외부 데이터 입력
declare
    v_deptno number := '&p_deptno';
    v_dname varchar2(100) := '&p_dname';
    v_loc varchar2(100) := '&p_loc';
begin
    insert into dept values(v_deptno,v_dname,v_loc);
    dbms_output.put_line('저장완료!!'); 
end;
/
-- -------------------------------------------------
-- 부서테이블	: 내용저장
-- 매개변수	: 외부데이터 값을 받는 변수
-- 매개변수	: 받는 용도로만 사용, 일반변수처럼 사용 불가
-- -------------------------------------------------