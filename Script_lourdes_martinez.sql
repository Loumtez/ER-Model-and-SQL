
create schema lourdes_martinez authorization rwhggrzz;

--------------------------
--- Create CARS table ---
create table lourdes_martinez.cars(
	id_car varchar(20) not null, --PK
	id_model varchar(20) not null, --FK --> model
	id_color varchar(10) not null, --FK --> color
	license varchar(20) not null,
	total_km integer not null,
	purchase_date date not null,
	id_insurance varchar(20) not null --FK --> insurance
);

-- PK
alter table lourdes_martinez.cars
add constraint cars_PK primary key (id_car); 

--------------------------
--- Create MODEL table ---
create table lourdes_martinez.model(
	id_model varchar(20) not null, --PK
	id_brand varchar(20) not null,
	model varchar(20) not null
);

-- PK
alter table lourdes_martinez.model
add constraint model_PK primary key (id_model);
-- FK
alter table lourdes_martinez.cars
add constraint model_FK foreign key (id_model) 
references lourdes_martinez.model (id_model);

--------------------------
--- Create BRAND table ---
create table lourdes_martinez.brand(
	id_brand varchar(20) not null, --PK
	id_company_group varchar(20) not null,
	brand varchar(20) not null
);

-- PK
alter table lourdes_martinez.brand
add constraint brand_PK primary key (id_brand); 
-- FK
alter table lourdes_martinez.model
add constraint brand_FK foreign key (id_brand) 
references lourdes_martinez.brand (id_brand);

--------------------------
--Create COMPANY_GROUP table
create table lourdes_martinez.company_group(
	id_company_group varchar(20) not null, --PK
	company_group varchar(20) not null
);
-- PK
alter table lourdes_martinez.company_group
add constraint company_group_PK primary key (id_company_group); 
-- FK
alter table lourdes_martinez.brand
add constraint company_group_FK foreign key (id_company_group) 
references lourdes_martinez.company_group (id_company_group);


--------------------------
--- Create COLOR table ---
create table lourdes_martinez.color(
	id_color varchar(20) not null, --PK
	color varchar(20) not null
);

--PK
alter table lourdes_martinez.color
add constraint color_PK primary key (id_color);
-- FK
alter table lourdes_martinez.cars
add constraint color_FK foreign key (id_color) 
references lourdes_martinez.color (id_color);


--------------------------
--- Create INSURANCE table ---
create table lourdes_martinez.insurance(
	id_insurance varchar(20) not null, --PK
	id_company_insurance varchar(20) not null,
	insurance_number varchar(20) not null
);


-- PK
alter table lourdes_martinez.insurance
add constraint insurance_PK primary key (id_insurance);
-- FK
alter table lourdes_martinez.cars
add constraint insurance_FK foreign key (id_insurance) 
references lourdes_martinez.insurance (id_insurance);

--------------------------
---Create COMPANY_INSURANCE table---
create table lourdes_martinez.company_insurance(
	id_company_insurance varchar(20) not null, --PK
	company_insurance varchar(20) not null
);
-- PK
alter table lourdes_martinez.company_insurance
add constraint company_insurance_PK primary key (id_company_insurance);
-- FK
alter table lourdes_martinez.insurance
add constraint company_insurance_FK foreign key (id_company_insurance) 
references lourdes_martinez.company_insurance (id_company_insurance);


--------------------------
--- Create CAR_INSPECTION table --- 
create table lourdes_martinez.car_inspection(
	id_inspection varchar(20) not null, --PK
	id_car varchar(20) not null,
	date_inspection varchar(20) not null,
	kilometers varchar(20) not null,
	id_currency varchar(20) not null
);


-- PK
alter table lourdes_martinez.car_inspection
add constraint car_inspection_PK primary key (id_inspection);
-- FK
alter table lourdes_martinez.car_inspection
add constraint car_FK foreign key (id_car) 
references lourdes_martinez.cars (id_car);

------------------------------
--- Create CURRENCY table ---
create table lourdes_martinez.currency(
	id_currency varchar(20) not null, --PK
	currency integer not null
	);

alter table lourdes_martinez.currency
alter column currency type varchar(20);

alter table lourdes_martinez.currency
add constraint currency_PK primary key (id_currency);

