--drop procedure greet;
create or replace procedure greet is 
 v_today date := sysdate;
 v_tommorow v_today%type;
begin
 v_tommorow := v_today + 1;
 dbms_output.put_line(v_today);
 dbms_output.put_line(v_tommorow);
 dbms_output.put_line('Hello World');
end greet;
/
begin
greet();
end;