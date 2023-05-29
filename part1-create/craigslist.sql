DROP DATABASE IF EXISTS craigslist_db;

CREATE DATABASE craigslist_db;

\c craigslist_db

CREATE TABLE regions (
  id SERIAL PRIMARY KEY,
  region_name TEXT NOT NULL
);

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  username TEXT NOT NULL,
  preferred_region_id INTEGER,
  FOREIGN KEY (preferred_region_id) REFERENCES regions (id)
);

CREATE TABLE posts (
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  text TEXT NOT NULL,
  user_id INTEGER NOT NULL,
  location TEXT NOT NULL,
  region_id INTEGER NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users (id),
  FOREIGN KEY (region_id) REFERENCES regions (id)
);

CREATE TABLE categories (
  id SERIAL PRIMARY KEY,
  category_name TEXT NOT NULL
);

CREATE TABLE post_categories (
  post_id INTEGER NOT NULL,
  category_id INTEGER NOT NULL,
  FOREIGN KEY (post_id) REFERENCES posts (id),
  FOREIGN KEY (category_id) REFERENCES categories (id),
  PRIMARY KEY (post_id, category_id)
);
