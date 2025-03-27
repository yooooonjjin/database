-- [ LOOP ]
declare
    cnt number := 0;
begin
	loop
		cnt := cnt+1; 
        exit when cnt > 10;
		dbms_output.put_line(cnt);
	end loop;
end;
/
-- -------------------------------------------
declare
    -- cnt number := 0;
    a number := 1;
begin
    for i in 1..10
	loop
		dbms_output.put_line(a);
        a := a+2;
	end loop;
end;
/
-- ---------------------------------------------------------------------------------------
-- [ 구구단 ]
declare
	dan number := 2;
	cnt number := 1;
begin
	loop
		dbms_output.put_line(dan||'*'||cnt||'='||dan*cnt);
		cnt := cnt+1;
		exit when cnt = 10;
	end loop;
end;
/