-- FK
alter table lourdes_martinez.car_inspection
add constraint currency_FK foreign key (id_currency) 
references lourdes_martinez.currency (id_currency);




---- DML -----

-- color -- 
insert into lourdes_martinez.color
	(id_color, color)
	values('0001', 'red');
insert into lourdes_martinez.color
	(id_color, color)
	values('0002', 'black');
insert into lourdes_martinez.color
	(id_color, color)
	values('0003', 'white');
insert into lourdes_martinez.color
	(id_color, color)
	values('0004', 'blue');


-- company_group (5) --
insert into lourdes_martinez.company_group
	(id_company_group, company_group)
	values('CG0001','Volkswagen_group');
insert into lourdes_martinez.company_group
	(id_company_group, company_group)
	values('CG0002','Hyundai_group');
insert into lourdes_martinez.company_group
	(id_company_group, company_group)
	values('CG0003','Honda_group');
insert into lourdes_martinez.company_group
	(id_company_group, company_group)
	values('CG0004','Toyota_group');
insert into lourdes_martinez.company_group
	(id_company_group, company_group)
	values('CG0005','Ford_group');

-- brand (10) --
insert into lourdes_martinez.brand
	(id_brand, id_company_group, brand)
	values('B0001', 'CG0001', 'Volkswagen');
insert into lourdes_martinez.brand
	(id_brand, id_company_group, brand)
	values('B0002', 'CG0001', 'Audi');
insert into lourdes_martinez.brand
	(id_brand, id_company_group, brand)
	values('B0003', 'CG0001', 'Porsche');
insert into lourdes_martinez.brand
	(id_brand, id_company_group, brand)
	values('B0004', 'CG0001', 'Seat');
insert into lourdes_martinez.brand
	(id_brand, id_company_group, brand)
	values('B0005', 'CG0002', 'Kia');
insert into lourdes_martinez.brand
	(id_brand, id_company_group, brand)
	values('B0006', 'CG0002', 'Hyundai');
insert into lourdes_martinez.brand
	(id_brand, id_company_group, brand)
	values('B0007', 'CG0003', 'Acura');
insert into lourdes_martinez.brand
	(id_brand, id_company_group, brand)
	values('B0008', 'CG0004', 'Toyota');
insert into lourdes_martinez.brand
	(id_brand, id_company_group, brand)
	values('B0009', 'CG0004', 'Lexus');
insert into lourdes_martinez.brand
	(id_brand, id_company_group, brand)
	values('B0010', 'CG0005', 'Ford');


-- model (14)--
insert into lourdes_martinez.model
	(id_model, id_brand, model)
	values('M0001', 'B0001', 'Passat');
insert into lourdes_martinez.model
	(id_model, id_brand, model)
	values('M0002', 'B0001', 'Golf');
insert into lourdes_martinez.model
	(id_model, id_brand, model)
	values('M0003', 'B0002', 'Q8');
insert into lourdes_martinez.model
	(id_model, id_brand, model)
	values('M0004', 'B0002', 'A1');
insert into lourdes_martinez.model
	(id_model, id_brand, model)
	values('M0005', 'B0003', 'Cayenne');
insert into lourdes_martinez.model
	(id_model, id_brand, model)
	values('M0006', 'B0004', 'Ibiza');
insert into lourdes_martinez.model
	(id_model, id_brand, model)
	values('M0007', 'B0004', 'Ateca');
insert into lourdes_martinez.model
	(id_model, id_brand, model)
	values('M0008', 'B0005', 'Picanto');
insert into lourdes_martinez.model
	(id_model, id_brand, model)
	values('M0009', 'B0006', 'Tucson');
insert into lourdes_martinez.model
	(id_model, id_brand, model)
	values('M00010', 'B0007', 'Sedane');
insert into lourdes_martinez.model
	(id_model, id_brand, model)
	values('M00011', 'B0008', 'Yaris');
insert into lourdes_martinez.model
	(id_model, id_brand, model)
	values('M00012', 'B0008', 'Prius');
insert into lourdes_martinez.model
	(id_model, id_brand, model)
	values('M00013', 'B0009', 'RX');
