CLEAR SCREEN;
SET SERVEROUTPUT ON;
SET VERIFY OFF;

DROP TABLE Customer1 CASCADE CONSTRAINTS;
DROP TABLE Device2 CASCADE CONSTRAINTS;
DROP TABLE Device4 CASCADE CONSTRAINTS;
DROP TABLE Device6 CASCADE CONSTRAINTS;
DROP TABLE Orders CASCADE CONSTRAINTS;
DROP TABLE item CASCADE CONSTRAINTS;

CREATE TABLE Customer1 (
  c_id NUMBER ,
  c_name VARCHAR2(20),
  c_type VARCHAR2(10),
  c_phone NUMBER UNIQUE,
  c_slot int DEFAULT 0,
  PRIMARY KEY(c_id)
);
INSERT INTO Customer1
VALUES(1,'RIFAT','GAMER',11223445,0);

CREATE TABLE Device2 (
  device_id NUMBER,
  device_name VARCHAR2(50),
  price NUMBER,
  device_category VARCHAR2(10),
  PRIMARY KEY(device_id)
);
INSERT INTO Device2 (device_id, device_name,price,device_category)
VALUES (1, 'MSI GTX 1030 OC 2GB', 10000, 'GPU');
INSERT INTO Device2 (device_id, device_name,price,device_category)
VALUES (2, 'ASUS RTX 3050 8GB', 45000, 'GPU');
INSERT INTO Device2 (device_id, device_name,price,device_category)
VALUES (3, 'GIGABYTE RTX 3070 EAGLE OC 12GB', 52000, 'GPU');
INSERT INTO Device2 (device_id, device_name,price,device_category)
VALUES (4, 'ASUS ROG STRIX RTX 4090 OC 24GB', 180000, 'GPU');
INSERT INTO Device2 (device_id, device_name,price,device_category)
VALUES (5, 'COLORFUL IGAME RTX 4070TI OC 12GB', 110000, 'GPU');


CREATE TABLE Device4 (
  device_id NUMBER ,
  device_name VARCHAR2(50),
  price NUMBER,
  device_category VARCHAR2(10),
  PRIMARY KEY(device_id)
);
INSERT INTO Device4 (device_id, device_name,price,device_category)
VALUES (1, 'Apacer Panther Golden 4GB DDR4 2666MHZ', 1850, 'RAM');
INSERT INTO Device4 (device_id, device_name,price,device_category)
VALUES (2, 'G.Skill Ripjaws V 4GB DDR4 2666MHz', 2300, 'RAM');
INSERT INTO Device4 (device_id, device_name,price,device_category)
VALUES (3, 'Corsair Vengeance LPX 8GB 3200MHz', 3200, 'RAM');
INSERT INTO Device4 (device_id, device_name,price,device_category)
VALUES (4, 'Kingston FURY Beast 16GB 5600MHz', 12500, 'RAM');
INSERT INTO Device4 (device_id, device_name,price,device_category)
VALUES (5, 'G.Skill Trident Z NEO RGB 32GB DDR4 3600MHz', 13500, 'RAM');


CREATE TABLE Device6 (
  device_id NUMBER ,
  device_name VARCHAR2(50),
  price NUMBER,
  device_category VARCHAR2(10),
  PRIMARY KEY(device_id)
);
INSERT INTO Device6 (device_id, device_name,price,device_category)
VALUES (1, 'MSI PRO MP241X 23.8-inch', 15000, 'MONITOR');
INSERT INTO Device6 (device_id, device_name,price,device_category)
VALUES (2, 'Lenovo ThinkVision E20-30 19.5-inch', 9500, 'MONITOR');
INSERT INTO Device6 (device_id, device_name,price,device_category)
VALUES (3, 'Dell D1918H 18.5-inch', 10500, 'MONITOR');
INSERT INTO Device6 (device_id, device_name,price,device_category)
VALUES (4, 'Acer EK220Q 21.5-inch', 11200, 'MONITOR');
INSERT INTO Device6 (device_id, device_name,price,device_category)
VALUES (5, 'Xiaomi Redmi 1A 23.8-inch', 12000, 'MONITOR');

--COMMIT;

/*
CREATE OR REPLACE TRIGGER TRIG
AFTER INSERT OR UPDATE OR DELETE
ON Customer1
--FOR EACH ROW
BEGIN
 DBMS_OUTPUT.PUT_LINE('DATA MANIPULATED SUCCESSFULLY!'); 
END;
/

CREATE OR REPLACE TRIGGER TRIG1
AFTER INSERT OR UPDATE OR DELETE
ON Device2
--FOR EACH ROW
BEGIN
 DBMS_OUTPUT.PUT_LINE('DATA MANIPULATED SUCCESSFULLY!'); 
END;
/

CREATE OR REPLACE TRIGGER TRIG2
AFTER INSERT OR UPDATE OR DELETE
ON Device4
--FOR EACH ROW
BEGIN
 DBMS_OUTPUT.PUT_LINE('DATA MANIPULATED SUCCESSFULLY!'); 
END;
/

CREATE OR REPLACE TRIGGER TRIG3
AFTER INSERT OR UPDATE OR DELETE
ON Device6
--FOR EACH ROW
BEGIN
 DBMS_OUTPUT.PUT_LINE('DATA MANIPULATED SUCCESSFULLY!'); 
END;
/
*/

CREATE TABLE Orders(
    order_id int,
	order_quantity int,
	amount int,
	order_date date,
	customer_id int,
	order_item varchar2(50),
	PRIMARY KEY(order_id),
	FOREIGN KEY(customer_id) REFERENCES Customer1(c_id)
);

CREATE TABLE item(
	item_id int, 
	item_name varchar2(50),
	quantity int,
	PRIMARY KEY(item_id)
);

insert into item values(1,'MSI GTX 1030 OC 2GB',100);
insert into item values(2,'ASUS RTX 3050 8GB',90);
insert into item values(3,'GIGABYTE RTX 3070 EAGLE OC 12GB',150);
insert into item values(4,'ASUS ROG STRIX RTX 4090 OC 24GB',30);
insert into item values(5,'COLORFUL IGAME RTX 4070TI OC 12GB',140);
		
insert into item values(6,'Apacer Panther Golden 4GB DDR4 2666MHZ',300);
insert into item values(7,'G.Skill Ripjaws V 4GB DDR4 2666MHz',250);
insert into item values(8,'Corsair Vengeance LPX 8GB 3200MHz',50);
insert into item values(9,'Kingston FURY Beast 16GB 5600MHz',60);
insert into item values(10,'G.Skill Trident Z NEO RGB 32GB DDR4 3600MHz',55);
		
insert into item values(11,'MSI PRO MP241X 23.8-inch',50);
insert into item values(12,'Lenovo ThinkVision E20-30 19.5-inch',60);
insert into item values(13,'Dell D1918H 18.5-inch',40);
insert into item values(14,'Acer EK220Q 21.5-inch',25);
insert into item values(15,'Xiaomi Redmi 1A 23.8-inch',20);


COMMIT;