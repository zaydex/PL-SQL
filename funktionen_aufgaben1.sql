/*
Erstellen Sie eine Funktion, die alle Zeilen in der Tabelle
'studenten' zählt und den Wert zurück gibt. Testen Sie die Funktion.
*/

create or replace function num_stud 
return number is v_zahl number;
begin
 select count(*) into v_zahl from studenten;
 return v_zahl;
end;
/
begin
 dbms_output.put_line(num_stud());
end;
/



/*
Erstellen Sie eine Funktion, die eine Matrikelnummer als Parameter
erhält und die Anzahl der Vorlesungen zurück gibt, die dieser
Student besucht.

Verwenden Sie die erstellte Funktion in einer select-Anweisung und geben Sie
für jeden Studenten dessen Namen und die Anzahl der Vorlesungen aus, die
er besucht.

*/

create or replace function vorl_num (p_matrnr studenten.matrnr%type)
return number is v_vorl_num number;
begin
 select count(*) into v_vorl_num from hoeren
 where matrnr = p_matrnr;
 return v_vorl_num;
end;
/
select name, vorl_num(matrnr) from studenten;
/
/*
Erstellen Sie eine Funktion, die den Namen eines Profs übergeben bekommt 
und die geleisteten SWS des Profs als Summe zurück gibt. Werfen Sie 
die folgenden Ausnahmen einen Fehlercode:
- Fehlercode: -20010 wenn der Dozent nicht existiert
- Fehlercode -20011 wenn der Dozent keine Vorlesungen hält 
- Fehlercode -20012 wenn der Dozent mehr als 10 SWS hat

Testen Sie die Funktion für alle Fehlerfälle und für den Normalfall.
*/
select * from professoren;
/
select * from vorlesungen;
/

create or replace function sws_num (p_name professoren.name%type)
return number is sum_sws number;
begin
 select sum(sws) into sum_sws from vorlesungen, professoren
 where name = p_name and persnr = gehaltenvon;
 return sum_sws;
end;
/

create or replace function check_sws (p_name varchar)
return number is
 retval integer := 0;
 v_name integer;
begin
 select count(*) into v_name from professoren
 where name = p_name;
 
 select sum(sws) into retval from vorlesungen, professoren
 where name = p_name and persnr = gehaltenvon;
 
 
 if v_name = 0 then
  raise_application_error(-20010, 'Dozent nicht existiert');
 end if;
 
 if retval is null then
  raise_application_error(-20011, 'Dozent haelt keine Vorlesungen');
 end if;
 
 if retval > 9 then
  raise_application_error(-20012, 'Dozent hat mehr als 9 SWS');
 end if;
 
 return retval;
end;
/

begin
 dbms_output.put_line(check_sws('Klitschko'));
end;
