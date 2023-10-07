SET SERVEROUTPUT ON;


CREATE OR REPLACE PROCEDURE AddCustomerInSite2(x in CHAR, y in NUMBER)
IS
m1 NUMBER;
BEGIN
	select count(*) into m1 from Customer2@site2;
	m1 := m1 + 1;
	INSERT INTO Customer2@site2(c_id, c_name, c_type, c_phone, c_slot) VALUES(m1, x, 'OFFICIAL', y, 0);
	commit;
END AddCustomerInSite2;
/