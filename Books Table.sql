CREATE TABLE books (
   id SERIAL PRIMARY KEY,
   title VARCHAR(150),
   author_id INT REFERENCES authors(id),
   genres TEXT[],
   published_year INT,
   available BOOLEAN
);