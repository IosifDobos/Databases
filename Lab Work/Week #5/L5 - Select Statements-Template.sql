/* This script contains the SQL to accompany Lecture 5. 
SECTION ONE contains the SQL needed to create tables and insert data for our Game Shop that we worked
on in Week4 

SECTION TWO contains templates for SQL statements to retrieve data using comparison operators and logical conditions
You should replace these as we go through with the correct SQL to work for our game shop


SECTION THREE contains templates fo SQL statements to retrieve data from multple tables using INNER JOINS
You should replace these as we go through with the correct SQL to work for our game shop
*/

--SECTION ONE Create the tables and insert the data
-- Drop all the tables
-- Tables need to be dropped in a particular order to respect foreign key constraints.
DROP TABLE MM_Game_Type CASCADE CONSTRAINTS PURGE;
DROP TABLE MM_Customer CASCADE CONSTRAINTS PURGE;
DROP TABLE MM_Game CASCADE CONSTRAINTS PURGE;
DROP TABLE MM_Rental CASCADE CONSTRAINTS PURGE;


/* MM_Game_Type table  will store game categories each type has a code (game_type_id) and a description
- means you reduce the amount of data stored within the MM_Game table
Primary key is game_type_id  */
CREATE TABLE MM_Game_Type
     (game_type_id   NUMBER(2),
      game_type_description VARCHAR(20) NOT NULL,
      CONSTRAINT game_type_id_pk PRIMARY KEY (game_type_id));
	  
/* MM_Customer table will be used to store details about customers of the rental shop
*/
CREATE TABLE MM_Customer
   (customer_id  NUMBER(5),
   lastname     VARCHAR(20) NOT NULL,
   firstname    VARCHAR(20) NOT NULL,
   email		varchar(50)  NOT NULL,
   credit_card  VARCHAR(12)  NOT NULL,
   on_mailing_list CHAR(1) DEFAULT 'Y',
   CONSTRAINT customer_custid_pk PRIMARY KEY (customer_id),
   CONSTRAINT on_mailing_list_chk CHECK (on_mailing_list IN ('Y', 'N')),
   CONSTRAINT email_chk CHECK (email like '%@%')
   );
   
/* MM_Customer table will be used to store details about customers of the rental shop
*/   
CREATE TABLE MM_Game
     (game_id     NUMBER(5),
      game_title  VARCHAR(40) NOT NULL,
      game_type_id   NUMBER(2),
      game_price  NUMBER(5,2) NOT NULL,
      game_qty NUMBER(2) NOT NULL,
      CONSTRAINT games_id_pk PRIMARY KEY (game_id),
      CONSTRAINT game_type_fk FOREIGN KEY (game_type_id)
            REFERENCES MM_Game_Type(game_type_id),
	  CONSTRAINT price_chk CHECK (game_price > 8),
	  CONSTRAINT qty_chk CHECK(game_qty between 1 and 20)
				
);

-- MM_Rental table stores details of all transactions of the shop - rental of games  			
CREATE TABLE MM_Rental
      (rental_id NUMBER(5),
       customer_id   NUMBER(4),
       game_id      NUMBER(4),
       checkout_date DATE DEFAULT SYSDATE,
       return_date  DATE,
       CONSTRAINT rentals_pk PRIMARY KEY (rental_id),
       CONSTRAINT customer_id_fk FOREIGN KEY (customer_id)
            REFERENCES MM_Customer(customer_id),
       CONSTRAINT game_id_fk FOREIGN KEY (game_id)
            REFERENCES MM_Game(game_id));
			

-- insert data into the customer table
INSERT INTO MM_Customer (customer_id, lastname, firstname, email,  credit_card, on_mailing_list)
   VALUES (10, 'Robinson', 'Mary', 'mrobin@aras.ie', '111111111','N');
-- for this next insert the default value for on_mailing_list should be used as it is not provided
INSERT INTO MM_Customer (customer_id, lastname, firstname, email, credit_card)
   VALUES (11, 'McAleese', 'Mary', 'mmcal@aras.ie', '222222222');
INSERT INTO MM_Customer (customer_id, lastname, firstname,  email, credit_card, on_mailing_list)
   VALUES (12, 'Higgins', 'Michael D.','mickd@aras.ie', '333333333',  'Y');
INSERT INTO MM_Customer (customer_id, lastname, firstname,  email, credit_card, on_mailing_list)
   VALUES (13, 'Hillery', 'Patrick', 'phill@aras.ie', '444444444', 'N');
