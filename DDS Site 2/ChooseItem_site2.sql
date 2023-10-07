SET SERVEROUTPUT ON;

CREATE or REPLACE PROCEDURE selectItem(cus_id in NUMBER, selectedItem in CHAR, Quantity in NUMBER)
IS
	total_orders NUMBER;
	totalPrice NUMBER;
	dates DATE;
	dev_name varchar2(50);
	BEGIN
	
			--> Selecting items from device 1 and also calculating the total price
			FOR i IN (SELECT * FROM Device1 WHERE device_name=selectedItem)LOOP
				DBMS_OUTPUT.PUT_LINE('Item Selected!!');
				totalPrice:=i.price*Quantity;
				dev_name:=i.device_name;
				DBMS_OUTPUT.PUT_LINE(i.device_name || ' ' || i.price || ' '|| 'Taka');
				checkQuantity(dev_name,Quantity);
				
			END LOOP;
			
			--> Selecting items from device 3 and also calculating the total price
			FOR j IN (SELECT * FROM Device3 WHERE device_name=selectedItem)LOOP
				DBMS_OUTPUT.PUT_LINE('Item Selected!!');
				totalPrice:=j.price*Quantity;
				dev_name:=j.device_name;
				DBMS_OUTPUT.PUT_LINE(j.device_name || ' ' || j.price || ' '|| 'Taka');
				checkQuantity(dev_name,Quantity);
	
			END LOOP;
		
			--> Selecting items from device 5 and also calculating the total price
			FOR k IN (SELECT * FROM Device5 WHERE device_name=selectedItem)LOOP
				DBMS_OUTPUT.PUT_LINE('Item Selected!!');
				totalPrice:=k.price*Quantity;
				dev_name:=k.device_name;
				DBMS_OUTPUT.PUT_LINE(k.device_name || ' ' || k.price || ' '|| 'Taka');
				checkQuantity(dev_name,Quantity);
	
			END LOOP;
			
			--> Counting the present total orders and assign the new order from the ongoing value
			select count (order_id) into total_orders from Orders;
			
			total_orders:=total_orders+1;
			
			dates :=TO_DATE(sysdate, 'YYYY-MM-DD');
			
			---> Inserting the order information into order table
			insert into Orders values(total_orders,Quantity,totalPrice,dates,cus_id,dev_name);
			
			DBMS_OUTPUT.PUT_LINE('Order Id' || '  ' || 'Order Quantity' || '  ' || 'Amount' || '   ' || 'Order Date' || '   ' || 'Customer Id' || '        ' || 'Order Item');
			
            --->Printing the order details
			FOR i IN (SELECT * FROM Orders) LOOP
					
				DBMS_OUTPUT.PUT_LINE(i.order_id || '                      ' || i.order_quantity ||'                 '|| i.amount || '             ' || i.order_date || '                 '|| i.customer_id || '                    ' || i.order_item);			
			
			END LOOP;
			
			update Customer2 set c_slot = 0 where c_id=cus_id;
			
			commit;
			
				
	
END selectItem;
/
