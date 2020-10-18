-- Get the number of Game records.
SELECT *
  FROM Game
  ;

-- Get the player records.
SELECT *
  FROM Player
  ;

-- Get the playerProperties records.
SELECT *
  FROM PlayerProperties
  ;

-- Get the playerRealEstate records.
SELECT *
  FROM PlayerRealEstate
  ;

-- Get all the users with Calvin email addresses.
SELECT *
  FROM Player
 WHERE emailAddress LIKE '%calvin%'
 ;

-- Get the highest score ever recorded.
  SELECT score
    FROM PlayerGame
ORDER BY score DESC
   LIMIT 1
   ;

-- Get the cross-product of all the tables.
SELECT *
  FROM Player, PlayerGame,
  PlayerProperties, PlayerRealEstate,
  Game
  ;