INSERT INTO MM_Customer (customer_id, lastname, firstname,  email, credit_card, on_mailing_list)
   VALUES (14, 'Childers', 'Erskine', 'erskchil@aras.ie', '555555555',  'Y');
   
 -- insert data into the game type table  
INSERT INTO MM_Game_Type (game_type_id, game_type_description)
  VALUES ( '1', 'Adventure');
INSERT INTO MM_Game_Type (game_type_id, game_type_description)
  VALUES ( '2', 'Combat');
INSERT INTO MM_Game_Type (game_type_id, game_type_description)
  VALUES ( '3', 'Simulation');
INSERT INTO MM_Game_Type (game_type_id, game_type_description)
  VALUES ( '4', 'Action');
INSERT INTO MM_Game_Type (game_type_id, game_type_description)
  VALUES ( '5', 'Sports');
  
-- insert data into the game table (game type table needs to have data in it before we can do this : Foreign Key)
INSERT INTO MM_Game (game_id, game_title, game_type_id, game_price, game_qty)
  VALUES (1, 'Discworld Noir', '1', 10.00, 5);
INSERT INTO MM_Game (game_id, game_title, game_type_id, game_price, game_qty)
  VALUES (2, 'Soma', '1', 9.00, 3);
INSERT INTO MM_Game (game_id, game_title, game_type_id, game_price, game_qty)
  VALUES (3, 'Indiana Jones and  the Fate of Atlantis', '1', 15.00, 11);
INSERT INTO MM_Game (game_id, game_title, game_type_id, game_price, game_qty)
  VALUES (4,'Bayonetta', '2', 9.00, 2);
INSERT INTO MM_Game (game_id, game_title, game_type_id, game_price, game_qty)
  VALUES (5, 'Doom', '2', 9.00,1);
INSERT INTO MM_Game (game_id, game_title, game_type_id, game_price, game_qty)
  VALUES (6, 'Flight Simulator X', '3', 9.00,2);
INSERT INTO MM_Game (game_id, game_title, game_type_id, game_price, game_qty)
  VALUES (7, 'F1 2015', '3', 9.00,1);
INSERT INTO MM_Game (game_id, game_title, game_type_id, game_price, game_qty)
  VALUES (8, 'Titan Fall 2', '4', 9.00,1);
INSERT INTO MM_Game (game_id, game_title, game_type_id, game_price, game_qty)
  VALUES (9, 'Battlefield I', '4', 9.00,3);
INSERT INTO MM_Game (game_id, game_title, game_type_id, game_price, game_qty)
  VALUES (10, 'For Honour', '4', 12.00,4);
INSERT INTO MM_Game (game_id, game_title, game_type_id, game_price, game_qty)
  VALUES (11, 'FIFA 2017', '5', 14.00,3);
INSERT INTO MM_Game (game_id, game_title, game_type_id, game_price, game_qty)
  VALUES (12, 'WWE 2k16', '5', 15.00,5);

-- insert data into the rental table (game  and customer tables need to have data in it before we can do this : Foreign Key) 
-- Using a partial insert so the checkout date will be today
INSERT INTO MM_Rental (rental_id, customer_id, game_id)
  VALUES (1,'10', '11');
INSERT INTO MM_Rental (rental_id, customer_id, game_id)
  VALUES (2,'10', '8');
INSERT INTO MM_Rental (rental_id, customer_id, game_id)
  VALUES (3,'12', '6');
INSERT INTO MM_Rental (rental_id, customer_id, game_id)
  VALUES (4,'13', '3');
INSERT INTO MM_Rental (rental_id, customer_id, game_id)
  VALUES (5,'13', '5');
INSERT INTO MM_Rental (rental_id, customer_id, game_id)
  VALUES (6,'13', '11');
INSERT INTO MM_Rental (rental_id, customer_id, game_id)
  VALUES (7,'14', '10');
INSERT INTO MM_Rental (rental_id, customer_id, game_id)
  VALUES (8,'14', '7');
INSERT INTO MM_Rental (rental_id, customer_id, game_id)
  VALUES (9,'12', '4');
INSERT INTO MM_Rental (rental_id, customer_id, game_id)
  VALUES (10,'12', '12');
INSERT INTO MM_Rental (rental_id, customer_id, game_id)
  VALUES (11,'12', '3');
INSERT INTO MM_Rental (rental_id, customer_id, game_id)
  VALUES (12,'13', '4');
 
COMMIT;


--SECTION TWO SIMPLE PROJECTION AND RESTRICTION USING COMPARISON OPERATORS AND LOGICAL CONDITIONS
--Select Statement 1
--Find the price of the game called Soma
SELECT <columns> 
FROM <table>
WHERE <condition>;

