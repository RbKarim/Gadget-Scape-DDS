CREATE OR REPLACE FUNCTION update_customer_info_in_site1(oldNum in customer1.c_phone%TYPE,newNum in customer1.c_phone%TYPE)
RETURN NUMBER
IS
cus_id customer1.c_id%TYPE;
cus_type customer1.c_type%TYPE;
BEGIN
	select c_id into cus_id FROM customer1 where c_phone = oldNum;
	IF cus_id = 0 THEN
		RETURN 0;
	ELSE
		UPDATE customer1
		SET c_phone = newNum
		WHERE c_id = cus_id;
		COMMIT;
		RETURN 1;
	END IF;
END update_customer_info_in_site1;
/