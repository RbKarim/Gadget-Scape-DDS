SET SERVEROUTPUT ON;
SET VERIFY OFF;

ACCEPT X CHAR PROMPT "Enter user name = "
ACCEPT Y NUMBER PROMPT "Enter phone number = "
ACCEPT Z NUMBER PROMPT "Enter new phone number = "

DECLARE 
	x number := &Choose_a_Option;
	A VARCHAR2(20);
	B NUMBER;
	C NUMBER;
	M NUMBER;
	outOfChoise EXCEPTION;
	
BEGIN
	A := '&X';
	B := &Y;
	C := &Z;
	IF x > 4 THEN
		RAISE outOfChoise;
	ELSIF x = 1 THEN
		AddCustomerInSite1(A,B);
	ELSIF x = 2 THEN
		AddCustomerInSite2(A,B);
	ELSIF x = 3 THEN
		M:= update_customer_info_in_site1(B,C);
		IF M = 1 THEN
			DBMS_OUTPUT.PUT_LINE('Successfully updated');
		ELSIF M = 0 THEN
			DBMS_OUTPUT.PUT_LINE('Could not update');
		END IF;
	ELSIF x = 4THEN
		M:= update_customer_info_in_site2(B,C);
		IF M = 1 THEN
			DBMS_OUTPUT.PUT_LINE('Successfully updated');
		ELSIF M = 0 THEN
			DBMS_OUTPUT.PUT_LINE('Could not update');
		END IF;
	END IF;
	
	
	EXCEPTION
		WHEN outOfChoise THEN
			DBMS_OUTPUT.PUT_LINE('----Choose a valid option----');

		WHEN OTHERS THEN
			DBMS_OUTPUT.PUT_LINE('Other errors occured while executing');
END;
/

COMMIT;