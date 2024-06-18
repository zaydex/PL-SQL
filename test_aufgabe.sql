DECLARE
 v_fname VARCHAR2(20);
 v_lname VARCHAR2(15) DEFAULT 'fernandez';
BEGIN
 DBMS_OUTPUT.PUT_LINE(v_fname ||' ' ||v_lname);
END;
/