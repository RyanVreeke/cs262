--
-- This SQL script builds a monopoly database, deleting any pre-existing version.
--
-- @author kvlinden
-- @version Summer, 2015
--

-- Drop previous versions of the tables if they they exist, in reverse order of foreign keys.
DROP TABLE IF EXISTS PlayerGame;
DROP TABLE IF EXISTS PlayerProperties;
DROP TABLE IF EXISTS PlayerRealEstate;
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
	name varchar(50),
	cash integer,
	pieceLocation integer
	);

CREATE TABLE PlayerProperties (
	playerID integer REFERENCES Player(ID),
	properties integer
	);

CREATE TABLE PlayerRealEstate (
	playerID integer REFERENCES Player(ID),
	houses integer,
	hotels integer
	);

CREATE TABLE PlayerGame (
	gameID integer REFERENCES Game(ID),
	playerID integer REFERENCES Player(ID),
	score integer
	);

-- Allow users to select data from the tables.
GRANT SELECT ON Game TO PUBLIC;
GRANT SELECT ON Player TO PUBLIC;
GRANT SELECT ON PlayerGame TO PUBLIC;
GRANT SELECT ON PlayerProperties TO PUBLIC;
GRANT SELECT ON PlayerRealEstate TO PUBLIC;

-- Add sample records.
INSERT INTO Game VALUES (1, '2006-06-27 08:00:00');
INSERT INTO Game VALUES (2, '2006-06-28 13:20:00');
INSERT INTO Game VALUES (3, '2006-06-29 18:41:00');

INSERT INTO Player(ID, emailAddress) VALUES (1, 'me@calvin.edu');
INSERT INTO Player VALUES (2, 'king@gmail.edu', 'The King', 500, 22);
INSERT INTO Player VALUES (3, 'dog@gmail.edu', 'Dogbreath', 1000000, 3);
INSERT INTO Player VALUES (4, 'rjv59@calvin.edu', 'Ryan Vreeke', 5000000, 20);

INSERT INTO PlayerProperties VALUES (1, 3);
INSERT INTO PlayerProperties VALUES (2, 7);
INSERT INTO PlayerProperties VALUES (3, 6);
INSERT INTO PlayerProperties VALUES (4, 10);

INSERT INTO PlayerRealEstate VALUES (1, 2, 0);
INSERT INTO PlayerRealEstate VALUES (2, 3, 1);
INSERT INTO PlayerRealEstate VALUES (3, 2, 1);
INSERT INTO PlayerRealEstate VALUES (4, 6, 3);

INSERT INTO PlayerGame VALUES (1, 1, 0.00);
INSERT INTO PlayerGame VALUES (1, 2, 0.00);
INSERT INTO PlayerGame VALUES (1, 3, 2350.00);
INSERT INTO PlayerGame VALUES (2, 1, 1000.00);
INSERT INTO PlayerGame VALUES (2, 2, 0.00);
INSERT INTO PlayerGame VALUES (2, 3, 500.00);
INSERT INTO PlayerGame VALUES (3, 2, 0.00);
INSERT INTO PlayerGame VALUES (3, 3, 5500.00);
INSERT INTO PlayerGame VALUES (3, 4, 10000.00);
