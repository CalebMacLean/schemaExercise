DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist

-- REGION TABLE
CREATE TABLE regions
(
    id SERIAL PRIMARY KEY,
    city TEXT NOT NULL,
    state VARCHAR(2)
);

INSERT INTO regions
    (city, state)
VALUES
    ('Portland', 'OR'),
    ('Reno', 'NV'),
    ('Seattle', 'WA'),
    ('San Diego', 'CA');

-- USER TABLE
CREATE TABLE users
(
    id SERIAL PRIMARY KEY,
    username VARCHAR(10) UNIQUE NOT NULL,
    pref_region_id INTEGER REFERENCES regions
);

INSERT INTO users
    (username, pref_region_id)
VALUES
    ('Cabletooth', 1),
    ('CMaclean', 2),
    ('Gdip', 3),
    ('BattleTag', 4);

-- CATEGORY TABLE
CREATE TABLE categories
(
    id SERIAL PRIMARY KEY,
    category TEXT UNIQUE NOT NULL
);

INSERT INTO categories (category)
VALUES
    ('Community'),
    ('Housing'),
    ('Services'),
    ('For Sale');

-- POST TABLE
CREATE TABLE posts
(
    id SERIAL PRIMARY KEY,
    title VARCHAR(50) NOT NULL,
    description TEXT,
    user_id INTEGER REFERENCES users,
    region_id INTEGER REFERENCES regions,
    category_id INTEGER REFERENCES categories
);

INSERT INTO posts
    (title, description, user_id, region_id, category_id)
VALUES
    ('NEED ROOMMATE!', 'Looking for sane roommate in 2 bedroom apartment', 1, 3, 2),
    ('Dog Walking', 'I walk dogs for $10 an hour', 1, 3, 3),
    ('Looking for lonely barista', 'Looking for a partner who makes a good coffee', 2, 1, 1),
    ('Local Horror Movie Club', 'Club for local horror lovers', 2, 2, 1),
    ('Selling DVD player', 'One used dvd player for sell', 3, 4, 4),
    ('Apartment for $1500 per month', NULL, 4, 2, 2);