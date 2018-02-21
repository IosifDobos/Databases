-- Databases I
-- Practical Class Week 6


-- 1. Create your data structures and insert data
-- Drop tables to clear any existing structures with the same name
Drop table EventResult;
Drop table Competitor;
Drop table Event;
Drop table Sport;


-- Create tables in order of dependency
Create table Sport (
sportCode Number(4),
sportName varchar2(30) NOT NULL,
constraint sport_pk PRIMARY KEY (sportCode),
constraint sport_name_uniq UNIQUE(sportName)
);

Create table Competitor(
compID NUMBER(4),
compName varchar2(30),
compEmail varchar2 (30),
constraint competitor_pk PRIMARY KEY (compID),
constraint compemail_chk CHECK(compemail like '%@%.com'),
constraint compemail_uniq UNIQUE(compemail)
);

Create table Event(
eventID Number(4),
eventName varchar2(30) NOT NULL,
eventDate Date NOT NULL,
sportCode Number(4), 
prizeFund Number(8,2),
CONSTRAINT event_pk PRIMARY KEY (eventID),
Constraint event_sport_fk FOREIGN KEY (sportCode) REFERENCES Sport(sportCode));


Create table EventResult(
eventNo number(4),
compID  number(4),
Position number(4),
CONSTRAINT eventenrol_pk PRIMARY KEY (eventNo, compID),
Constraint eventen_event_fk FOREIGN KEY (eventNo) REFERENCES Event (eventID),
Constraint eventen_comp_fk FOREIGN KEY (compID) REFERENCES Competitor (compID),
CONSTRAINT position_chk CHECK (position between 1 and 8)

);
-- Inserting your data
insert into sport (sportCode, sportName) values(1, 'Athletics');
insert into sport (sportCode, sportName) values (2, 'Swimming');
insert into sport (sportCode, sportName) values (3, 'Boxing');

insert into event (eventID, eventName, eventDate, sportCode,prizeFund) values (1, '100m Mens Final',  '14 AUG 2016',1, 250000);
insert into event (eventID, eventName, eventDate, sportCode,prizeFund)values (2, '100m Womens Final',  '13 AUG 2012',1, 250000);
insert into event (eventID, eventName, eventDate, sportCode,prizeFund)values (3, '100m Mens Freestyle Final',  '10 AUG 2016',2, 200000);
insert into event (eventID, eventName, eventDate, sportCode,prizeFund) values (4, '200m Mens Final', '18 AUG 2016', 1, 200000);
insert into event (eventID, eventName, eventDate, sportCode,prizeFund) values (5, '200m Womens Final', '17 AUG 2016', 1,200000);
insert into event (eventID, eventName, eventDate, sportCode) values (6, '400m Mens Final', '14 Aug 2016',2);
insert into event (eventID, eventName, eventDate, sportCode)values (7, 'Womens Lightweight', '14 Aug 2016',3);

insert into competitor (compId, compName, compemail) values (1, 'Usain Bolt', 'UB@jam.com');
insert into competitor (compId, compName, compEmail) values (2, 'Justin Gatlin', 'JB@usa.com');
insert into competitor (compId, compName, compEmail) values (3, 'Andre De Grasse', 'ADG@can.com');

insert into competitor (compId, compName, compemail) values (4, 'Elaine Thompson', 'ET@jam.com');
insert into competitor (compId, compName, compEmail) values (5, 'Tori Bowie', 'TB@usa.com');
insert into competitor (compId, compName, compEmail) values (6, 'Shelly-Ann Fraser-Price', 'SAFP@jam.com');

insert into competitor (compId, compName, compemail) values (7, 'Kyle Chambers', 'KC@aus.com');
insert into competitor (compId, compName, compEmail) values (8, 'Peter Timmers', 'PT@bel.com');
insert into competitor (compId, compName, compEmail) values (9, 'Nathan Adrian', 'NA@usa.com');

insert into competitor (compId, compName, compEmail) values (10, 'Christian LeMaitre', 'CM@fr.com');
insert into competitor (compId, compName, compEmail) values (11, 'Daphne Schiffers', 'DS@nl.com');


insert into EventResult (eventNo, compID, position) values (1, 1, 1);
insert into EventResult (eventNo, compID, position) VALUES (1, 2, 2);
insert into EventResult (eventNo, compID, position) VALUES (1, 3, 3);
insert into EventResult (eventNo, compID, position) VALUES (2, 4, 1);
insert into EventResult (eventNo, compID, position) VALUES (2, 5, 2);
insert into EventResult (eventNo, compID, position) VALUES (2, 6, 3);
insert into EventResult (eventNo, compID, position) VALUES (3, 7, 1);
insert into EventResult (eventNo, compID, position)  values (3,8,2);
insert into EventResult (eventNo, compID, position)  values (3,9,3);
insert into EventResult (eventNo, compID, position) values (4, 1, 1);
insert into EventResult (eventNo, compID, position) VALUES (4, 3, 2);
insert into EventResult (eventNo, compID, position) VALUES (4, 10, 3);
insert into EventResult (eventNo, compID, position) VALUES (5, 4, 1);
insert into EventResult (eventNo, compID, position) VALUES (5, 11, 2);
insert into EventResult (eventNo, compID, position) VALUES (5, 5, 3);

commit;

-- Retrieve all the data
select * from sport;
select * from event;
select * from competitor;
select * from eventenrollment;
