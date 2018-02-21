/*
	A database created for Linda`s Lighting Emporium lighting shop. 
	Created by: Iosif Dobos
				C16735789
				DT228/2 BSc In Computer Science
	Copyright by Iosif Dobos @ all rights are reserved!!!
*/

/*
    The droping table statement is used to drop an existing table in a database
    When droping a table will result in losing all the data in the table and all the indexes
    associated with it
*/
-- Droping Table --
DROP TABLE SpecProd;
DROP TABLE Product;
DROP TABLE Specification;
DROP TABLE ProdType;
DROP TABLE Designer;
DROP TABLE Client;

/*
	 Create Linda`s Client table including client ID which is the primary key, including client
	 name, client email address which must be unique and in a form of example@gmail.com
*/
CREATE TABLE Client(
	clientID number(6),
	fullName varchar2(50) NOT NULL,
	emailAdr varchar2(30) NOT NULL,
	CONSTRAINT clientID_pk PRIMARY KEY(clientID),
	CONSTRAINT emailAdr_uk UNIQUE(emailAdr),
	CONSTRAINT emailAdr_chk CHECK (emailAdr LIKE '%@%.%')	
);
/*
	Create Linda`s Designer table including designer ID which is primary key/unique, including
	designer name, designer email address(which must be unique and in the form of example@joe.com) 
    and designer rate of pay which must me less than 75.99 
*/
CREATE TABLE Designer(
	designerID number(6),
	dName varchar2(50) NOT NULL,
    cEmailAdr varchar2(30) NOT NULL,
	dRateofPay number(4,2) NOT NULL,
	CONSTRAINT designerID_pk PRIMARY KEY(designerID),
	CONSTRAINT cEmailAdr_uk UNIQUE(cEmailAdr),
	CONSTRAINT cEmailAdr_chk CHECK (cEmailAdr like '%@%.%'),
	CONSTRAINT dRateofPay_chk CHECK( dRateofPay < 75.99 )
);
/*
	Create Linda`s Specification table which include the specification ID(primary key/unique),
	icluding specification date, specification Description, specification commision, designer
	hours worked, client id which is the foreign key in this table and primary key in Client 
	table, designer ID(foreign key in thi table, primary key in Design table). Including the
	CONSTRAINTS like specCommision to be less or equal 16000, designHrsWorked less or equal 150
*/
CREATE TABLE Specification(
	specID number(6),
	specDate date NOT NULL,
	specDesc varchar2(50) NOT NULL,
	specCommision number(7,2)NOT NULL,
	designHrsWorked number(3)NOT NULL,
    clientID number(6),
    designerId number(6),
	CONSTRAINT specID_pk PRIMARY KEY(specID),
	CONSTRAINT clientID_fk FOREIGN KEY(clientID) REFERENCES Client(clientID),
	CONSTRAINT designerID_fk FOREIGN KEY(designerID) REFERENCES Designer(designerID),
	CONSTRAINT specCommision_chk CHECK ( specCommision <= 16000  ),
	CONSTRAINT designHrsWorked_chk CHECK ( designHrsWorked <= 150)
);
/*
	Create Linda`s Product Type table incuding product category(primary key) and category
	description 
*/
CREATE TABLE ProdType(
	prodCat char(1),
	catDesc varchar2(50) NOT NULL,
	CONSTRAINT prodCat_pk PRIMARY KEY(prodCat)
);