--Select Statement 2
--Find the title of all games with more than 3 in stock; include the quantity in the output
SELECT colname, colname
FROM tablename
WHERE <condition>;

--Select statement 3
--Use the BETWEEN condition to display rows based on a range of values.
--Find the title of all games with quantities between 3 and 7 in stock; include the quantity in the output
SELECT colname, colname
FROM   tablename
WHERE  colname BETWEEN lowerlimit and upperlimit;

--Select statement 4
--Use the IN membership condition to test for values in a list.
--Find the quantities between in stock for the following games Soma, Doom, Bayonetta; include the title in the output
SELECT colname, colname
FROM   tablename
WHERE  colname IN (value1, value2, value3, ..., valuen);

--Select statement 5
--Use the LIKE condition to perform wildcard searches of valid search string values.
--Search conditions can contain a pattern with either literal characters or numbers:
--% denotes zero or many characters.
--_ denotes one character.--Find the titles of all games with a lower case letter o anywhere in its name
SELECT colname
FROM tablename
WHERE colname LIKE 'PATTERN';

--Select statement 6
--Use the LIKE condition to perform wildcard searches of valid search string values.
--Search conditions can contain a pattern with either literal characters or numbers:
--% denotes zero or many characters.
--_ denotes one character.
--Find the titles of all games with a lower case letter o as the third letter of its name.
SELECT colname
FROM tablename
WHERE colname LIKE 'PATTERN';


--Select statement 7
--Test for nulls with the IS NULL operator.
--Find details of all rentals with a return date of null
SELECT *
FROM   tablename
WHERE  colname IS NULL ;

--Select statement 8
--Test for non null values with the IS NOT NULL operator.
--Find all rentals with a value in their return date
SELECT colname
FROM   table
WHERE colname IS NOT NULL ;


--Select statement 9
--AND requires both conditions to be true.
--Find all titles with a lowercase letter o in their title with more than 3 in stock
--Include the title and the quantity in the output:
SELECT colname, colname
FROM   tablename
WHERE  condition
AND    condition ;

--Select statement 10
--AND requires both conditions to be true.
--Find all titles with a lowercase letter o in their title with 3 or more in stock
--Include the title and the quantity in the output:
SELECT colname, colname
FROM   tablename
WHERE  condition
OR     condition;

--Select statement 11
--NOT requires a condition to be FALSE.
--Find the titles of all games that DO NOT have a price of 9, 10 or 12 using the IN operator
--Include the title and the price in the output
SELECT colname, colname
FROM   tablename
WHERE  colnamae NOT IN (value1,value2,value3);

--Select statement 12
--Rules of Precedence apply
SELECT game_title, game_qty
FROM   mm_game
WHERE  game_title like 'F%'
OR     game_title like '_o%'
AND    game_qty > 3;



--Select statement 13
--Rules of precedence - here the parentheses are controlling what is considered in the AND
SELECT game_title, game_qty
FROM   mm_game
WHERE  (game_title like 'F%'
OR     game_title like '_o%')
AND    game_qty > 3;


--Select statement 14
--Sort retrieved rows with the ORDER BY clause:
--ASC: ascending order, default
--DESC: descending order
--The ORDER BY clause comes last in the SELECT statement.
--Find the titles of all games where game type is 2 or 3 and  sort in ascending order of game_type_id; include game_type_id in the output
SELECT colnames
FROM tablename
WHERE condition
ORDER BY colnames ASC;


--SECTION 3 SELECT STATEMETNS TO RETRIEVE DATA FROM MULTIPLE TABLES USING INNER JOINS
--Select statment 15
--Return the names and categories of all games sorted in order of type showing the name of the type rather than the ID 
SELECT colname, colname
from table1
join table2
using (common colname);


--Select statement 16
--Suppose we want to sort them in order of the type description
SELECT colname, colname
FROM table1
JOIN table2
USING (common colname)
ORDER BY colname ASC;


--Select statement 17
--Suppose now we only wanted to find games from a type with the letter o somewhere in its name?
SELECT colname, colname
FROM table1
JOIN table2
USING (common colname)
WHERE condition;


--Select statement 18
--We can join a table to more than one table in a select statement
--Suppose we want to get the following details for each rental:
--Customer name
--Game title
--Date checkedout
--We need to join our rental table to both the game and the customer table to achieve it
--Rental table is our main table since it holds the links to both of the other table
SELECT colname, colname, colname
FROM maintable
JOIN table1 USING (colname common between maintable and table1)
JOIN table2 USING (colname common between maintable and table2);








