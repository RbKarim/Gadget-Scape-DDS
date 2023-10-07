SET SERVEROUTPUT ON;
CREATE OR REPLACE FUNCTION InsertCustomerfromSite1
	
return number
is
	m1 NUMBER;
 	total number;
	A customer.c_id%TYPE;
	B customer.c_name%TYPE;
	C customer.c_type%TYPE;
	D customer.c_phone%TYPE;
BEGIN
	select count(c_id) into m1 from customer;
	FOR R IN (SELECT * FROM customer1@site1) LOOP
		A := R.c_id;
		B := R.c_name;
		C := R.c_type;
		D := R.c_phone;
		m1 := m1 + 1;
		INSERT INTO Customer(c_id, c_name, c_type, c_phone) VALUES(m1, B, C, D);
		commit;
	END LOOP;
	return 1;
END InsertCustomerfromSite1;

/
/*
DECLARE
	m1 number;
BEGIN
	m1 := InsertCustomerfromSite1;
END;
/
*/