/*
	Create Linda`s Product table including prodId(primary key), catDesc, prodDesc,prodPrice
	prodQtyInStock. Adding constraint prodID,prodCat Primary Key and check prodPrice which must 
	be between €5.00 and €45.50 
*/
CREATE TABLE Product(
	prodID number(6),
    catDesc varchar2(20),
	prodDesc varchar2(50) NOT NULL,
	prodPrice number(4,2) NOT NULL,
	prodQtyInStock number(3) NOT NULL,
    prodCat char(1),
	CONSTRAINT prodID_pk PRIMARY KEY(prodCat,prodID),
	CONSTRAINT prodPrice_chk CHECK ( prodPrice BETWEEN 5.00 AND 45.50)
);
/*
	Create Linda`s Product Specification table including qtyUsed, specID, prodId and prodCat,
	adding constraints like specId(foreign kei in this table) with references to Specification
	(including the primary key specID) and prodID(foreign key in this table) with references to
	Product table(including prodCat and prodID)

*/
CREATE TABLE SpecProd(
	qtyUsed number(3),
    specID number(6),
    prodID number(6),
    prodCat char(1),
    --CONSTRAINT qtyUsed_pk PRIMARY KEY (prodCat, specID, prodID),--
	CONSTRAINT specID_fk FOREIGN KEY (specID) REFERENCES Specification(specID),
	CONSTRAINT prodID_fk FOREIGN KEY(prodCat, prodID) REFERENCES Product(prodCat, prodID)
);

 /* Insert data into the  Linda`s Lighting client list table 
    including the clientID number, client full name and email address
 */
 INSERT INTO Client ( clientID, fullName, emailAdr) VALUES ( 101, 'J.J.Abrams', 'jjab@sw.com');
 INSERT INTO Client ( clientID, fullName, emailAdr) VALUES ( 201, 'Lawrence Kasdan', 'lkas@sw.com');
 INSERT INTO Client ( clientID, fullName, emailAdr) VALUES ( 301, 'Daisy Ridley', 'drid@sw.com');
 INSERT INTO Client ( clientID, fullName, emailAdr) VALUES ( 401, 'John Boyega', 'jboy@sw.com');

/*
	Insert data into the Linda`s Lighting List table including, designerID, designerName
	designer email address and hourly rate of pay
*/
 INSERT INTO Designer ( designerID, dName, cEmailAdr, dRateofPay) 
 	VALUES ( 101, 'Kelly Hoppen', 'khop@gmail.com.uk', 65.00);
 INSERT INTO Designer ( designerID, dName, cEmailAdr, dRateofPay) 
 	VALUES ( 201, 'Philippe Starck', 'pstark@stark.com', 72.50);
 INSERT INTO Designer ( designerID, dName, cEmailAdr, dRateofPay) 
 	VALUES ( 301, 'Victoria Hagan', 'vichag@gmail.com', 75.00);
 INSERT INTO Designer ( designerID, dName, cEmailAdr, dRateofPay) 
 	VALUES ( 401, 'Marmol Radziner', 'marmrad@gmail.com', 45.50);

 /*
	Insert data into the Linda`s product list table, including the product category,
	productID, poduct description, product price and the stock qunatity for the 
	respective product
*/
  INSERT INTO Product ( prodCat, catDesc, prodID, prodDesc, prodPrice, prodQtyInStock)
 	 VALUES ('G', 'Garden Lighting', 101, 'Outdoor Wall Light', 40.00, 26);
 INSERT INTO Product (prodCat, catDesc, prodID, prodDesc, prodPrice, prodQtyInStock)
 	 VALUES ('G','Garden Lighting', 102, 'Patio Lights', 41.00, 27);
 INSERT INTO Product (prodCat, catDesc, prodID, prodDesc, prodPrice, prodQtyInStock)
 	 VALUES ('L','Lamps and Bulbs', 101, 'E14 Energy Saving Bulb', 6.00, 28);
 INSERT INTO Product (prodCat, catDesc, prodID, prodDesc, prodPrice, prodQtyInStock)
 	 VALUES ('L','Lamps and Bulbs', 102, 'E27 Led Bulb', 9.00, 30);
 INSERT INTO Product (prodCat, catDesc,prodID, prodDesc, prodPrice, prodQtyInStock)
 	 VALUES ('C','Cables', 101, '2-Core Black Braided Flexible', 10.00, 50);
 INSERT INTO Product (prodCat, catDesc, prodID, prodDesc, prodPrice, prodQtyInStock)
 	 VALUES ('C','Cables', 102, 'Southwire 250-Ft 2-Conductor Landscape Lighting', 11.00, 79);
 INSERT INTO Product (prodCat, catDesc, prodID, prodDesc, prodPrice, prodQtyInStock)
 	 VALUES ('X','Christmas', 101, 'LED string lights German Christmas 10-ligth', 15.50, 50);
 INSERT INTO Product (prodCat, catDesc, prodID, prodDesc, prodPrice, prodQtyInStock)
 	 VALUES ('X','Christmas', 102, 'LED heart string lights', 20.00, 12);
 INSERT INTO Product (prodCat, catDesc, prodID, prodDesc, prodPrice, prodQtyInStock)
 	 VALUES ('S','Shades', 101, 'Fabric Cylinder Shade Red', 30.00, 100);

