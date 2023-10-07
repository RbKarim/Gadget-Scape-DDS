SET SERVEROUTPUT ON;
SET VERIFY OFF;


ACCEPT X NUMBER PROMPT "Choose Option : 1-->Show Order Info, 2-->Show Orders of Today, 3-->Total(0), 0-->Exit = ";
DECLARE 
	x number := &X;
	A VARCHAR2(20):='&Type';
	B NUMBER :=&id;
	C NUMBER;
	M NUMBER;
	outOfChoise EXCEPTION;
	exits EXCEPTION;
	
BEGIN
  
	IF x >3 THEN
		RAISE outOfChoise;
	ELSIF x = 1 THEN
		mypack3.P3(B,A);
	ELSIF x = 2 THEN
		mypack2.P2;
	ELSIF x = 3 THEN
		M := mypack.F1;
	    mypack.p1(M);
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