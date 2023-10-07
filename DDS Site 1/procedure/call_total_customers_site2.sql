SET SERVEROUTPUT ON;
DECLARE 
	n number;
BEGIN
	n := TotalCustomerinSite2;
	DBMS_OUTPUT.PUT_LINE('Number of student in site 02 is '||n);
END;
/