-- Created by Brandon Chaffee
-- October 20th, 2015
\c vagrant
-- Creates database tournament for all tables and views
DROP DATABASE IF EXISTS tournament;
CREATE DATABASE tournament;
-- Connects to previously made tournament database
\c tournament

-- Creates table Players to store individual players with name
-- and unique id
DROP TABLE IF EXISTS Players;
CREATE TABLE Players (id serial primary key, name text);

-- Creates table Matches to store individual matches, with winner 
-- and loser specified
DROP TABLE IF EXISTS Matches;
CREATE TABLE Matches (
	id serial primary key, 
	winner integer references Players (id),
	loser integer references Players (id));

-- Creates view matches_played to organize the number of matches each 
-- player has been in descending by most played
DROP VIEW IF EXISTS matches_played;
CREATE VIEW matches_played AS 
	SELECT players.id, CAST(COUNT(players.id) AS INTEGER) AS played 
	FROM Players, Matches 
	WHERE Players.id = Matches.winner OR Players.id = Matches.loser 
	GROUP BY players.id 
	ORDER BY played DESC;

-- Creates view win_totals to organize number of wins each player 
-- has, descending from most wins
DROP VIEW IF EXISTS win_totals;
CREATE VIEW win_totals AS 
	SELECT players.id, CAST(COUNT(matches.winner) AS INTEGER) AS wins
	FROM Matches, Players WHERE Players.id = Matches.winner 
	GROUP BY players.id 
	ORDER BY wins DESC;

-- standings view joins matches_played and win_totals and
-- organizes by most wins
DROP VIEW IF EXISTS Standings;
CREATE VIEW standings AS 
	SELECT * from Players 
	left join matches_played using (id) 
	left join win_totals using (id) 
	ORDER BY wins DESC;