insert into lourdes_martinez.model
	(id_model, id_brand, model)
	values('M00014', 'B0010', 'Focus');


-- company_insurance --
insert into lourdes_martinez.company_insurance
	(id_company_insurance, company_insurance)
	values('CI0001', 'Mapfre');
insert into lourdes_martinez.company_insurance
	(id_company_insurance, company_insurance)
	values('CI0002', 'AXA');
insert into lourdes_martinez.company_insurance
	(id_company_insurance, company_insurance)
	values('CI0003', 'MMT');


-- insurance (13)--
insert into lourdes_martinez.insurance
	(id_insurance, id_company_insurance, insurance_number)
	values('I1001', 'CI0001', '00521632541895');
insert into lourdes_martinez.insurance
	(id_insurance, id_company_insurance, insurance_number)
	values('I1002', 'CI0002', '0012746953814');
insert into lourdes_martinez.insurance
	(id_insurance, id_company_insurance, insurance_number)
	values('I1003', 'CI0003', '00142548665265');
insert into lourdes_martinez.insurance
	(id_insurance, id_company_insurance, insurance_number)
	values('I1004', 'CI0001', '00445788424258');
insert into lourdes_martinez.insurance
	(id_insurance, id_company_insurance, insurance_number)
	values('I1005', 'CI0002', '00698883255421');
insert into lourdes_martinez.insurance
	(id_insurance, id_company_insurance, insurance_number)
	values('I1006', 'CI0003', '00221754743600');
insert into lourdes_martinez.insurance
	(id_insurance, id_company_insurance, insurance_number)
	values('I1007', 'CI0001', '00257419856325');
insert into lourdes_martinez.insurance
	(id_insurance, id_company_insurance, insurance_number)
	values('I1008', 'CI0002', '00558472658852');
insert into lourdes_martinez.insurance
	(id_insurance, id_company_insurance, insurance_number)
	values('I1009', 'CI0003', '00214112148557');
insert into lourdes_martinez.insurance
	(id_insurance, id_company_insurance, insurance_number)
	values('I1010', 'CI0001', '00212544862568');
insert into lourdes_martinez.insurance
	(id_insurance, id_company_insurance, insurance_number)
	values('I1011', 'CI0002', '00248631954475');
insert into lourdes_martinez.insurance
	(id_insurance, id_company_insurance, insurance_number)
	values('I1012', 'CI0003', '00998516324511');
insert into lourdes_martinez.insurance
	(id_insurance, id_company_insurance, insurance_number)
	values('I1013', 'CI0001', '002014352614452');


-- cars (13) -- 
insert into lourdes_martinez.cars
	(id_car, id_model, id_color, license, total_km, purchase_date, id_insurance)
	values('C0001', 'M0001', '0003', '7785MCB', 140050, '2001-04-21', 'I1001');
insert into lourdes_martinez.cars
	(id_car, id_model, id_color, license, total_km, purchase_date, id_insurance)
	values('C0002', 'M00014', '0001', '5418CBI', 200000, '2000-08-14', 'I1002');
insert into lourdes_martinez.cars
	(id_car, id_model, id_color, license, total_km, purchase_date, id_insurance)
	values('C0003', 'M00010', '0002', '2368HMG', 8560, '2020-05-10', 'I1003');
insert into lourdes_martinez.cars
	(id_car, id_model, id_color, license, total_km, purchase_date, id_insurance)
	values('C0004', 'M0005', '0002', '2145AMS', 9580, '2019-09-03', 'I1004');
insert into lourdes_martinez.cars
	(id_car, id_model, id_color, license, total_km, purchase_date, id_insurance)
	values('C0005', 'M0009', '0004', '4816JYU', 2500, '2022-10-11', 'I1005');
insert into lourdes_martinez.cars
	(id_car, id_model, id_color, license, total_km, purchase_date, id_insurance)
	values('C0006', 'M00010', '0003', '9663DXC', 10060, '2019-10-05', 'I1006');
insert into lourdes_martinez.cars
	(id_car, id_model, id_color, license, total_km, purchase_date, id_insurance)
	values('C0007', 'M00011', '0001', '1451FPL', 11000, '2018-04-19', 'I1007');
