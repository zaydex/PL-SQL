/*
Erzeugen Sie eine index by- Tabelle (Vorlesung 3 / Folie 53) die Daten speichern kann, die
den gleichen Typ haben, wie die Spalte Name in der Tabelle Studenten. Als Typ für den Index
soll PLS_INTEGER verwendet werden.

Legen Sie einen Eintrag in dieser Tabelle an. Lassen Sie den Eintrag ausgeben. 

*/

declare
 type t_studenten_name is
 table of studenten.name%type
 index by pls_integer;
 
 studenten_table t_studenten_name;
begin
 studenten_table(1) := 'Alisher';
 dbms_output.put_line(studenten_table(1));
end;
/


/*
Erweitern Sie den oben erstellten PL/SQL-Block. Machen Sie 3 Eonträge in die index-Tabelle  und
lassen Sie diese über eine for-Schleife ausgeben.


*/

declare
 type t_studenten_name is
 table of studenten.name%type
 index by pls_integer;
 
 studenten_table t_studenten_name;
begin
 studenten_table(1) := 'Alisher';
 studenten_table(2) := 'Roman';
 studenten_table(3) := 'Arman';
 for i in 1..3 loop
  dbms_output.put_line(studenten_table(i));
 end loop;
end;
/


/*
Ändern Sie den PL/SQL-Block so, dass die Ausgabe mit einer while-Schleife
ausgeführt wird.
*/
declare
 type t_studenten_name is
 table of studenten.name%type
 index by pls_integer;
 
 i integer;
 studenten_table t_studenten_name;
begin
 studenten_table(1) := 'Alisher';
 studenten_table(2) := 'Roman';
 studenten_table(3) := 'Arman';
 
 i := studenten_table.first;
 
 while studenten_table.exists(i) loop
  dbms_output.put_line(studenten_table(i));
  i := studenten_table.next(i);
 end loop;
end;
/

