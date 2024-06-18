variable b_basic_percent number;
variable b_pf_percent number;
declare
 v_today date := sysdate;
 v_tommorow v_today%type;
begin
 v_tommorow := v_today + 1;
 :b_basic_percent := 45;
 :b_pf_percent := 12;
 dbms_output.put_line(v_today);
 dbms_output.put_line(v_tommorow);
 dbms_output.put_line('Hello World');
end;
/
print b_basic_percent
print b_pf_percent