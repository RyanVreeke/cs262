-- Retrieve a list of all the games, ordered by date
--  with the most recent game coming first.

--   SELECT *
--     FROM Game
-- ORDER BY time
--   ;

-- Retrieve all the games that occurred in the past
--  week.

-- SELECT *
--   FROM Game
--  WHERE time > '2020-10-17 00:00:00'
--  AND time < '2020-10-24 00:00:00'
--      ;

-- Retrieve a list of players who have (non-NULL)
--  names.

-- 		   SELECT *
--              FROM Player
-- WHERE name IS NOT NULL
--            ;

-- Retrieve a list of IDs for players who have
--  some game score larger than 2000.

-- SELECT playerID
--   FROM PlayerGame
--  WHERE score > 2000
--      ;

-- Retrieve a list of players who have GMail accounts.

-- SELECT *
--   FROM Player
--  WHERE emailAddress LIKE '%@gmail%'
--      ;

-- Retrieve all “The King”’s game scores in decreasing
--  order.

--   SELECT score
--     FROM Player, PlayerGame
--    WHERE name = 'The King'
-- ORDER BY score DESC
--        ;

-- Retrieve the name of the winner of the game played
--  on 2006-06-28 13:20:00.

-- SELECT name
--   FROM Game, Player, PlayerGame
--  WHERE Game.ID = 2
--    AND score = 700
--    AND Player.ID = 3
--      ;

-- So what does that P1.ID < P2.ID clause do in the
--  last example query?

-- I beleive that the P1.ID < P2.ID assures that the two instances of
--  the Player table are accessing different ID's. You would find that
--  the first name would equal and then so would the ID's so that
--  clause makes it so that it doesn't query that one.

-- The query that joined the Player table to itself
--  seems rather contrived. Can you think of a
--  realistic situation in which you’d want to join
--  a table to itself?

-- You may want to join a table to itself in cases where you want to
--  search that table against itself which is being done above.
--  I think an example could be that if you want to make sure that
--  every username put into the table is unique you could then
--  do the above process to make sure that no username's match.
