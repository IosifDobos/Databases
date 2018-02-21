
DROP TABLE MM_Customer;
DROP TABLE MM_Game_Type;
DROP TABLE MM_Game;

CREATE TABLE MM_Game( 
    game_id NUMBER(5)
    game_title VARCHAR2(40) NOT NULL,
    game_type_id NUMBER(2),
    game_price NUMBER(5,2) NOT NULL,
    game_qty NUMBER(2) NOT NULL,
    CONSTRAINT game_id_pk PRIMARY KEY (game_id),
    CONSTRAINT game_type_fk FOREIGN KEY (game_type_id),
);
CREATE TABLE MM_Game_Type(
    game_type_id NUMBER(2),
    game_type_description VARCHAR(20),
    CONSTRAINT game_type_id_pk PRIMARY KEY(game_type_id)
);
    
CREATE TABLE MM_Customer(
    customer_id NUMBER(5),
    lastname VARCHAR(20),
    firstname VARCHAR(20),
    email VARCHAR(50),
    credit_card VARCHAR(12),
    on_mailing_list CHAR(2) DEFAULT 'Y',
    CONSTRAINT customer_custid_pk PRIMARY KEY (customer_id),
    CONSTRAINT on_mailing_list_chk PRIMARY KEY (on_mailing_list IN('Y', 'N')),
    CONSTRAINT email_chk CHECK ( email like '%@%') 
);

INSERT INTO MM_Customer (CUSTOMER_ID, LASTNAME, FIRSTNAME, EMAIL, CREDIT_CARD, ON_MAILING_LIST)
    VALUES ()