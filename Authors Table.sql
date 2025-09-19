CREATE TABLE authors (
   id SERIAL  PRIMARY KEY,
   name VARCHAR(100),
   nationality VARCHAR(50),
   birth_year INT,
   death_year INT
);