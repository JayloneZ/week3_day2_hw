DROP TABLE IF EXISTS bounty;

CREATE TABLE bounty (
id SERIAL4,
name VARCHAR(255),
species VARCHAR(255),
bounty_value INT4,
danger_level INT2
);
