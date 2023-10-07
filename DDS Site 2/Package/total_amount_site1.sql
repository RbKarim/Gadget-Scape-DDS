SET SERVEROUTPUT ON;
SET VERIFY OFF;



CREATE OR REPLACE PACKAGE mypack AS
	FUNCTION F1
	RETURN NUMBER;
	
	PROCEDURE P1(n IN NUMBER);
END mypack;
/

CREATE OR REPLACE PACKAGE BODY mypack AS
	FUNCTION F1
	RETURN NUMBER
	IS
	num number := 0;
	BEGIN
		FOR i IN (select * from orders) LOOP
			num := num + i.amount;
		END LOOP;
		return num;
	END F1;
	
	PROCEDURE P1(n IN NUMBER)
	IS
	BEGIN
		DBMS_OUTPUT.PUT_LINE('Total Amount = '||n);
	END P1;
END mypack;
/
