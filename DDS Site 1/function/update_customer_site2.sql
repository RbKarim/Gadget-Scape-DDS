CREATE OR REPLACE FUNCTION update_customer_info_in_site2(oldNum in NUMBER,newNum in NUMBER)
RETURN NUMBER
IS

cus_id NUMBER;

BEGIN
	select c_id into cus_id FROM Customer2@site2 where c_phone = oldNum;
	IF cus_id = 0 THEN
		RETURN 0;
	ELSE
		UPDATE Customer2@site2
		SET c_phone = newNum
		WHERE c_id = cus_id;
		COMMIT;
		RETURN 1;
	END IF;
END update_customer_info_in_site2;
/