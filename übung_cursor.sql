/*
Erzeugen Sie einen Record, der einer Zeile aus der 
Professoren-Tabelle entspricht. Tragen Sie in den 
Record als persnr=1234, als name='Billy' und als
Raum='C123' ein. Fuegen Sie den Record als neuen
Datensatz in die Professoren-Tabelle ein.
*/

declare
 v_prof professoren%rowtype;
begin
 v_prof.persnr := 1234;
 v_prof.name := 'Billy';
 v_prof.raum := 'C123';
 insert into professoren values  v_prof;
end;
/

 select * from professoren;
 delete from professoren where persnr=1234;
 
/




/*
Definieren Sie einen Cursor und lassen Sie alle Studentennamen der
Tabelle Studenten mit Hilfe des Cursors ausgeben.
Benutzen Sie eine FOR-Schleife, um den Cursor zu durchlaufen
*/
declare
 cursor c_student is
  select name from studenten;
begin
 for i in c_student
 loop
  dbms_output.put_line(i.name);
 end loop;
end;
/




/*
Definieren Sie einen Cursor und lassen Sie alle Studentennamen der
Tabelle Studenten mit Hilfe des Cursors ausgeben.
Benutzen Sie eine Basisschleife, um den Cursor zu durchlaufen. 
Geben Sie zusätzlich auch einen Zähler für die Zeilrn mit aus.
*/

declare
 cursor c_student is
  select name from studenten;

v_name studenten.name%type;
v_zahl integer := 1;
begin
 open c_student;
 loop
 fetch c_student into v_name;
  exit when c_student%notfound;
  dbms_output.put_line(v_zahl || ' ' || v_name);
  v_zahl := v_zahl + 1;
 end loop;
 close c_student;
end;
/


/*
Definieren Sie einen Cursor und lassen Sie alle Studentennamen der
Tabelle Studenten mit Hilfe des Cursors ausgeben.
Benutzen Sie eine While-Schleife, um den Cursor zu durchlaufen. 
Geben Sie zusätzlich auch einen Zähler für die Zeilrn mit aus.
*/

declare
 cursor c_student is
  select name from studenten;

v_name studenten.name%type;
v_zahl integer := 1;
begin
 open c_student;
 while c_student%isopen
 loop
 fetch c_student into v_name;
 exit when c_student%notfound;
  dbms_output.put_line(v_zahl || ' ' || v_name);
  v_zahl := v_zahl + 1;
 end loop;
 close c_student;
end;
/


/*
Erstellen sie einen Cursor, der als Parameter die
Matrnr eines Studenten bekommt. Der Cursor soll alle Daten 
zu dem Studenten mit dieser Matrnr ermitteln.
Benutzen Sie den Cursor, um die Namen der Studenten mit den 
Matrnummern 2402 und 2403 auszugeben.
*/
declare
 cursor c_stud (p_matrnr integer) is
   select *  from studenten where matrnr = p_matrnr;
 zeile_c c_stud%rowtype;
 
begin
  open c_stud(2402);
  fetch  c_stud into zeile_c;
  dbms_output.put_line(zeile_c.name);
  close c_stud; 
    
  open c_stud(2403);
  fetch  c_stud into zeile_c;
  dbms_output.put_line(zeile_c.name);
  close c_stud; 
end;

/*
Definieren Sie einen Cursor der alle Zeilen der
Studententabelle ermittelt und Änderungen zulässt
(for update).
Nutzen Sie den Cursor, um die Namen aller Studenten
anzuzeigen. Außerdem soll der Eintrag für Semester im 
Datensatz mit dem Studentenname Heidi auf 123 geändert werden.
Nutzen Sie dafür den Cursor.
*/

declare
 cursor c_stud is
   select *  from studenten for update;
 zeile_c c_stud%rowtype;
 
begin
  open c_stud;
  fetch  c_stud into zeile_c;
  while c_stud%found loop
   dbms_output.put_line(zeile_c.name);
   if (zeile_c.name = 'Heidi') then
     update studenten set semester = 123
     where current of c_stud;
   end if;
   fetch  c_stud into zeile_c;
  end loop;
  close c_stud; 
end;
/

select * from studenten where name = 'Heidi';
/

update studenten set semester = 2 where name = 'Heidi';
