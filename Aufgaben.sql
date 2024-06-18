/*
Wie muss der Name einer Variablen 
in PL/SQL aufgebaut sein?
*/

/*
Erstellen Sie einen PL/SQL-Block und geben
Sie darin die Zeichenkette "Hallo Welt" aus.
*/
begin
 dbms_output.put_line('hallo wert');
end;
/
/*
Erstellen Sie einen PL/SQL-Block, in dem Sie die Variable 
'v_name' vom Typ varchar(20) deklarieren und mit dem Wert 'Werner' 
initialisieren. Geben Sie den Inhalt der Variable aus. Ändern Sie den 
Wert von 'v_name' auf 'Elsa' und geben Sie die Variable noch einmal aus.
*/
declare
 v_name varchar(20) := 'Werner';
begin
 dmbs_output.put_line(v_name);
 v_name := 'Elsa';
 dbms_output.put_line(v_name);
end;

/



/*
Erstellen Sie einen PL/SQl-Block. Definieren 
Sie die Variable "v_zahl" als Zahl mit 3 Stellen 
vor und zwei Stellen Nach dem Komma. Intialisieren Sie
die Variable mit dem Wert 200.22 und geben Sie
die Variable multipliziert mit 2 auf dem 
Bildschirm aus.
*/
declare
 v_zahl number(5,2) := 200.22;
begin
 dbms_output.put_line(v_zahl*2);
end;
/

/*
Erstellen Sie einen PL/SQL-Block, in diesem Block deklarieren und 
initilisieren Sie die Variablen 'v1' und 'v2'. Typ und Wert der 
Variablen sind Ihnen überlassen. Schachteln Sie einen zweiten PL/SQL-Block
in den ersten Block. Deklarieren und initilisieren Sie dort eine
Variable 'v1', die sich im Wert von der ersten Variable 'v1'
unterscheidet und eine Variable 'v3'. Lassen Sie im inneren Block
die Werte aller Variablen ausgeben. Lassen Sie 'v1' nach dem Ende des
inneren Blocks noch einmal im äißeren Block ausgeben.
*/
declare
 v1 integer := 21;
 v2 varchar(20) := 'Nurseit';
begin << outer >>
declare
 v1 integer := 22;
 v3 varchar(20) := 'Alisher';
begin
 dbms_output.put_line(v1);
 dbms_output.put_line(outer.v1);
 dbms_output.put_line(v2);
 dbms_output.put_line(v3);                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
end;
 dbms_output.put_line(v1);
end;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   


/




/*
Definieren Sie einen laufenden Zähler. 
Verwenden Sie diesen Zähler und geben Sie drei
mal den jeweils nächsten Wert des Zählers aus.
*/
drop sequence zaehler;
create sequence zaehler;
select zaehler.nextval from dual;



/*
Erstellen Sie einen PL/SQL-Block. Dieser soll
mit einer Select-Anweisung den Namen des Studenten
mit der MatrNr 2403 ermitteln und dann ausgeben.
Definieren Sie die benötigte Variable entsprechend 
dem Typ der Spalte "Name" aus der Tabelle "Studenten".
Erweitern Sie den Block und geben Sie zusätzlich
das Semester des Studenten mit aus.
*/
declare
 v_name studenten.name%type;
 v_sem studenten.semester%type;
begin
 select name, semester 
 into v_name, v_sem
 from studenten 
 where matrnr = 2403;
 dbms_output.put_line('Name des Students: ' || v_name);
 dbms_output.put_line('Semester des Students: ' || v_sem);
end;
/

/*
Erstellen Sie einen PL/SQl-Block in dem die Anzahl
der Studenten im 4. Semester ermittelt und ausgegeben wird.
*/

declare
 v_anzahl integer;
BEGIN
 select count(*)
 into v_anzahl
 from studenten
 where semester = 4;
 dbms_output.put_line('Anzahl der Studenten auf 4 Semester:' || v_anzahl);
end;
/



/*
Erstellen Sie einen PL/SQL-Block. Für alle
Studenten im 4. Semester soll die Semsterzahl um
1 erhöht werden. Geben Sie aus, wie viele Datensätze
geändert wurden.
*/

declare
 v_anzahl integer;
begin
 update studenten
 set semester = semester + 1
 where semester = 4;
 
 v_anzahl := sql%rowcount;
 dbms_output.put_line(v_anzahl);
end;
/

