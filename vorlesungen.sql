/*
declare
 v_studenten_satz studenten%rowtype;
 type t_satz is RECORD
 (
  name varchar(10),
  vorname varchar(10) default 'XY'
 );
 type t_satz2 is record
 (
  ort varchar(10),
  s1 t_satz
 );
 v_satz t_satz2;
begin
 v_satz.ort := 'SUHL';
 v_satz.s1.name := 'ABC';
 dbms_output.put_line(v_satz.ort || v_satz.s1.vorname);
end;
/
*/
/*
declare
cursor c_student (p_semester integer) is
    select name, semester from studenten
    where semester=5;
    
v_cursor c_student%rowtype;
begin
 open c_student(5);
 loop
   fetch c_student into v_cursor;
   exit when c_student%notfound;
   dbms_output.put_line(v_cursor.name);
 end loop;
 close c_student;
end;
/
*/

/*
declare
cursor c_student (p_semester integer) is
    select name, semester from studenten
    where semester=p_semester;
begin
 for stud_record in c_student (5)
 loop
  dbms_output.put_line(stud_record.name);
 end loop;
end;
/
*/

declare
 cursor c_prof is 
  select * from professoren where name = 'Schulz'
  for update;
  
 zeile_c_prof c_prof%rowtype;
begin
 open c_prof;
 fetch c_prof into zeile_c_prof;
  update professoren set raum='A123'
  where current of c_prof;

close c_prof;
end;
/
//Praktikum 2 Aufgabe 2
declare
 v_max_deptno number;
begin
 select max(department_id) into v_max_deptno from departments;
 dbms_output.put_line(v_max_deptno);
end;
/

//Praktikum 2 Aufgabe 3
declare
 v_dept_name departments.department_name%type := 'Education';
 v_max_deptno number;
 v_dept_id number;
begin
 select max(department_id) into v_max_deptno from departments;
 v_dept_id := v_max_deptno + 10;
 insert into departments 
 (department_id, department_name, location_id) 
 values (v_dept_id, v_dept_name, Null);
 dbms_output.put_line(v_max_deptno);
 dbms_output.put_line(v_dept_id);
 dbms_output.put_line('SQL%ROWCOUNT = ' || sql%rowcount);
end;
/

DROP TABLE messages;
CREATE TABLE messages (results VARCHAR2(80));
//Praktikum 3 Aufgabe 1
begin
 for i in 1..10 loop
  if i = 6 or i = 8 then
   continue;
  end if;
  insert into messages (results) values (i);
  dbms_output.put_line(i);
 end loop;
 commit;
end;
/
//Praktikum 3 Aufgabe 2
declare
 v_countryid countries.country_id%type := 'CA';
 v_country_record countries%rowtype;
begin
 select * into v_country_record from countries 
 where country_id = v_countryid;
 dbms_output.put_line(v_country_record.country_name || ' ' || v_country_record.country_id);
end;
/
 