insert into lourdes_martinez.cars
	(id_car, id_model, id_color, license, total_km, purchase_date, id_insurance)
	values('C0008', 'M0003', '0001', '8851SSD', 9000, '2018-05-26', 'I1008');	
insert into lourdes_martinez.cars
	(id_car, id_model, id_color, license, total_km, purchase_date, id_insurance)
	values('C0009', 'M0002', '0004', '8514ERA', 7500, '2020-04-21', 'I1009');
insert into lourdes_martinez.cars
	(id_car, id_model, id_color, license, total_km, purchase_date, id_insurance)
	values('C0010', 'M0005', '0003', '9526TVC', 100000, '2001-07-15', 'I1010');
insert into lourdes_martinez.cars
	(id_car, id_model, id_color, license, total_km, purchase_date, id_insurance)
	values('C0011', 'M0008', '0002', '2254GAM', 160000, '2000-01-09', 'I1011');
insert into lourdes_martinez.cars
	(id_car, id_model, id_color, license, total_km, purchase_date, id_insurance)
	values('C0012', 'M00011', '0002', '9154WDC', 1500, '2022-11-01', 'I1012');
insert into lourdes_martinez.cars
	(id_car, id_model, id_color, license, total_km, purchase_date, id_insurance)
	values('C0013', 'M00014', '0004', '8850YAP', 50400, '2018-03-21', 'I1013');
	

-- id_currency--
insert into lourdes_martinez.currency
	(id_currency, currency)
	values('001', 'euro');
insert into lourdes_martinez.currency
	(id_currency, currency)
	values('002', 'dolar');
insert into lourdes_martinez.currency
	(id_currency, currency)
	values('003', 'yen');


-- car_inspection --
insert into lourdes_martinez.car_inspection
	(id_inspection, id_car, date_inspection, kilometers, id_currency)
	values('IN0001', 'C0001', '2000-04-21', 100000,'001');
insert into lourdes_martinez.car_inspection
	(id_inspection, id_car, date_inspection, kilometers, id_currency)
	values('IN0002', 'C0002', '1999-04-21', 105000,'001');
insert into lourdes_martinez.car_inspection
	(id_inspection, id_car, date_inspection, kilometers, id_currency)
	values('IN0003', 'C0003', '2019-04-21', 7000,'002');
insert into lourdes_martinez.car_inspection
	(id_inspection, id_car, date_inspection, kilometers, id_currency)
	values('IN0004', 'C0004', '2018-04-21', 8000,'001');
insert into lourdes_martinez.car_inspection
	(id_inspection, id_car, date_inspection, kilometers, id_currency)
	values('IN0005', 'C0005', '2021-04-21', 1000,'002');
insert into lourdes_martinez.car_inspection
	(id_inspection, id_car, date_inspection, kilometers, id_currency)
	values('IN0006', 'C0006', '2018-04-21', 80000,'002');
insert into lourdes_martinez.car_inspection
	(id_inspection, id_car, date_inspection, kilometers, id_currency)
	values('IN0007', 'C0007', '2017-04-21', 10000,'002');
insert into lourdes_martinez.car_inspection
	(id_inspection, id_car, date_inspection, kilometers, id_currency)
	values('IN0008', 'C0008', '2017-04-21', 7000,'001');
insert into lourdes_martinez.car_inspection
	(id_inspection, id_car, date_inspection, kilometers, id_currency)
	values('IN0009', 'C0009', '2019-04-21', 5000,'001');
insert into lourdes_martinez.car_inspection
	(id_inspection, id_car, date_inspection, kilometers, id_currency)
	values('IN0010', 'C0010', '2000-04-21', 90000,'002');
insert into lourdes_martinez.car_inspection
	(id_inspection, id_car, date_inspection, kilometers, id_currency)
	values('IN0011', 'C0011', '1999-04-21', 120000,'001');
insert into lourdes_martinez.car_inspection
	(id_inspection, id_car, date_inspection, kilometers, id_currency)
	values('IN0012', 'C0012', '2021-04-21', 500,'002');
insert into lourdes_martinez.car_inspection
	(id_inspection, id_car, date_inspection, kilometers, id_currency)
	values('IN0013', 'C0013', '2017-04-21', 30000,'001');