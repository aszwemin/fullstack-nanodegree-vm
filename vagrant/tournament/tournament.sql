-- Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--
-- You can write comments in this file by starting them with two dashes, like
-- these lines here.


-- Players table
CREATE TABLE players (
    id SERIAL PRIMARY KEY,
    name VARCHAR(80)
);


-- Matches table
CREATE TABLE matches (
    winner_id INT REFERENCES players(id),
    loser_id INT REFERENCES players(id)
);


-- Create view for counting matches played
CREATE VIEW played AS
SELECT players.id, COUNT(matches.winner_id) AS matches
FROM players LEFT JOIN matches
ON players.id = matches.winner_id OR players.id = matches.loser_id
GROUP BY players.id;


-- Create view for counting matches won
CREATE VIEW won AS
SELECT players.id, COUNT(matches.winner_id) AS wins
FROM players LEFT JOIN matches
ON players.id = matches.winner_id
GROUP BY players.id;


-- Create view for players stats
CREATE VIEW standings AS
SELECT players.id, players.name, SUM(won.wins) AS wins, SUM(played.matches) AS matches
FROM players JOIN won ON players.id = won.id JOIN played ON players.id = played.id
GROUP BY players.id;

