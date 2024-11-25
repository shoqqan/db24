CREATE DATABASE lab6;
CREATE TABLE game
(
    id      INTEGER PRIMARY KEY,
    mdate   DATE,
    stadium VARCHAR,
    team1   VARCHAR(3) REFERENCES eteam (id),
    team2   VARCHAR(3) REFERENCES eteam (id)
);

CREATE TABLE eteam
(
    id       VARCHAR(3) PRIMARY KEY,
    teamname VARCHAR,
    coach    VARCHAR
);

CREATE TABLE goal
(
    matchid INTEGER REFERENCES game (id),
    teamid  VARCHAR(3) REFERENCES eteam (id),
    player  VARCHAR,
    gtime   INTEGER
);


