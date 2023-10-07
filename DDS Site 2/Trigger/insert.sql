SET SERVEROUTPUT ON;

CREATE OR REPLACE TRIGGER InsertInCustomerfromSite1 
AFTER INSERT 
ON customer
DECLARE
BEGIN
	DBMS_OUTPUT.PUT_LINE('New row insered into Customer Table ');
END;
/

CREATE OR REPLACE TRIGGER UpdateCustomer 
AFTER Update 
ON customer
DECLARE
BEGIN
	DBMS_OUTPUT.PUT_LINE('New row updated into Customer Table');
END;
/

CREATE OR REPLACE TRIGGER InsertInDevicefromSite 
AFTER INSERT 
ON device
DECLARE
BEGIN
	DBMS_OUTPUT.PUT_LINE('New row insered into device table');
END;
/