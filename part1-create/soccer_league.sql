DROP DATABASE IF EXISTS soccer_db;

CREATE DATABASE soccer_db;

\c soccer_db

CREATE TABLE teams (
  id SERIAL PRIMARY KEY,
  team_name TEXT NOT NULL
);

CREATE TABLE players (
  id SERIAL PRIMARY KEY,
  player_name TEXT NOT NULL,
  team_id INTEGER NOT NULL,
  FOREIGN KEY (team_id) REFERENCES teams (id)
);

CREATE TABLE games (
  id SERIAL PRIMARY KEY,
  home_team_id INTEGER NOT NULL,
  away_team_id INTEGER NOT NULL,
  start_date TIMESTAMP NOT NULL,
  end_date TIMESTAMP NOT NULL,
  FOREIGN KEY (home_team_id) REFERENCES teams (id),
  FOREIGN KEY (away_team_id) REFERENCES teams (id)
);

CREATE TABLE goals (
  id SERIAL PRIMARY KEY,
  game_id INTEGER NOT NULL,
  player_id INTEGER NOT NULL,
  FOREIGN KEY (game_id) REFERENCES games (id),
  FOREIGN KEY (player_id) REFERENCES players (id)
);

CREATE TABLE referees (
  id SERIAL PRIMARY KEY,
  referee_name TEXT NOT NULL
);

CREATE TABLE game_referees (
  game_id INTEGER NOT NULL,
  referee_id INTEGER NOT NULL,
  FOREIGN KEY (game_id) REFERENCES games (id),
  FOREIGN KEY (referee_id) REFERENCES referees (id),
  PRIMARY KEY (game_id, referee_id)
);

CREATE TABLE seasons (
  id SERIAL PRIMARY KEY,
  start_date DATE NOT NULL,
  end_date DATE NOT NULL
);

CREATE TABLE league (
  id SERIAL PRIMARY KEY,
  season_id INTEGER NOT NULL,
  team_id INTEGER NOT NULL,
  standings INTEGER NOT NULL,
  FOREIGN KEY (season_id) REFERENCES seasons (id),
  FOREIGN KEY (team_id) REFERENCES teams (id)
);
