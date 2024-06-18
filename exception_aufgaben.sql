/*

Lassen sie mit SELECT-INTO die Namen aller Studenten
eines bestimmten Semesters ausgeben (mit DBMS_Output).
Testen Sie das für die Semester 2, 4 und 20.
Fangen Sie die Fehler no_data_found und too_many_rows ab.
Erstellen Sie außerdem eine Klausel, die jeden 
beliebigen Fehler fängt.

*/
declare
 v_studenten varchar(30);
begin
 select name into v_studenten
 from studenten 
 where semester = 4;
 dbms_output.put_line(v_studenten);
 
 exception
  when too_many_rows then
   dbms_output.put_line('zu viele Zeilen');
  when no_data_found then
   dbms_output.put_line('kein Data gefunden');
  when others then
   dbms_output.put_line('anderer Fehler');
end;
/

/*

Loeschen Sie alle Datensaetze der Studenten-Tabelle,
in denen semester=20 ist. Loesen Sie eine Exception 
aus, wenn kein Datensatz geloescht wird. Fangen
Sie diese Exception und lassen Sie sich den
SQLCODE und die SQLERRM ausgeben.
*/
declare
 e_no_data exception;
begin
 delete from studenten where semester = 20;
 if sql%notfound then
  raise e_no_data;
 end if;
 
 exception
  when e_no_data then
   dbms_output.put_line(sqlcode);
   dbms_output.put_line(sqlerrm);
end;
/


/*

Erweitern Sie die vorherige Aufgabe, indem
Sie ihrer Exception den Fehlercode -20202 und
die Fehlermeldung 'Keine Zeile gelöscht' hunzufuegen.
Fangen sie die Exception und loesen Sie die
Exception im when-Teil der Ausnahmebehandlung erneut aus.
*/

declare
 e_no_data exception;
 pragma exception_init(e_no_data, -20202);
begin
 delete from studenten where semester = 20;
 if sql%notfound then
  raise e_no_data;
 end if;
 
 exception
  when e_no_data then
   dbms_output.put_line(sqlcode);
   dbms_output.put_line('Keine Zeile gel�scht');
end;
/


/*
Fuegen Sie mit einem insert-Befehl in die Studenten-Tabellen
einen Datensatz ein, der nur null-Werte hat. Fangen Sie 
den Fehler, der dabei auftritt.
*/
/*
declare
 e_null exception;
 pragma exception_init(e_null, -01400);
 
 v_matrnr studenten.matrnr%type := null;
 v_name studenten.name%type := 'Alisher';
 v_semester studenten.semester%type := 3;
 
begin
 
 if v_matrnr is null or v_name is null or v_semester is null then
  raise e_null;
 end if;
 
 insert into studenten (matrnr, name, semester)
  values (v_matrnr, v_name, v_semester);
 
 dbms_output.put_line('Daten eingef�gt');
--delete from studenten where matrnr = 1;
 exception
  when e_null then
   dbms_output.put_line(sqlcode);
   dbms_output.put_line('Null in Daten');
end;
/
*/

declare
 e_insert_fehler exception;
 pragma exception_init(e_insert_fehler, -01400);
begin
 insert into studenten (matrnr, name, semester)
 values (null, null, null);
 
 if e_insert_fehler then
  dbms_output.put_line(sqlcode);
  dbms_output.put_line(sqlerrm);
 end if;
end;
/


