SET SERVEROUTPUT ON;

CREATE or REPLACE PROCEDURE DeviceList(devCat NUMBER)
is
	BEGIN

		IF (devCat=1) THEN
			FOR i IN (SELECT * FROM Device2) LOOP
			
				DBMS_OUTPUT.PUT_LINE(i.device_id || ' ' || i.device_name || ' ' || i.price || ' ' || 'Taka');
		
			END LOOP;
		
		ELSIF (devCat=2) THEN
			FOR j IN (SELECT * FROM Device4) LOOP
				
				DBMS_OUTPUT.PUT_LINE(j.device_id || ' ' || j.device_name || ' ' || j.price || ' ' || 'Taka');
				
			END LOOP;
		
		ELSIF (devCat=3) THEN
			FOR k IN (SELECT * FROM Device6) LOOP

				DBMS_OUTPUT.PUT_LINE(k.device_id || ' ' || k.device_name || ' ' || k.price || ' ' || 'Taka');

			END LOOP;
		
		END IF;

	EXCEPTION
		WHEN OTHERS THEN
			DBMS_OUTPUT.PUT_LINE('Other errors occured while executing');
	
END DeviceList;
/