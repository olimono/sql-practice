--Creamos el esquema

create schema practica_olivia_gonzalez authorization npmjcswr;


--Creamos la tabla currency
create table practica_olivia_gonzalez.currency(
	currency_id integer not null, -- PK
	name varchar(10) not null,
	currency_code varchar(3) null,
	constraint currency_PK primary key (currency_id)
	
);

--Creamos la tabla colors
create table practica_olivia_gonzalez.colors(
	color_id integer not null, --PK
	name varchar(20) not null,
	constraint color_PK primary key (color_id)
);

--Creamos la tabla groups
create table practica_olivia_gonzalez.groups_(
	group_id integer not null, --PK
	name varchar(100) not null,
	constraint groups_PK primary key (group_id)
);

--Creamos la tabla brands
create table practica_olivia_gonzalez.brands(
	brand_id integer not null, --PK
	name varchar(40) not null,
	group_id integer not null, --FK
	constraint brand_PK primary key (brand_id),
	constraint model_FK foreign key (group_id) references practica_olivia_gonzalez.groups_(group_id)

);

--Creamos la tabla models
create table practica_olivia_gonzalez.models(
	model_id integer not null, --PK
	name varchar(40) not null,
	brand_id integer not null, --FK
	constraint model_PK primary key (model_id),
	constraint model_FK foreign key (brand_id) references practica_olivia_gonzalez.brands(brand_id)
	
);

--Creamos la tabla insurance_companies
create table practica_olivia_gonzalez.insurance_companies(
	insurance_comp_id integer not null, --PK 
	name varchar(100) not null,
	constraint insurance_companies_PK primary key (insurance_comp_id)
);

--Creamos la tabla status
create table practica_olivia_gonzalez.status(
	status_id int not null,
	name varchar(15) not null,
	constraint status_PK primary key (status_id)
);

--Creamos la tabla cars
create table practica_olivia_gonzalez.cars(
	car_id varchar(10) not null, --PK
	model_id integer not null, --FK
	color_id integer not null, --FK
	plate_number varchar(8) not null,
	kms int not null,
	registration_date date not null,
	status int not null, 
	description varchar(500) null, 
	constraint cars_PK primary key (car_id),
	constraint cars_FK1 foreign key (model_id) references practica_olivia_gonzalez.models(model_id),
	constraint cars_FK2 foreign key (color_id) references practica_olivia_gonzalez.colors(color_id),
	constraint cars_FK3 foreign key (status) references practica_olivia_gonzalez.status(status_id)
);


--Creamos la tabla insurance
create table practica_olivia_gonzalez.insurance(
	car_id varchar(10) not null, --PK FK
	insurance_comp_id integer not null, --PK FK
	policy_number varchar(10) not null,
	comments varchar(500) null,
	constraint insurance_PK primary key (car_id, insurance_comp_id),
	constraint insurance_FK1 foreign key (car_id) references practica_olivia_gonzalez.cars(car_id),
	constraint insurance_FK2 foreign key (insurance_comp_id) references practica_olivia_gonzalez.insurance_companies(insurance_comp_id)
	
);

--Creamos la tabla maintenance
create table practica_olivia_gonzalez.maintenance(
	car_id varchar(10) not null, --PK FK
	maintenance_number integer not null, --PK
	kms integer not null, 
	date_maintenance date not null,
	cost_maintenance integer not null,
	currency_id integer not null, --FK
	constraint maintenance_PK primary key (car_id, maintenance_number),
	constraint maintenance_FK foreign key (car_id) references practica_olivia_gonzalez.cars(car_id)
);


--Insertamos los datos:

--en la tabla currency
insert into practica_olivia_gonzalez.currency (currency_id, name) values (01, 'EUR');
insert into practica_olivia_gonzalez.currency (currency_id, name) values (02, 'USD');

--en la tabla colors
insert into practica_olivia_gonzalez.colors (color_id, name) values (999, 'negro');
insert into practica_olivia_gonzalez.colors (color_id, name) values (998, 'blanco');
insert into practica_olivia_gonzalez.colors (color_id, name) values (996, 'azul');

--en la tabla groups
insert into practica_olivia_gonzalez.groups_ (group_id, name) values (001, 'Hyunday Motor Co');
insert into practica_olivia_gonzalez.groups_ (group_id, name) values (002, 'Grupo Volkswagen');

--en la tabla brands
insert into practica_olivia_gonzalez.brands (brand_id, name, group_id) values (01, 'Seat', 002);
insert into practica_olivia_gonzalez.brands (brand_id, name, group_id) values (02, 'Volkswagen', 002);
insert into practica_olivia_gonzalez.brands (brand_id, name, group_id) values (03, 'Kia', 001);


--en la tabla models
insert into practica_olivia_gonzalez.models (model_id, name, brand_id) values (01, 'Sportage', 03);
insert into practica_olivia_gonzalez.models (model_id, name, brand_id) values (02, 'Niro', 03);
insert into practica_olivia_gonzalez.models (model_id, name, brand_id) values (03, 'Golf', 02);
insert into practica_olivia_gonzalez.models (model_id, name, brand_id) values (04, 'Arona', 01);
insert into practica_olivia_gonzalez.models (model_id, name, brand_id) values (05, 'Ateca', 01);
insert into practica_olivia_gonzalez.models (model_id, name, brand_id) values (06, 'Tuareg', 02);


