SET SERVEROUTPUT ON;


CREATE OR REPLACE PROCEDURE AddCustomerInSite1(x in Customer1.c_name%TYPE, y in Customer1.c_phone%TYPE)
IS
m1 NUMBER;
BEGIN
	select count(*) into m1 from Customer1;
	m1 := m1 + 1;
	INSERT INTO Customer1(c_id, c_name, c_type, c_phone, c_slot) VALUES(m1, x, 'GAMER', y, 0);
	commit;
END AddCustomerInSite1;
/