/*
	Insert data into the Linda`s recent specification table including specificationID,
	clientID, designerID, date, specification description, commision charged and 
	hours worked
*/

 INSERT INTO Specification (specID, clientID, designerID, specDate, specDesc, specCommision, designHrsWorked) 
 	VALUES ( 101, 101, 101, '12 Jun 2017', 'Full House', 10000, 10 );
 INSERT INTO Specification (specID, clientID, designerID, specDate, specDesc, specCommision, designHrsWorked) 
 	VALUES ( 102, 101, 101, '14 Jul 2017', 'Garden Patio', 12000, 20);
 INSERT INTO Specification (specID, clientID, designerID, specDate, specDesc, specCommision, designHrsWorked) 
 	VALUES ( 103, 201, 301, '15 Aug 2017', 'Summerhouse', 8000, 5);
 INSERT INTO Specification (specID, clientID, designerID, specDate, specDesc, specCommision, designHrsWorked) 
 	VALUES ( 104, 301, 201, '10 Sep 2017', 'Christmas Decorations', 5000, 5);

/*
	Insert data into the Specification Product table including  specID, prodCat, prodID and qtyUsed
*/
INSERT INTO SpecProd ( specID, prodCat, prodID, qtyUsed ) VALUES ( 101, 'L', 101, 20 );
INSERT INTO SpecProd ( specID, prodCat, prodID, qtyUsed ) VALUES ( 101, 'L', 102, 30 );
INSERT INTO SpecProd ( specID, prodCat, prodID, qtyUsed ) VALUES ( 101, 'C', 101, 10 );
INSERT INTO SpecProd ( specID, prodCat, prodID, qtyUsed ) VALUES ( 102, 'G', 101, 20 );
INSERT INTO SpecProd ( specID, prodCat, prodID, qtyUsed ) VALUES ( 102, 'G', 101, 25 );
INSERT INTO SpecProd ( specID, prodCat, prodID, qtyUsed ) VALUES ( 103, 'C', 101, 10 );
INSERT INTO SpecProd ( specID, prodCat, prodID, qtyUsed ) VALUES ( 103, 'C', 102, 3 );
INSERT INTO SpecProd ( specID, prodCat, prodID, qtyUsed ) VALUES ( 103, 'X', 101, 20 );

