SET SERVEROUTPUT ON;
SET VERIFY OFF;

--ACCEPT X NUMBER PROMPT "Enter customer id = "
--ACCEPT Y CHAR PROMPT "Enter customer Type = "

CREATE OR REPLACE PACKAGE mypack3 AS
	PROCEDURE P3(cid IN customer.c_id%TYPE, ctype IN customer.c_type%TYPE);
END mypack3;
/

CREATE OR REPLACE PACKAGE BODY mypack3 AS
	
	PROCEDURE P3(cid IN customer.c_id%TYPE, ctype IN customer.c_type%TYPE)
	IS
	myexp EXCEPTION;
	BEGIN
		IF ctype = 'GAMER' THEN
			FOR i IN(select * from Orders a inner join customer1@site1 b 
			ON a.customer_id = b.c_id and c_id = cid) LOOP
				DBMS_OUTPUT.PUT_LINE(cid || '	' || i.c_name || '	' || i.order_item || '	' || i.order_date || '	' || i.order_quantity);
			END LOOP;
		ELSIF ctype = 'OFFICIAL' THEN
			FOR i IN(select * from Orders a inner join customer2 b 
			ON a.customer_id = b.c_id and c_id = cid) LOOP
				DBMS_OUTPUT.PUT_LINE(cid || '	' || i.c_name || '	' || i.order_item || '	' || i.order_date || '	' || i.order_quantity);
			END LOOP;
		ELSE
			RAISE myexp;
		END IF;
		
	EXCEPTION
		WHEN myexp THEN
			DBMS_OUTPUT.PUT_LINE('Enter valid customer type');
		WHEN NO_DATA_FOUND THEN
			DBMS_OUTPUT.PUT_LINE('No such customer...');
		WHEN OTHERS THEN
			DBMS_OUTPUT.PUT_LINE('Something happened...');
	END P3;
END mypack3;
/
/*
DECLARE
	a NUMBER := &X;
	b VARCHAR2(10) := '&Y';
BEGIN
	mypack3.P3(a, b);
END;
/
*/