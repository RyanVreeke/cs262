--
-- This SQL script builds a monopoly database, deleting any pre-existing version.
--
-- @author kvlinden
-- @version Summer, 2015
--

-- Drop previous versions of the tables if they they exist, in reverse order of foreign keys.
DROP TABLE IF EXISTS PlayerGame;
DROP TABLE IF EXISTS PlayerProperties;
DROP TABLE IF EXISTS PlayerPropertiesType;
DROP TABLE IF EXISTS Game;
DROP TABLE IF EXISTS Player;

-- Create the schema.
CREATE TABLE Game (
	ID integer PRIMARY KEY,
	time timestamp
	);

CREATE TABLE Player (
	ID integer PRIMARY KEY,
	emailAddress varchar(50) NOT NULL,
	name varchar(50)
	);

CREATE TABLE PlayerPropertiesType (
	ID integer PRIMARY KEY,
	propType varchar(5)
	);

CREATE TABLE PlayerProperties (
	gameID integer REFERENCES Game(ID),
	playerID integer REFERENCES Player(ID),
	amount integer,
	propertyID integer REFERENCES PlayerPropertiesType(ID),
	propLocation varchar(50)
	);

CREATE TABLE PlayerGame (
	gameID integer REFERENCES Game(ID),
	playerID integer REFERENCES Player(ID),
	cash integer,
	pieceLocation varchar(50),
	score integer
	);

-- Allow users to select data from the tables.
GRANT SELECT ON Game TO PUBLIC;
GRANT SELECT ON Player TO PUBLIC;
GRANT SELECT ON PlayerGame TO PUBLIC;
GRANT SELECT ON PlayerProperties TO PUBLIC;
GRANT SELECT ON PlayerPropertiesType TO PUBLIC;

-- Add sample records.
INSERT INTO Game VALUES (1, '2006-06-27 08:00:00');
INSERT INTO Game VALUES (2, '2006-06-28 13:20:00');
INSERT INTO Game VALUES (3, '2006-06-29 18:41:00');
INSERT INTO Game VALUES (4, '2020-02-29 18:20:00');

INSERT INTO Player(ID, emailAddress) VALUES (1, 'me@calvin.edu');
INSERT INTO Player VALUES (2, 'king@gmail.edu', 'The King');
INSERT INTO Player VALUES (3, 'dog@gmail.edu', 'Dogbreath');
INSERT INTO Player VALUES (4, 'rjv59@calvin.edu', 'Ryan Vreeke');

INSERT INTO PlayerPropertiesType VALUES (1, 'house');
INSERT INTO PlayerPropertiesType VALUES (2, 'hotel');

INSERT INTO PlayerProperties VALUES (4, 1, 1, 1, 'Oriental Avenue');
INSERT INTO PlayerProperties VALUES (4, 2, 2, 1, 'States Avenue');
INSERT INTO PlayerProperties VALUES (4, 3, 1, 2, 'Baltic Avenue');
INSERT INTO PlayerProperties VALUES (4, 4, 2, 2, 'BoardWalk');

INSERT INTO PlayerGame VALUES (1, 1, 100, 'Oriental Avenue', 50);
INSERT INTO PlayerGame VALUES (1, 2, 200, 'States Avenue', 150);
INSERT INTO PlayerGame VALUES (1, 3, 500, 'Baltic Avenue', 300);
INSERT INTO PlayerGame VALUES (2, 1, 50, 'States Avenue', 10);
INSERT INTO PlayerGame VALUES (2, 2, 500, 'BoardWalk', 250);
INSERT INTO PlayerGame VALUES (2, 3, 2000, 'Baltic Avenue', 700);
INSERT INTO PlayerGame VALUES (3, 2, 500, 'BoardWalk', 175);
INSERT INTO PlayerGame VALUES (3, 3, 100, 'States Avenue', 35);
INSERT INTO PlayerGame VALUES (4, 4, 10000, 'BoardWalk', 1000);
