CREATE TABLE patrons(
    id SERIAL PRIMARY KEY,
	name VARCHAR(100),
	email VARCHAR(100) UNIQUE,
	borrowed_books int[]
)