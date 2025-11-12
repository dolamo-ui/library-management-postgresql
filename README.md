# Library Management System (PostgreSQL)

## 📦 Setup
1. Create the database:

Create the Database

Right-click on Databases under your server.

Select Create > Database...

In the Create - Database dialog:

Database Name: LibraryDB

📁 Create the required tables
Authors Table

CREATE TABLE authors (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    nationality VARCHAR(50),
    birth_year INT,
    death_year INT
);

Books Table

CREATE TABLE books (
    id SERIAL PRIMARY KEY,
    title VARCHAR(150),
    author_id INT REFERENCES authors(id),
    genres TEXT[],
    published_year INT,
    available BOOLEAN
);


Patrons Table

CREATE TABLE patrons (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    borrowed_books INT[]
);


✅ Sprint 2: Insert Data
Insert Sample Data into Authors

INSERT INTO authors (id, name, nationality, birth_year, death_year) VALUES
(1, 'George Orwell', 'British', 1903, 1950),
(2, 'Harper Lee', 'American', 1926, 2016),
(3, 'F. Scott Fitzgerald', 'American', 1896, 1940),
(4, 'Aldous Huxley', 'British', 1894, 1963),
(5, 'J.D. Salinger', 'American', 1919, 2010),
(6, 'Herman Melville', 'American', 1819, 1891),
(7, 'Jane Austen', 'British', 1775, 1817),
(8, 'Leo Tolstoy', 'Russian', 1828, 1910),
(9, 'Fyodor Dostoevsky', 'Russian', 1821, 1881),
(10, 'J.R.R. Tolkien', 'British', 1892, 1973);

Insert Sample Data into Books

INSERT INTO books (id, title, author_id, genres, published_year, available) VALUES
(1, '1984', 1, ARRAY['Dystopian', 'Political Fiction'], 1949, TRUE),
(2, 'To Kill a Mockingbird', 2, ARRAY['Southern Gothic', 'Bildungsroman'], 1960, TRUE),
(3, 'The Great Gatsby', 3, ARRAY['Tragedy'], 1925, TRUE),
(4, 'Brave New World', 4, ARRAY['Dystopian', 'Science Fiction'], 1932, TRUE),
(5, 'The Catcher in the Rye', 5, ARRAY['Realist Novel', 'Bildungsroman'], 1951, TRUE),
(6, 'Moby-Dick', 6, ARRAY['Adventure Fiction'], 1851, TRUE),
(7, 'Pride and Prejudice', 7, ARRAY['Romantic Novel'], 1813, TRUE),
(8, 'War and Peace', 8, ARRAY['Historical Novel'], 1869, TRUE),
(9, 'Crime and Punishment', 9, ARRAY['Philosophical Novel'], 1866, TRUE),
(10, 'The Hobbit', 10, ARRAY['Fantasy'], 1937, TRUE);

Insert Sample Data into Patrons

INSERT INTO patrons (id, name, email, borrowed_books) VALUES
(1, 'Alice Johnson', 'alice@example.com', ARRAY[]::INT[]),
(2, 'Bob Smith', 'bob@example.com', ARRAY[1, 2]),
(3, 'Carol White', 'carol@example.com', ARRAY[]::INT[]),
(4, 'David Brown', 'david@example.com', ARRAY[3]),
(5, 'Eve Davis', 'eve@example.com', ARRAY[]::INT[]),
(6, 'Frank Moore', 'frank@example.com', ARRAY[4, 5]),
(7, 'Grace Miller', 'grace@example.com', ARRAY[]::INT[]),
(8, 'Hank Wilson', 'hank@example.com', ARRAY[6]),
(9, 'Ivy Taylor', 'ivy@example.com', ARRAY[]::INT[]),
(10, 'Jack Anderson', 'jack@example.com', ARRAY[7, 8]);


✅ Sprint 3: Read Operations

1.Get all books

SELECT * FROM books;


2.Get a book by title

SELECT * FROM books WHERE title ILIKE '1984';


3.Get all books by a specific author

SELECT b.*
FROM books b
JOIN authors a ON b.author_id = a.id
WHERE a.name ILIKE 'George Orwell';


4.Get all available books

SELECT * FROM books WHERE available = TRUE;

✅ Sprint 4: Update Operations

1.Mark a book as borrowed (set available = false)

UPDATE books SET available = FALSE WHERE id = 1;

2.Add a new genre to an existing book

UPDATE books
SET genres = array_append(genres, 'New Genre')
WHERE id = 2;

3.Add a borrowed book to a patron’s record

UPDATE patrons
SET borrowed_books = array_append(borrowed_books, 9)
WHERE id = 1;

✅ Sprint 5: Delete Operations

1.Delete a book by title

DELETE FROM books WHERE title ILIKE 'The Great Gatsby';

2.Delete an author by ID

DELETE FROM authors WHERE id = 3;


✅ Sprint 6: Advanced Queries

1.Find books published after 1950

SELECT * FROM books WHERE published_year > 1950;

2.Find all American authors

SELECT * FROM authors WHERE nationality = 'American';

3.Set all books as available

UPDATE books SET available = TRUE;

4.Find all books that are available AND published after 1950

SELECT * FROM books
WHERE available = TRUE AND published_year > 1950;

5.Find authors whose names contain "George"

SELECT * FROM authors WHERE name ILIKE '%George%';

6.Increment the published year 1869 by 1

UPDATE books SET published_year = published_year + 1
WHERE published_year = 1869;





