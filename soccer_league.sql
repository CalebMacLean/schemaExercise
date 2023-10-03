DROP DATABASE IF EXISTS soccer_league;

CREATE DATABASE soccer_league;

\c soccer_league

-- TEAM TABLE
CREATE TABLE teams
(
    id SERIAL PRIMARY KEY,
    name TEXT UNIQUE NOT NULL,
    city TEXT UNIQUE
);

INSERT INTO teams
    (name, city)
VALUES
    ('Arsenal', 'London')
    ('Liverton', 'Dublin')
    ('Falham', 'Barcelona')
    ('Chelsea', 'Paris');

-- REFEREE TABLE
CREATE TABLE referees
(
    id SERIAL PRIMARY KEY,
    name TEXT UNIQUE NOT NULL
);

INSERT INTO referees
VALUES
    ('Casandra Hart')
    ('Isaiah Wren')
    ('Jessica DePaolo')
    ('Ethan MacLean');

-- SEASON TABLE
CREATE TABLE seasons
(
    id SERIAL PRIMARY KEY,
    start_date DATE,
    end_date DATE
);

INSERT INTO seasons
    (start_date, end_date)
VALUES
    ('1-2-1998', '12-31-1998'),
    ('1-22-2022', '11-18-2022');

-- PLAYER TABLE
CREATE TABLE players
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    age INT,
    team_id INT REFERENCES teams
);

INSERT INTO players
    (name, age, team_id)
VALUES
    ('Caleb Maclean', 25, 1),
    ('Malcolm Teel', 25, 2),
    ('Giddy DePaolo', 13, 3),
    ('Parrish Maple', 48, 4);

-- MATCH TABLE
CREATE TABLE matches
(
    id SERIAL PRIMARY KEY,
    home_team_id INT REFERENCES teams,
    away_team_id INT REFERENCES teams,
    location TEXT,
    date DATE,
    start_time TIME,
    season_id INT REFERENCES seasons,
    referee_id INT REFERENCES referees
);

INSERT INTO matches
    (home_team_id, away_team_id, location, date, start_time, season_id, referee_id)
VALUES
    (1, 1, 4, 'Vancouver', '1-22-1998', '9:00', 1, 1),
    (2, 2, 3, 'Portland', '4-28-2007', '9:00', 2, 2);

-- SEASON TABLE
CREATE TABLE seasons
(
    id SERIAL PRIMARY KEY,
    start_date DATE,
    end_date DATE
);

INSERT INTO seasons
    (start_date, end_date)
VALUES
    ('1-12-1998', '4-20-2020'),
    ('12-21-2020', '6-8-2021');

-- LINEUP TABLE
CREATE TABLE lineups
(
    id SERIAL PRIMARY KEY,
    player_id INT REFERENCES players,
    match_id INT REFERENCES matches,
    team_id INT REFERENCES teams
);

INSERT INTO lineups
    (player_id, match_id, team_id)
VALUES
    (1,2,4),
    (2,2,3);

-- GOAL TABLE
CREATE TABLE goals
(
    id SERIAL PRIMARY KEY,
    player_id INT REFERENCES players,
    match_id INT REFERENCES matches
);

INSERT INTO goals
    (player_id, match_id)
VALUES
    (4, 1),
    (2, 1),
    (1, 2);
