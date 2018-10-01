-- Creating a new table called bookshelves

CREATE TABLE BOOKSHELVES (id SERIAL PRIMARY KEY, name VARCHAR(255));

-- Retrieving unique bookshelf values from the books table and insert each one into the bookshelves table in the name column.

INSERT INTO bookshelves(name) SELECT DISTINCT bookshelf FROM books;

-- Adding a column to the books table named bookshelf_id. This will connect each book to a specific bookshelf in the other table.

ALTER TABLE books ADD COLUMN bookshelf_id INT;

-- Preparing a connection between the two tables by running a subquery for every row in the books table. The subquery finds the bookshelf row that has a name matching the current book's bookshelf value. The id of that bookshelf row is then set as the value of the bookshelf_id property in the current book row.

UPDATE books SET bookshelf_id=shelf.id FROM (SELECT * FROM bookshelves) AS shelf WHERE books.bookshelf = shelf.name;

-- Modifying the books table by removing the column named bookshelf.

ALTER TABLE books DROP COLUMN bookshelf;

-- Modifying the data type of the bookshelf_id in the books table, setting it as a foreign key which references the primary key in the bookshelves table.

ALTER TABLE books ADD CONSTRAINT fk_bookshelves FOREIGN KEY (bookshelf_id) REFERENCES bookshelves(id);