SET SERVEROUTPUT ON;
SET VERIFY OFF;

CREATE OR REPLACE PACKAGE CONTROL_PACK
AS
BEGIN
   PROCEDURE INSERT_DEVICE;
END CONTROL_PACK;
/

--PACKAGE BODY
CREATE OR REPLACE PACKAGE BODY CONTROL_PACK
AS
ACCEPT DEV_NAME Device1.device_name%TYPE PROMPT 'ENTER DEVICE NAME';
ACCEPT DEV_PRICE Device1.price%TYPE%TYPE PROMPT 'ENTER DEVICE PRICE';
ACCEPT DEV_CAT Device1.device_category%TYPE PROMPT 'ENTER DEVICE CATEGORY';

BEGIN
   PROCEDURE INSERT_DEVICE
   IS 
   
   ID Device1.device_id%TYPE:= &DEV_ID;
   NAME Device1.device_name%TYPE:= &DEV_NAME;
   PRICE Device1.price%TYPE:= &DEV_PRICE;
   CATEGORY Device1.device_category%TYPE:= &DEV_CAT;
   
   BEGIN
    SELECT COUNT(device_id) INTO id FROM Device1@site2;
	INSERT INTO Device1@site2(device_id, device_name, price, device_category) VALUES(id, NAME, PRICE, CATEGORY);
	commit;
   END INSERT_DEVICE;
   
END CONTROL_PACK;
/
	       
 

BEGIN 
        -- OPTION CHOOSE AND INSERT PART
		DBMS_OUTPUT.PUT_LINE('1. Insert Information');
        DBMS_OUTPUT.PUT_LINE('2. Exit');
		
		DBMS_OUTPUT.PUT_LINE('Enter your choice:');
  		opt NUMBER:= &Option;
		
		EXIT WHEN opt = 2;
        CASE 
            WHEN OPT=1 THEN
                CONTROL_PACK.INSERT_DEVICE;
            ELSE
                DBMS_OUTPUT.PUT_LINE('Invalid option. Try again.');
        END CASE;
END;
/
