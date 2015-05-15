-- Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--
-- You can write comments in this file by starting them with two dashes, like
-- these lines here.


-- Players table
create table players (
    id serial primary key,
    name varchar(80)
);


-- Matches table
create table matches (
    winner_id int references players(id),
    loser_id int references players(id)
);


-- Create view for counting matches played
create view played as
select players.id, count(matches.winner_id) as matches
from players left join matches
on players.id = matches.winner_id or players.id = matches.loser_id
group by players.id;


-- Create view for counting matches won
create view won as
select players.id, count(matches.winner_id) as wins
from players left join matches
on players.id = matches.winner_id
group by players.id;


-- Create view for players stats
create view standings as
select players.id, players.name, sum(won.wins) as wins, sum(played.matches) as matches
from players join won on players.id = won.id join played on players.id = played.id
group by players.id;

