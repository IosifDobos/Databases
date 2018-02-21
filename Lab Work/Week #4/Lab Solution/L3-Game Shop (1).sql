/* This script will create a set of tables to model a small game rental shop */

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