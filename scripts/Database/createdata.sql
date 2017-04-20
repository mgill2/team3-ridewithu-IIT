CREATE DATABASE IF NOT EXISTS master;

USE master;

CREATE TABLE IF NOT EXISTS users
(
	ID MEDIUMINT NOT NULL AUTO_INCREMENT,
	FIRST_NAME varchar(100)   NOT NULL,
	LAST_NAME varchar(100)    NOT NULL,
	EMAIL varchar(100)        NOT NULL,
	USERNAME varchar(50)      NOT NULL,
	PASSWORD varchar(50)      NOT NULL,
    PRIMARY KEY (ID)
);

CREATE TABLE IF NOT EXISTS listride 
(
  FIRST_NAME varchar(100)             NOT NULL,
  Last_NAME varchar(100)              NOT NULL,
  EMAIL varchar(100)                  NOT NULL,
  ORIGIN varchar(200)                 NOT NULL,
  DESTINATION varchar(200)            NOT NULL,
  LEAVING_TIME TIME DEFAULT CURTIME() NOT NULL,
  LEAVING_DATE date DEFAULT CURDATE() NOT NULL
);