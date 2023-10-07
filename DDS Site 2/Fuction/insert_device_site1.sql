SET SERVEROUTPUT ON;
CREATE OR REPLACE FUNCTION InsertDevicefromSite1
	
return number
is
	m1 NUMBER;
 	total number;
	B Device.device_name%TYPE;
	C Device.price%TYPE;
	D Device.device_category%TYPE;
BEGIN
	select count(device_id) into m1 from Device;
	FOR R IN (SELECT * FROM device2@site1) LOOP
		B := R.device_name;
		C := R.price;
		D := R.device_category;
		m1 := m1 + 1;
		INSERT INTO Device(device_id, device_name, price, device_category) VALUES(m1, B, C, D);
		commit;
	END LOOP;
	
	FOR R IN (SELECT * FROM device4@site1) LOOP
		B := R.device_name;
		C := R.price;
		D := R.device_category;
		m1 := m1 + 1;
		INSERT INTO Device(device_id, device_name, price, device_category) VALUES(m1, B, C, D);
		commit;
	END LOOP;
	
	FOR R IN (SELECT * FROM device6@site1) LOOP
		B := R.device_name;
		C := R.price;
		D := R.device_category;
		m1 := m1 + 1;
		INSERT INTO Device(device_id, device_name, price, device_category) VALUES(m1, B, C, D);
		commit;
	END LOOP;
	
	return 1;
END InsertDevicefromSite1;

/
/*
DECLARE
	m1 number;
BEGIN
	m1 := InsertDevicefromSite1;
END;
/
*/