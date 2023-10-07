SET SERVEROUTPUT ON;

CREATE OR REPLACE TRIGGER InsertInCustomerfromSite1 
AFTER INSERT 
ON customer1
DECLARE
BEGIN
	DBMS_OUTPUT.PUT_LINE('New row insered into Customer1 Table ');
END;
/

CREATE OR REPLACE TRIGGER UpdateCustomer1 
AFTER Update 
ON customer1
DECLARE
BEGIN
	DBMS_OUTPUT.PUT_LINE('New row updated into Customer1 Table');
END;
/


