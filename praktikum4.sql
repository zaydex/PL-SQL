--create table messages (results varchar2(80));
--delete from messages;

--Aufgabe 1
declare
 v_ename employees.last_name%type;
 v_emp_sal employees.salary%type := 6000;
begin
 select last_name into v_ename 
 from employees where salary = v_emp_sal;
 
 insert into messages values (v_ename || ' ' || v_emp_sal);
 dbms_output.put_line(v_ename || ' ' || v_emp_sal);

 exception
  when no_data_found then
   insert into messages values ('No employee with a salary of ' || v_emp_sal);
  when too_many_rows then
   insert into messages values ('More than one employee with a salary ' || v_emp_sal);
  when others then
   insert into messages values ('Some other error occured');
end;
/
select * from messages;
select * from employees order by salary ;
/

--Aufgabe 2
declare
 e_childrecord_exists exception;
 pragma exception_init(e_childrecord_exists, -02292);
begin
 dbms_output.put_line('Deletin department 40.......');
 delete from departments where department_id = 40;
 
 exception
  when e_childrecord_exists then
   dbms_output.put_line('There are employees in this department (child record exists)');
end;
/

--Aufgabe 3 hello.sql
--Aufgabe 4 hello2.sql