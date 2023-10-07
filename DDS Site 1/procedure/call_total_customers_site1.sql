SET SERVEROUTPUT ON;
DECLARE 
	n number;
BEGIN
	n := TotalCustomerinSite1;
	DBMS_OUTPUT.PUT_LINE('Number of student in site 01 is '||n);
END;
/