/*
Erzeugen Sie eine Package mit der Bezeichnung pkg_studenten.
Das paket soll zwei Prozeduren enthalten beide Prozeduren sollen
insert_stud heißen und dienen dazu Datensätze in die Studententabelle
einzufügen. Eine der Prozeduren soll als Parameter die MatrNr, 
den Namen und und das Semester des Studenten erhalten. Die andere
Prozedure soll nur den Namen und das Semester als Parmameter haben.
Die für das insert-Statement nötige MatrNr soll sich als 
max(matrnr)+1 aus der bisher größten matrNr berechnen. 

Versuchen Sie eine möglichst effiziente Implementierung, in dem Sie 
einmal programmierten Quelltext wiederverwenden.

*/
create or replace package pkg_studenten is
 procedure insert_stud (p_matrnr integer, p_name varchar, p_semester integer);
 procedure insert_stud (p_name varchar, p_semester integer);
end;
/
create or replace package body pkg_studenten is
 procedure insert_stud 
 (p_matrnr integer, p_name varchar, p_semester integer) is
  begin 
   insert into studenten
   (matrnr, name, semester)
   values
   (p_matrnr, p_name, p_semester);
 end insert_stud;
 
 procedure insert_stud
 (p_name varchar, p_semester integer) is
 v_matrnr integer;
  begin
  select max(matrnr) + 1 into v_matrnr from studenten;
  
  insert_stud(v_matrnr, p_name, p_semester);
  
  end insert_stud;
end pkg_studenten;
/
begin
 pkg_studenten.insert_stud('Alikh', 8);
end;
/
select * from studenten;