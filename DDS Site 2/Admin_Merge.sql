SET SERVEROUTPUT ON;
SET VERIFY OFF;


ACCEPT X NUMBER PROMPT "Enter Options : 1-->Create Customer, 2-->Create Device, 0-->Exit = ";
DECLARE 
	x number := &X;
	
	C NUMBER;
	M NUMBER;
	outOfChoise EXCEPTION;
	exits EXCEPTION;
	
BEGIN
  
	IF x >2 THEN
		RAISE outOfChoise;
	ELSIF x = 1 THEN
		C := InsertCustomerfromSite1;
		C := InsertCustomerfromSite2;
	ELSIF x = 2 THEN
		M := InsertDevicefromSite1;
		M := InsertDevicefromSite2;

	ELSIF x = 0 THEN
		RAISE exits;
	END IF;
	
	
	EXCEPTION
		WHEN outOfChoise THEN
			DBMS_OUTPUT.PUT_LINE('----Choose a valid option!----');
			
		WHEN exits THEN
			DBMS_OUTPUT.PUT_LINE('----Run the program again!----');
				
		WHEN OTHERS THEN
			DBMS_OUTPUT.PUT_LINE('Other errors occured while executing');
END;
/

COMMIT;