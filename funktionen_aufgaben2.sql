select * from professoren;
select * from vorlesungen;
select * from hoeren;
select * from Studenten;

/*
Erstellen Sie eine Funktion mit dem Namen "verdoppeln_sws".
Diese soll als Parameter eine Vorlesungsnummer bekommen und
die SWS, die fuer diese Vorlesung gespeichert sind, verdoppeln 
und zurueckgeben.
*/
create or replace function verdoppeln_sws (p_vorlnr vorlesungen.vorlnr%type)
 return integer 
 is 
 v_sws integer;
begin
 select 2*sws into v_sws from vorlesungen 
 where vorlnr = p_vorlnr;
 return v_sws;
end;
/
begin
 dbms_output.put_line(verdoppeln_sws(286));
end;
/
/*
Erstellen Sie eine select-Anweisung in der für alle
Vorlesungen der Titel, die sws und die verdoppelten sws
ausgegeben werden. Nutzen Sie die Funktion  "verdoppeln_sws".
*/

select titel, sws, verdoppeln_sws(vorlnr)
 from vorlesungen;

/*
Erstellen Sie eine select-Anweisung und geben Sie alle Titel aus,
bei denen die verdoppelten sws groesser 8 sind.
*/

select titel 
 from vorlesungen 
 where verdoppeln_sws(vorlnr) > 8
/
/*
Geben Sie für jeden Prof den Namen und die 
verdoppelte Summe der SWS aus, die er haelt.
Erweitern Sie die Anfrage so, dass nur die 
Professoren angezeigt werden, bei denen die
verdoppelte Summe der sws groesser 12 ist.

*/

select name, sum(verdoppeln_sws(vorlnr)) 
 from vorlesungen, professoren 
 where persnr = gehaltenvon
 group by name
 having sum(verdoppeln_sws(vorlnr)) > 12;
/
/*
Geben Sie den groesste Wert für die
verdoppelten SWS an.
*/

select max(verdoppeln_sws(vorlnr)) from vorlesungen;
/
/*
Fuehren Sie einen update-Befehl für die Tabelle
Vorlesungen aus. Verdoppeln Sie mit dem update alle
sws-Eintraege. Nutzen Sie dazu die Funktion
"verdoppeln_sws".
*/

update vorlesungen set sws = verdoppeln_sws(vorlnr);
/

/*
Erstellen Sie einen PL/SQL-Block und rufen Sie
die Funktion "verdoppeln_sws" fuer die Vorlesungsnummer
107 auf. Geben Sie das Ergebnis mit dbms_output.put_line
aus.
*/

begin
 dbms_output.put_line(verdoppeln_sws(107));
end;

/

/*
Erstellen Sie eine Funktion "vervierfachen_sws".
Diese soll den ursprünglichen Wert der SWS vervierfachen
und dazu die Funktion "verdoppeln_sws" nutzen.
Testen Sie die neu erstellte Funktion in einem
PL/SQL-Block.
*/
create or replace function vervierfachen_sws (p_vorlnr vorlesungen.vorlnr%type)
 return number 
 is
begin
 return 2 * verdoppeln_sws(p_vorlnr);
end;
/
begin
 dbms_output.put_line(vervierfachen_sws(107));
end;
/