SET SERVEROUTPUT ON;

CREATE or REPLACE PROCEDURE checkQuantity(device_name CHAR,quant Number)
IS
	BEGIN		
			
			update item set quantity = quantity-quant where item_name=device_name;
			
END checkQuantity;
/
