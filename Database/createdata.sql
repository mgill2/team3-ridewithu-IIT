CREATE DATABASE IF NOT EXISTS backend;

USE backend;

CREATE TABLE IF NOT EXISTS items
(
	ID INT                    NOT NULL,
	FIRST_NAME varchar(100)   NOT NULL,
	LAST_NAME varchar(100)    NOT NULL,
	EMAIL varchar(100)        NOT NULL,
    PRIMARY KEY (ID)
);