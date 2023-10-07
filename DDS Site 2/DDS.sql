CLEAR SCREEN;
SET SERVEROUTPUT ON;
SET VERIFY OFF;

DROP TABLE Customer2 CASCADE CONSTRAINTS;
DROP TABLE Device1 CASCADE CONSTRAINTS;
DROP TABLE Device3 CASCADE CONSTRAINTS;
DROP TABLE Device5 CASCADE CONSTRAINTS;
DROP TABLE Orders CASCADE CONSTRAINTS;
DROP TABLE item CASCADE CONSTRAINTS;

CREATE TABLE Customer2 (
  c_id NUMBER ,
  c_name VARCHAR2(20),
  c_type VARCHAR2(10),
  c_phone NUMBER UNIQUE,
  c_slog int,
  PRIMARY KEY(c_id)
);

INSERT INTO Customer2
VALUES(1,'Saber','Official', 01625193819,0);

CREATE TABLE Device1 (
  device_id NUMBER,
  device_name VARCHAR2(50),
  price NUMBER,
  device_category VARCHAR2(10),
  PRIMARY KEY(device_id)
);

INSERT INTO Device1 (device_id, device_name,price,device_category)
VALUES (1, 'Apple MacBook Air', 122000, 'Laptop');
INSERT INTO Device1 (device_id, device_name,price,device_category)
VALUES (2, 'Razer Blade 15', 299000, 'Laptop');
INSERT INTO Device1 (device_id, device_name,price,device_category)
VALUES (3, 'Dell Vostro 14', 51500, 'Laptop');
INSERT INTO Device1 (device_id, device_name,price,device_category)
VALUES (4, 'HP Pavilion 15-eh1890AU', 77500, 'Laptop');
INSERT INTO Device1 (device_id, device_name,price,device_category)
VALUES (5, 'Lenovo IdeaPad Slim 5i', 83500, 'Laptop');

CREATE TABLE Device3 (
  device_id NUMBER ,
  device_name VARCHAR2(100),
  price NUMBER,
  device_category VARCHAR2(10),
  PRIMARY KEY(device_id)
);

INSERT INTO Device3 (device_id, device_name,price,device_category)
VALUES (1, 'Western Digital Green 480GB SSD', 4950, 'SSD');
INSERT INTO Device3 (device_id, device_name,price,device_category)
VALUES (2, 'Kingston NV1 250GB NVMe PCIe SSD', 2800,'SSD');
INSERT INTO Device3 (device_id, device_name,price,device_category)
VALUES (3, 'Seagate Barracuda Q1 240GB Internal SSD', 3400, 'SSD');
INSERT INTO Device3 (device_id, device_name,price,device_category)
VALUES (4, 'TEAM T-FORCE VULCAN Z 256GB SATA SSD', 2799, 'SSD');
INSERT INTO Device3 (device_id, device_name,price,device_category)
VALUES (5, 'TEAM T-Force M200 500GB Portable SSD', 	9700, 'SSD');


CREATE TABLE Device5 (
  device_id NUMBER ,
  device_name VARCHAR2(100),
  price NUMBER,
  device_category VARCHAR2(10),
  PRIMARY KEY(device_id)
);

INSERT INTO Device5 (device_id, device_name,price,device_category)
VALUES (1, 'AMD Ryzen 3 4100', 10500, 'Processor');
INSERT INTO Device5 (device_id, device_name,price,device_category)
VALUES (2, 'Intel 13th Gen Core i7 13700 Raptor Lake', 8500,'Processor');
INSERT INTO Device5 (device_id, device_name,price,device_category)
VALUES (3, 'Intel 10th Gen Core i3 10100F', 3400, 'Processor');
INSERT INTO Device5 (device_id, device_name,price,device_category)
VALUES (4, 'AMD RYZEN 5 3500', 12500, 'Processor');
INSERT INTO Device5 (device_id, device_name,price,device_category)
VALUES (5, 'Intel 10th Gen Core i5-10400F', 14000, 'Processor');




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
	FOREIGN KEY(customer_id) REFERENCES Customer2(c_id)
);

CREATE TABLE item(
	item_id int, 
	item_name varchar2(50),
	quantity int,
	PRIMARY KEY(item_id)
);

insert into item values(1,'Apple MacBook Air',100);
insert into item values(2,'Razer Blade 15',90);
insert into item values(3,'Dell Vostro 14',150);
insert into item values(4,'HP Pavilion 15-eh1890AU',30);
insert into item values(5,'Lenovo IdeaPad Slim 5i',140);
		
insert into item values(6,'Western Digital Green 480GB SSD',300);
insert into item values(7,'Kingston NV1 250GB NVMe PCIe SSD',250);
insert into item values(8,'Seagate Barracuda Q1 240GB Internal SSD',50);
insert into item values(9,'TEAM T-FORCE VULCAN Z 256GB SATA SSD',60);
insert into item values(10,'TEAM T-Force M200 500GB Portable SSD',55);
		
insert into item values(11,'AMD Ryzen 3 4100',50);
insert into item values(12,'Intel 13th Gen Core i7 13700 Raptor Lake',60);
insert into item values(13,'Intel 10th Gen Core i3 10100F',40);
insert into item values(14,'AMD RYZEN 5 3500',25);
insert into item values(15,'Intel 10th Gen Core i5-10400F',20);


COMMIT;