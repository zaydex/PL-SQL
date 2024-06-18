select * from studenten;
select * from professoren;
select * from vorlesungen;
select * from voraussetzen;
select * from hoeren;
/*
Erstellen Sie einen Cursor, der aus der Vorlesungstabelle
alle Daten ausließt, die einem bestimmten Wert für SWS und einen
bestimmten Wert für gehaltenVon haben. Die jeweiligen Werte sollen
üer Parameter an den Cursor übergeben werden.
Rufen Sie den Cursor mit den Wert 4 für die SWS und den Wert 1005 für 
gehaltenVon auf. Lassen Sie die Titel der Vorlesungen ausgeben.
Falls keine passenden Datensätze gefunden werden, geben Sie
'nicht gefunden' aus. Testen Sie das, indem Sie für
gehaltenVon den Wert 1014 einsetzen.
*/

declare
 cursor c_vorlesungen (p_sws integer, p_gehaltenvon integer) is
  select * from vorlesungen where sws = p_sws and gehaltenvon = p_gehaltenvon;
  zeile_v c_vorlesungen%rowtype;
begin
 open c_vorlesungen(4, 1005);
 fetch c_vorlesungen into zeile_v;
 if c_vorlesungen%notfound then
  dbms_output.put_line('nicht gefunden');
 end if;
 while c_vorlesungen%found loop
  dbms_output.put_line(zeile_v.titel);
  fetch c_vorlesungen into zeile_v;
end loop;
end;
/

/*
Erstellen Sie einen Cursor, der für einen 
bestimmten Professor die Summe der SWS berechnet, die er
hält. Der Name des Professors soll dazu als Parameter
an den Cursor übergeben werden. Geben Sie den Namen
des Professors und die berechnete Summe aus. Auch hier
sall der Hinweis 'nicht gefunden' ausgegeben werden, wenn 
ein Professor keine Vorlesungen hält (z.B. Schulze)


*/
declare
 cursor c_professoren (p_name varchar) is
  select name, sum(v.sws) as sws_sum
  from professoren p, vorlesungen v 
  where v.gehaltenvon = p.persnr and name = p_name
  group by name;
  zeile_v c_professoren%rowtype;
begin
 open c_professoren('Ali');
 fetch c_professoren into zeile_v;
 if c_professoren%notfound then
  dbms_output.put_line('nicht gefunden');
 end if;
 while c_professoren%found loop
  dbms_output.put_line(zeile_v.name ||' ' || zeile_v.sws_sum);
  fetch c_professoren into zeile_v;
 end loop;
 close c_professoren;
end;
/

/*
Lassen Sie die Namen aller Studenten ausgeben. Nutzen Sie
dafür eine for-Schleife und schreiben Sie die benötigte
select-Anweisung direkt in den Kopf der for-Schleife.

*/
begin
 for i in (select * from studenten) loop
  dbms_output.put_line(i.name);
 end loop;
end;
/

/*
Geben Sie die Namen der Professoren aus, die die 
Vorlesungen mit den meisten  SWS halten. 
(Im Beispiel wären das die Vorlesungen Logik und Kunst.)
*/
declare
 cursor c_prof is
  select name, sws 
  from professoren p, vorlesungen v 
  where v.gehaltenvon = p.persnr and v.sws = (select max(sws) from vorlesungen);
 zeile_v c_prof%rowtype;
begin
 for i in c_prof loop
  dbms_output.put_line(zeile_v.name);
 end loop;
end;
/

/*
Ordnen Sie die Namen der Studenten alphabetisch
und geben Sie die ersten vier Namen aus.

*/
declare
 cursor c_studenten is
  select * from studenten
  order by name;
begin
 for i in c_studenten loop
  dbms_output.put_line(i.name);
  if c_studenten%rowcount = 4 then
   exit;
  end if;
 end loop;
end;
/

/*
Alle Datensätze der Vorlesungstabelle sollen absteigend nach Titel
geordnet in eine Index-Tabelle geschrieben werden. Geben Sie aus
der Index-Tabelle den Titel des 4. Eintrags aus.
*/








/

