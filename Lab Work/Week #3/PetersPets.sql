DROP TABLE Species;
DROP TABLE Animal;
DROP TABLE AnimalSale;
DROP TABLE Customer;

-- Create the table for Peter`s Pets
CREATE TABLE Customer(
	custID NUMBER(6) PRIMARY KEY;
	custName VARCHAR2(30),
	custEmail VARCHAR2(50)
)

CREATE TABLE  AnimalSale(
	animalID NUMBER(6) PRIMARY KEY,
	saleDate DATE
)

CREATE TABLE Animal(
	animalID number(6) PRIMARY KEY,
	animalName varchar(30),
	speciesCode number(6)
)

CREATE TABLE Species(
	speciesCode number(6) PRIMARY KEY,
	speciesName varchar(30),
	speciesPrice number(5,2)
)

-- Inset data into the table
INSERT INTO Customer( custID, custName, custEmail) VALUES (
	1, "D. Smith", "dsmith@yahoo.co.uk");
INSERT INTO Customer( custID, custName, custEmail) VALUES (
	2, "B. Byrne", "bb@gmail.com");
INSERT INTO Customer( custID, custName, custEmail) VALUES (
	2, "B. Byrne", "bb@gmail.com");
INSERT INTO Customer( custID, custName, custEmail) VALUES (
	3, "X. Dobbs");
INSERT INTO Customer( custID, custName, custEmail) VALUES (
	2, "B. Byrne", "bb@gmail.com");

INSERT INTO AnimalSale (animalID, saleDate) VALUES ( 000001, "01 Jun 2017" );
INSERT INTO AnimalSale (animalID, saleDate) VALUES ( 000002, "11 Jun 2017" );
INSERT INTO AnimalSale (animalID, saleDate) VALUES ( 000003, "12 Mar 2017" );
INSERT INTO AnimalSale (animalID, saleDate) VALUES ( 000004, "04 Sep 2017" );
INSERT INTO AnimalSale (animalID, saleDate) VALUES ( 000005, "04 Sep 2017" );
INSERT INTO AnimalSale (animalID, saleDate) VALUES ( 000006, "" );
INSERT INTO AnimalSale (animalID, saleDate) VALUES ( 000007, "" );

INSERT INTO Animal( animalID, animalName, speciesCode) VALUES ( 000001, "Tiny", 123456 ) ;
INSERT INTO Animal( animalID, animalName, speciesCode) VALUES ( 000002, "Prince", 123457) ;
INSERT INTO Animal( animalID, animalName, speciesCode) VALUES ( 000003, "CJ", 123458 ) ;
INSERT INTO Animal( animalID, animalName, speciesCode) VALUES ( 000004, "Sid", 123459 ) ;
INSERT INTO Animal( animalID, animalName, speciesCode) VALUES ( 000005, "Sid", 123460 ) ;
INSERT INTO Animal( animalID, animalName, speciesCode) VALUES ( 000006, "Danger", 123460 ) ;
INSERT INTO Animal( animalID, animalName, speciesCode) VALUES ( 000007, "Bonnie", 123462 ) ;

INSERT INTO Species ( speciesCode, speciesName, speciesPrice) VALUES ( 123456, "Dog", 009.99);
INSERT INTO Species ( speciesCode, speciesName, speciesPrice) VALUES ( 123457, "Dog", 009.99);
INSERT INTO Species ( speciesCode, speciesName, speciesPrice) VALUES ( 123458, "Cat", 010.20);
INSERT INTO Species ( speciesCode, speciesName, speciesPrice) VALUES ( 123459, "Cat", 010.20);
INSERT INTO Species ( speciesCode, speciesName, speciesPrice) VALUES ( 123460, "Snake", 020.00);
INSERT INTO Species ( speciesCode, speciesName, speciesPrice) VALUES ( 123460, "Mouse", 005.00);
INSERT INTO Species ( speciesCode, speciesName, speciesPrice) VALUES ( 123462, "Dog", 09.99);
	commit;