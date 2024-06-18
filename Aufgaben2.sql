/*
Deklarieren Sie eine Variable vom Type number ohne ihr einen
Wert zuzuweisen. Testen Sie mit einer if-Anweisung diese
Variable auf null und geben Sie im then-Zweig die Ausschrift 
'ist Null' aus und im else-Zweig 'ist nicht Null'.
Wiesen Sie der Variable einen Wert zu und testen Sie den Block erneut.
*/
declare
 v_number number := 1;
begin
    if v_number is NULL then
        dbms_output.put_line('ist Null');
    else
        dbms_output.put_line('ist nicht Null');
    end if;
end;
/

/*
Lassen sie mittels '&variablen_name' eine Zahl vom Nutzer
eingeben. Wenn diese Zahl kleiner 10 ist, geben Sie den Text
'kleiner 10' aus. Wenn diese Zahl kleiner 20 ist, geben Sie den Text
'kleiner 20' aus. In allen anderen Fällen soll der Text
'große Zahl' ausgegeben werden. Benutzen Sie die case-Anweisung.
*/
declare
 v_number integer := &Number;
begin
 case
    when v_number < 10 then
     dbms_output.put_line('kleiner 10');
    when v_number < 20 then
     dbms_output.put_line('kleiner 20');
    else 
     dbms_output.put_line('grosse zahl');
 end case;
end;
/

/*
Geben Sie die Zahlen von 1 bis 10 aus. Nutzen Sie dazu 
eine "Basisschleife".
*/
declare
 v_zahl number := 1;
begin
 loop
  v_zahl := v_zahl + 1;
  exit when v_zahl = 10;
 end loop;
 dbms_output.put_line(v_zahl);
end;
/

/*
Geben Sie die Zahlen von  1 bis 10 aus.
Nutzen Sie dazu eine While-Schleife.
*/

declare
 v_zahl number := 1;
begin
 while v_zahl != 10 loop
  v_zahl := v_zahl + 1;
 end loop;
 dbms_output.put_line(v_zahl);
end;
/

/*
Geben Sie die Zahlen von  1 bis 10 aus.
Nutzen Sie dazu eine FOR-Schleife.
*/
declare
 v_zahl number := 1;
begin
 for i in v_zahl..9 loop
  v_zahl := v_zahl + 1;
 end loop;
 dbms_output.put_line(v_zahl);
end;
/


/*
Geben Sie alle Zahlen von 1 bis 10 
aus. Danach sollen nur die ungeraden  Zahlen bis 20 
ausgegeben werden (also: 1 2 3 4 5 6 7 8 9 10 11 13 15 17 19).
Benutzen Sie unr eine Schleife.
*/
begin
 for i in 1..20 loop
  if i <= 10 then
   dbms_output.put_line(i);
  elsif i mod 2 = 1 then
   dbms_output.put_line(i);
  end if;
 end loop;
end;
/
/*
Geben Sie das kleine Einmaleins von 1*1=1 
bis 10*10=100 aus. 

*/
declare
 v_zahl number := 1;
begin
 for i in v_zahl..10 loop
  dbms_output.put_line(v_zahl || '+' || v_zahl || '=' || v_zahl * v_zahl);
  v_zahl := v_zahl + 1;
 end loop;
end;
/

/*
Erstellen Sie einen Record, der die gleiche Struktur
hat, wie eine Zeile der Studenten-Tabelle. Lassen Sie die 
Daten für den Studenten mit der Matrnr. 2401 in diese
Record-Struktur ausgeben. Erhöhen Sie die Matrnr um 100
und fügen Sie den Datensatz dann als neuen Datensatz in 
die Studenten-Tabelle ein.
*/

declare
type t_rec is record
 (
  v_matrnr studenten.matrnr%type,
  v_name studenten.name%type,
  v_semester studenten.semester%type
  
 );
 v_rec t_rec;
begin
 select * into v_rec from studenten where matrnr = 2401;
 dbms_output.put_line(v_rec.v_name);
 v_rec.v_matrnr := v_rec.v_matrnr + 100;
 insert into studenten values v_rec;
end;
/


/*
Ermitteln Sie den Namen des Studenten mit der 
Matr.nr 2401. Deklarieren Sie dazu eine Variable, 
die die gleiche Struktur hat, wie die Zeilen der 
studenten-Tabelle. Nutzen Sie dazu '%rowtype'.
Lassen Sie mit einer select-into-Anweisung
den Datensatz in die Variable schreiben und
geben Sie das Attribut 'name' aus.


*/
declare
 v_rec studenten%rowtype;
begin
 select * into v_rec from studenten where matrnr = 2401;
 dbms_output.put_line(v_rec.name);
end;
/
