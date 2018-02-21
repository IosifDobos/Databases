DROP TABLE  Game_Review;
DROP TABLE Stock_item;
DROP TABLE Supplier_Order;
DROP TABLE Sales_Rep;
DROP TABLE Whole_Sale_Suppliers;
DROP TABLE Games_galore_stock;
DROP TABLE Games;

-- Create table for Galore Games
CREATE TABLE Games(
	game_ID number(5),
	name varchar2(30) NOT NULL,
	release_date date NOT NULL,
	age_required integer NOT NULL,
	skills_required varchar(20) NOT NULL,
	CONSTRAINT game_ID_pk PRIMARY KEY(game_ID),
	CONSTRAINT age_required_chk CHECK (age_required > 18)
);

CREATE TABLE Games_galore_stock(
	stock_code number(5),
	item_type varchar(50) NOT NULL,
	item_description varchar(50) NOT NULL,
	item_Qty number NOT NULL,
	price_per_item number(5,2) NOT NULL,
	item_sellPrice number(2) NOT NULL,
	CONSTRAINT stock_code_pk PRIMARY KEY(stock_code)

);

CREATE TABLE Whole_Sale_Suppliers(
	supplier_ID number(5),
	company_name varchar(30) NOT NULL,
	email_address varchar(30) NOT NULL,
	phone_No number(10) NOT NULL,
	CONSTRAINT supplier_ID_pk PRIMARY KEY(supplier_ID),
	CONSTRAINT email_address_chk CHECK( email like '%@%')
);

CREATE TABLE Sales_Rep(
	representative_ID number(5),
	name varchar(20) NOT NULL,
	email_address varchar(30) NOT NULL,
	phone_No number(10) NOT NULL,
	CONSTRAINT representative_ID_pk PRIMARY KEY(representative_ID),
	CONSTRAINT email_address_chk CHECK(email like '%@%')
);

CREATE TABLE Supplier_Order(
	order_ID varchar(20),
	order_qty number NOT NULL,
	item_ordered varchar(20) NOT NULL,
	order_date date NOT NULL,
	representative_name varchar(30) NOT NULL,
	delivery_date date NOT NULL,
	CONSTRAINT order_ID_pk PRIMARY KEY(order_ID)
);

CREATE TABLE Stock_item(
	stock_ID_number varchar(6),
	order_supplier integer NOT NULL,
	item_ordered varchar(20) NOT NULL,
	order_qty integer NOT NULL,
	date_order date NOT NULL,
	delivered_date date NOT NULL,
	sale_rep_order varchar(20) NOT NULL,
	CONSTRAINT stock_ID_number_pk PRIMARY KEY(stock_ID_number)
);

CREATE TABLE Game_Review(
	username varchar(8),
	password varchar(8),
	email varchar(30),
	game_toBe_reviewed varchar(30),
	review_text varchar(100),
	review_date date,
	CONSTRAINT username_pk PRIMARY KEY(username),
	CONSTRAINT email_chk CHECK(email like '%@%')
);

--insert data into the Games table
INSERT INTO Games() VALUES();
INSERT INTO Games() VALUES();
INSERT INTO Games() VALUES();