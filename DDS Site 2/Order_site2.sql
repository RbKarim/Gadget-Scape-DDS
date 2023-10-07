SET SERVEROUTPUT ON;
SET VERIFY OFF;

ACCEPT X CHAR PROMPT "Enter user name = "
ACCEPT Y CHAR PROMPT "Enter phone number = "
ACCEPT X NUMBER PROMPT "Enter Device Category : 1 --> Laptop, 2 --> SSD, 3 --> Processor = "


DECLARE 

	userName Customer2.c_name%TYPE:= '&X';
	phoneNum Customer2.c_phone%TYPE:= '&Y';
	devCat Number:= &X;
	currentSlog int;
	cname Customer2.c_name%TYPE;
	ctype Customer2.c_type%TYPE:='default';
	
BEGIN

	select c_name, c_type into cname, ctype from Customer2 where c_phone = phoneNum;
	update Customer2 set c_slot = 1 where c_phone=phoneNum;
	
	
	DBMS_OUTPUT.PUT_LINE('Customer name: '|| UPPER(cname));
	DBMS_OUTPUT.PUT_LINE('Customer type: '|| UPPER(ctype));
	
	select c_slot into currentSlog from Customer2 where c_phone = phoneNum;
	DBMS_OUTPUT.PUT_LINE('Current Slog:' ||' ' || currentSlog);
	
	
	DBMS_OUTPUT.PUT_LINE('DeviceList: ');

	---> Show the device list
	DeviceList(devCat);

	EXCEPTION
	WHEN NO_DATA_FOUND THEN
	DBMS_OUTPUT.PUT_LINE('No customer found');
	DBMS_OUTPUT.PUT_LINE('Do you want to insert customer name and phone number again?');
	
	
END;
/

---> Order recieve part
SELECT *FROM item;

ACCEPT C CHAR PROMPT "What product/device do you want to choose?  "
ACCEPT Q NUMBER PROMPT "Please enter the quantity = "

DECLARE
SelectedItem varchar2(50):='&C';
Quantity Number:=&Q;
cid Number;
BEGIN
	select c_id into cid from Customer2 where c_slot=1;
	selectItem(cid,SelectedItem,Quantity);

END;
/

select * from item;