--en la tabla status
insert into practica_olivia_gonzalez.status (status_id, name) values (0, 'not active');
insert into practica_olivia_gonzalez.status (status_id, name) values (1, 'active');

--en la tabla cars
insert into practica_olivia_gonzalez.cars (car_id ,model_id ,color_id ,plate_number, kms, registration_date, status) values( 'A01',02, 999, '46772LXL', 159000, '2020-05-05', 1);
insert into practica_olivia_gonzalez.cars (car_id ,model_id ,color_id ,plate_number, kms, registration_date, status) values( 'A02',03, 999, '46772LXL', 159000, '2020-05-05', 1);
insert into practica_olivia_gonzalez.cars (car_id ,model_id ,color_id ,plate_number, kms, registration_date, status) values( 'A03',06, 998, '46772LXL', 159000, '2020-05-05', 0);
insert into practica_olivia_gonzalez.cars (car_id ,model_id ,color_id ,plate_number, kms, registration_date, status) values( 'A04',06, 998, '46772LXL', 159000, '2020-05-05', 0);
insert into practica_olivia_gonzalez.cars (car_id ,model_id ,color_id ,plate_number, kms, registration_date, status) values( 'A05',04, 998, '46772LXL', 159000, '2020-05-05', 1);
insert into practica_olivia_gonzalez.cars (car_id ,model_id ,color_id ,plate_number, kms, registration_date, status) values( 'A06',05, 996, '46772LXL', 159000, '2020-05-05', 0);
insert into practica_olivia_gonzalez.cars (car_id ,model_id ,color_id ,plate_number, kms, registration_date, status) values( 'B07',01, 999, '46772LXL', 200, '2022-05-05', 1);
insert into practica_olivia_gonzalez.cars (car_id ,model_id ,color_id ,plate_number, kms, registration_date, status) values( 'B08',01, 999, '46772LXL', 0, '2022-05-05', 1);


--en la tabla maintenance
insert into practica_olivia_gonzalez.maintenance (car_id, maintenance_number, kms, date_maintenance, cost_maintenance, currency_id ) values ('A01', 1, 50000, '2021-05-05', 200, 1);
insert into practica_olivia_gonzalez.maintenance (car_id, maintenance_number, kms, date_maintenance, cost_maintenance, currency_id ) values ('A02', 1, 50000, '2021-05-05', 200, 1);
insert into practica_olivia_gonzalez.maintenance (car_id, maintenance_number, kms, date_maintenance, cost_maintenance, currency_id ) values ('A03', 1, 50000, '2021-05-05', 200, 1);
insert into practica_olivia_gonzalez.maintenance (car_id, maintenance_number, kms, date_maintenance, cost_maintenance, currency_id ) values ('A04', 1, 50000, '2021-05-05', 350, 1);
insert into practica_olivia_gonzalez.maintenance (car_id, maintenance_number, kms, date_maintenance, cost_maintenance, currency_id ) values ('A05', 1, 50000, '2021-05-05', 350, 2);
insert into practica_olivia_gonzalez.maintenance (car_id, maintenance_number, kms, date_maintenance, cost_maintenance, currency_id ) values ('A06', 1, 50000, '2021-05-05', 200, 2);
insert into practica_olivia_gonzalez.maintenance (car_id, maintenance_number, kms, date_maintenance, cost_maintenance, currency_id ) values ('A04', 2, 100000, '2022-05-05', 200, 1);
insert into practica_olivia_gonzalez.maintenance (car_id, maintenance_number, kms, date_maintenance, cost_maintenance, currency_id ) values ('A05', 2, 100000, '2022-05-05', 200, 2);
insert into practica_olivia_gonzalez.maintenance (car_id, maintenance_number, kms, date_maintenance, cost_maintenance, currency_id ) values ('A06', 2, 100000, '2022-05-05', 200, 2);


--en la tabla insurance_companies
insert into practica_olivia_gonzalez.insurance_companies (insurance_comp_id, name) values (01, 'Mutua Madrileña');
insert into practica_olivia_gonzalez.insurance_companies (insurance_comp_id, name) values (02, 'Race');

--en la tabla insurance
insert into practica_olivia_gonzalez.insurance (car_id, insurance_comp_id, policy_number) values ('A01', 01, 78786);
insert into practica_olivia_gonzalez.insurance (car_id, insurance_comp_id, policy_number) values ('A02', 01, 888374);
insert into practica_olivia_gonzalez.insurance (car_id, insurance_comp_id, policy_number) values ('A03', 01, 784374);
insert into practica_olivia_gonzalez.insurance (car_id, insurance_comp_id, policy_number) values ('A04', 01, 873942);
insert into practica_olivia_gonzalez.insurance (car_id, insurance_comp_id, policy_number) values ('A05', 02, 8437800);
insert into practica_olivia_gonzalez.insurance (car_id, insurance_comp_id, policy_number) values ('A06', 02, 8437802);
insert into practica_olivia_gonzalez.insurance (car_id, insurance_comp_id, policy_number) values ('B07', 01, 7389);
insert into practica_olivia_gonzalez.insurance (car_id, insurance_comp_id, policy_number) values ('B08', 01, 89878);