/*
	Insert data int Linda`s product type table including product category and category description
*/
 INSERT INTO ProdType ( prodCat, catDesc) VALUES ( 'G', 'Garden Lighting');
 INSERT INTO ProdType ( prodCat, catDesc) VALUES ( 'L', 'Lamps and Bulbs');
 INSERT INTO ProdType ( prodCat, catDesc) VALUES ( 'C', 'Cables');
 INSERT INTO ProdType ( prodCat, catDesc) VALUES ( 'X', 'Christmas');
 INSERT INTO ProdType ( prodCat, catDesc) VALUES ( 'S', 'Shades');

 --Select statements for Linda`s requires reports --
 /*
	1. A listing for all designers of the specifications they have worked on including in the output their name, 
	email address and a 10 character description of the specification in uppercase sorted in descending order of 
	designer id and then specification description.
    In this select statement will create a table including designer name, designer email address and specification 
    description from Designer table joining Specification table withe the primary key(designerID) to print specification
    description form Specification table and listing all the information in descending order.
 */
 SELECT dName, cEmailAdr, designerID, SUBSTR(specDesc, 0, 10)AS "Specification Description" 
 FROM Designer JOIN Specification USING(designerID)
 ORDER BY designerID DESC, specDesc DESC ; 

/*
	2. A listing of all products. Including one column which combines the product ID and the product category code; 
	the product category description (in uppercase);  product description (in uppercase); product price (preceded 
	by the Euro symbol). The listing should be sorted by product category description in ascending order and 
	descending order of product price within each category.
    
    In this select statement will list all information from Product table including the product category and product ID 
    concatenate them in a single column as productUsed, category description in upper case, product description in upper
    case, and product price as L999,999,99 with € currency, listing in ascending order by catDescription and in descending
    order by prodPrice
*/
SELECT CONCAT(prodCat, prodID) AS productUsed, UPPER(catDesc) AS categoryDescription, UPPER(prodDesc)AS productDescrition, 
            TO_CHAR( prodPrice, 'L999,999,99', 'NLS_CURRENCY = €' ) AS productPrice
FROM Product
ORDER BY catDesc ASC, prodPrice DESC;

/*
	3. A listing of all specifications showing the specification ID, client ID, client name, specification 
	description, specification date (formatted as dd/mm/yyyy) and specification commission(including the Euro 
	symbol) sorted in descending order of commission.
    
    This select statement is using joining table Specification and Client to list the specification ID, client ID,
    client full name, and specfication description, specification date in format of dd/mm/yyyy, specification commision
    in format of €999,9999,99 and listing the table in order by specification description in 
    descending order.
*/
SELECT specID, clientID, fullName, specDesc, 
        TO_CHAR(specDate, 'dd/mm/yyyy') AS specificationDate, 
        TO_CHAR(specCommision,'L999,999.99', 'NLS_CURRENCY = €') AS specificationCommision
FROM Specification join Client using (clientID)
ORDER BY specCommision DESC; 

/*
	4. A listing of all specifications showing the specification ID, client ID, client name, designer ID, 
	designer name, specification description, specification date (formatted as dd/mm/yyyy) and specification 
	commission(including the Euro symbol) sorted in descending order of commission. the following headers should 
	be used SPECIFICATION ID CLIENT NAME DESIGNER NAME DESCRIPTION COMMISSION DATE COMMISSION AMT
    
    Creating a select statement using Specification table joining Client(primary key clientID) and Designer(primary key designerID) table
    to list the specification ID in uppercase, client ID, client full name in uppercase, designer ID, designer name in uppercase, specification
    description in uppercase, specifiction date and specification commision, ordered in descending order of specification commision
*/
SELECT  UPPER(specID) As "specificationID", clientID, UPPER(fullName) AS "Client Name", designerID, 
        UPPER(dName) AS "Designer Name", UPPER(specDesc) AS "specDescription",
        TO_CHAR(specDate, 'dd/mm/yyyy') AS specDate,  
        TO_CHAR(specCommision, 'L999,999.99', 'NLS_CURRENCY = € ' ) AS specCommision
FROM Specification  
    join Client using(clientID) 
    join Designer using(designerID)
ORDER BY specCommision DESC;

/*
	5. A listing for each product used as part of a specification the specification ID, specification description, 
	the product name, product price, number of each product used and a total price per product per specification 
	(price x quantity used).
    Creating a select statement that will list the product ID, specification description, product description,
    product price, quanty used and the sum of product price * quanity used as total price, from SpecProd joining
    Product table and Specification.
*/
SELECT prodID, specID, specDesc, prodDesc, TO_CHAR(prodPrice, 'L999,999,99', 'NLS_CURRENCY = €' )AS "Product Price", qtyUsed, 
        TO_CHAR(prodPrice * qtyUsed, 'L999,999,99', 'NLS_CURRENCY = €') AS "Total Price" 
FROM SpecProd 
join Product using(prodID, prodCat)
join Specification using (specID);

/*
	6. A listing for each specification including the specification ID, specification description and total cost 
	of the specification (commission + Sum of price x product price for all products used).
	Hint: Involves a group 
    Create a select statement that print all the column above including the total price of specification commision plus
    the sum of product price multiply quantity used in a new column called total price, grouped in order as specID,
    specDescm prodPrice, qtyUsed, specCommision and the Total Price
*/
SELECT specID, specDesc, TO_CHAR(prodPrice, 'L999,999,99', 'NLS_CURRENCY = €') AS ProductPrice, qtyUsed, TO_CHAR(specCommision, 'L999,999,99', 'NLS_CURRENCY = €')
        AS SpecificationCommision, 
        TO_CHAR(specCommision  + SUM(prodPrice * qtyUsed), 'L999,999,99', 'NLS_CURRENCY = € ') As "Total Price"
FROM SpecProd
join Specification using(specID)
join Product using(prodID, prodCat)
group by specID, specDesc, prodPrice, qtyUsed, specCommision  ;

/*
	7. A listing showing details required for report 6 but including an additional column in the output which 
	categorises the specification as ‘High Value’ if the total cost is > 10,000, ‘Medium Cost’ if the total cost 
	is between 8,000 and 10,000 and ‘Low Cost’ otherwise.
	Hint: Involves a selection
    
    Create a select statement showing the detailsas in report 6 joing SpecProd table, Specification tble and Product table
    and create a case(like an if statement) specifing if total sum of specCommision + (prodPrice * qtyUsed) is greather than 10,000€ then add a new
    column saying High Value, it the toal sum is in a range between €8,000 AND €10,000 put a Mediun Cost, otherwise if the total sum
    is less then €8,000 add to the column Low Cost, group them togheter by specID, specDesc, prodPrice, qtyUsed and specCommision.
*/
SELECT specID, specDesc, TO_CHAR(prodPrice, 'L999,999,99', 'NLS_CURRENCY = €')AS ProductPrice, qtyUsed, 
        TO_CHAR(specCommision, 'L999,999,99', 'NLS_CURRENCY = €' )AS SpecificationCommision, 
        TO_CHAR( specCommision  + SUM(prodPrice * qtyUsed), 'L999,999,99', 'NLS_CURRENCY = €') AS TotalPrice,
CASE
WHEN specCommision  + SUM(prodPrice * qtyUsed)  > 10000 THEN 'High Value'
WHEN specCommision  + SUM(prodPrice * qtyUsed)  BETWEEN 8000 AND 10000 THEN 'Medium Cost'
ELSE 'Low Cost'
END
AS SpecificationCategory
FROM SpecProd
join Specification using(specID)
join Product using(prodID, prodCat)
group by specID, specDesc, prodPrice, qtyUsed, specCommision  ;

/*
	8. A listing showing details required for report 6 but including only specifications with a total cost more 
	than 10000. Output should in the form of a sentence for each specification and the output column should be 
	called ‘High Value Specifications’. All numeric fields should be formatted appropriately for 
	numerical/monetary field and trimmed of leading spaces to give a consistent output. E.g.
	Specification 102 Garden Patio used a total of 45 products at a cost of €1825.00 and the total cost including 
	commission was €13825.00
	Hint: involves a group but including only selected values in the output with all output concatenated.
    
    Create a select statement using a concatenate string and concatente the specID, specDesc, qtyUsed, prodPrice and
    the total sum of specCommision + (prodPrice + qtyUsed) in a single table called High Value Specification, where the total sum
    is greather then €10,000 from SpecProd table joing Specification table and Product table group them by specID, specDesc, prodPrice,
    qtyUsed and specCommision.
*/
SELECT 'Specification ' ||specID|| ' ' ||specDesc|| ' used a total of ' ||qtyUsed|| ' products at a cost of '|| TRIM( TO_CHAR(prodPrice, 'L999,999,99', 'NLS_CURRENCY= €') )|| 
        ' and the total cost including comission was ' || TRIM(TO_CHAR(specCommision + SUM(prodPrice * qtyUsed), 'L999,999,99', 'NLS_CURRENCY = €' ) )
AS "High Value Specification"
FROM SpecProd
join Specification using(specID)
join Product using(prodID, prodCat)
group by specID, specDesc, prodPrice, qtyUsed, specCommision  
having specCommision + SUM(prodPrice * qtyUsed) > 10000;
