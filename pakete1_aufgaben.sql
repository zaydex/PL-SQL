/*
Erstellen Sie ein Package, das die Variable v_global als allgemein 
zugreifbare Variable enth�lt. Initialisieren Sie diese Variable mit 
einem
beliebigen Wert. Weiterhin soll das Package die Funktion
"stud_nimmt_teil" enthalten. Diese Funktion soll als
Parameter eine Matrikelnummer erhalten und True zurück geben,
wenn der Student Vorlesungen besucht. Ansonsten soll False
zurück gegeben werden. 

Testen Sie das Package in einem PL/SQL-Block. Lassen Sie die Variable
v_global anzeigen.


*/
create or replace package pa_1 is
 v_global integer := 11;
 function stud_nimmt_teil(p_matrnr integer) return boolean;
end;
/
create or replace package body pa_1 is
 v_global integer := 11;
 function stud_nimmt_teil(p_matrnr integer) return boolean is
 retval boolean := false;
 anzahl integer := 0;
 begin
  select count(*) into anzahl
  from hoeren where matrnr = p_matrnr;
  
  if anzahl > 0 then
   retval := true;
  end if;
  return retval;
 end;
end;
/

begin
 if pa_1.stud_nimmt_teil(2401) then
  dbms_output.put_line('nimmt teil');
 end if;
end;
/