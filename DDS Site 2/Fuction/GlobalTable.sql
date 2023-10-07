CLEAR SCREEN;
drop table Device cascade constraints;
drop table Customer cascade constraints;


CREATE TABLE Customer(
  c_id NUMBER ,
  c_name VARCHAR2(20),
  c_type VARCHAR2(10),
  c_phone NUMBER ,
  PRIMARY KEY(c_id)
);


CREATE TABLE Device(
  device_id NUMBER,
  device_name VARCHAR2(50),
  price NUMBER,
  device_category VARCHAR2(10),
  PRIMARY KEY(device_id)
);
commit;