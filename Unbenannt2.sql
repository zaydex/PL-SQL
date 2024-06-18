declare
    v_name varchar(20);
begin
    select name into v_name
    from studenten where matrnr=2401;
    dbms_output.put_line(v_name);
end;