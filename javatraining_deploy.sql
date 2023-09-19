DROP DATABASE javatraining;
CREATE DATABASE javatraining CHARACTER SET UTF8;
USE javatraining;

CREATE TABLE shops(
    id INT(10) AUTO_INCREMENT NOT NULL, 
    name VARCHAR(30) NOT NULL,
    PRIMARY KEY (id)
    );
