-- 부서테이블에 컬럼추가 -> no 숫자

alter table dept add no number;

-- 부서테이블에 일렬번호 입력하기
declare
	v_number number := 10;
	v_no number := 1;
begin
	loop
		update dept set no = v_no where deptno = v_number;
		
		v_number := v_number + 10;
		v_no := v_no + 1;
		exit when v_number > 80;
	end loop;
end;
/

-- ---------------------------------------------------------------------------------------------------------

-- select fn_sum(90,80) from dual; -- (아직 함수 만들기 전) 부적합한 식별자

create function fn_sum(v_num1 in number, v_num2 in number)
	return number

is 
	v_sum number;
begin
	v_sum := v_num1 + v_num2;
	return v_sum;
end;
/

-- select fn_sum(90,80) result from dual;
-- select sum(sal) result from emp;