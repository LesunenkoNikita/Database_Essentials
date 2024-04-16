CREATE TABLE publishers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(255),
    phone VARCHAR(20),
    website VARCHAR(100)
);

CREATE TABLE genres (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    description TEXT
);

CREATE TABLE books (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255),
    isbn VARCHAR(20),
    edition INT,
    release_year YEAR,
    price DOUBLE,
    publisher_id INT,
    genre_id INT,
    FOREIGN KEY (publisher_id) REFERENCES publishers(id),
    FOREIGN KEY (genre_id) REFERENCES genres(id)
);

CREATE TABLE genres_mtm (
    book_id INT,
    genre_id INT,
    PRIMARY KEY (book_id, genre_id),
    FOREIGN KEY (book_id) REFERENCES books(id),
    FOREIGN KEY (genre_id) REFERENCES genres(id)
);

CREATE TABLE book_authors (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    birth_date DATE,
    nationality VARCHAR(50),
    biography TEXT,
    book_id INT,
    FOREIGN KEY (book_id) REFERENCES books(id)
);

CREATE TABLE book_authors_mtm (
    book_id INT,
    author_id INT,
    PRIMARY KEY (book_id, author_id),
    FOREIGN KEY (book_id) REFERENCES books(id),
    FOREIGN KEY (author_id) REFERENCES book_authors(id)
);

CREATE TABLE customers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(255),
    phone VARCHAR(20) NOT NULL,
    email VARCHAR(100),
    password_code VARCHAR(100)
);

CREATE TABLE loans (
    id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    book_id INT,
    loan_date DATE NOT NULL,
    due_date DATE NOT NULL,
    return_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(id),
    FOREIGN KEY (book_id) REFERENCES books(id)
);

CREATE TABLE customers_mtm (
    customer_id INT,
    loan_id INT,
    PRIMARY KEY (customer_id, loan_id),
    FOREIGN KEY (customer_id) REFERENCES customers(id),
    FOREIGN KEY (loan_id) REFERENCES loans(id)
);

CREATE TABLE loans_mtm (
    book_id INT,
    loan_id INT,
    PRIMARY KEY (book_id, loan_id),
    FOREIGN KEY (book_id) REFERENCES books(id),
    FOREIGN KEY (loan_id) REFERENCES loans(id)
);

INSERT INTO publishers (name, address, phone, website) VALUES
('Random House', '123 Main St, Cityville', '123-456-7890', 'www.randomhouse.com'),
('HarperCollins', '456 Elm St, Townsville', '987-654-3210', 'www.harpercollins.com'),
('Simon & Schuster', '789 Oak St, Villagetown', '555-123-4567', 'www.simonschuster.com'),
('Penguin Books', '321 Pine St, Hamletville', '555-987-6543', 'www.penguinbooks.com'),
('Hachette Book Group', '654 Maple St, Countryside', '111-222-3333', 'www.hachettebookgroup.com'),
('Penguin Random House', '1745 Broadway, New York, NY, USA', '+1 212-782-9000', 'www.penguinrandomhouse.com'),
('HarperCollins Publishers', '195 Broadway, New York, NY, USA', '+1 212-207-7000', 'www.harpercollins.com'),
('Simon & Schuster', '1230 Avenue of the Americas, New York, NY, USA', '+1 212-698-7000', 'www.simonandschuster.com'),
('Macmillan Publishers', '120 Broadway, New York, NY, USA', '+1 212-226-7525', 'us.macmillan.com'),
('Hachette Book Group', '1290 Avenue of the Americas, New York, NY, USA', '+1 212-364-1100', 'www.hachettebookgroup.com'),
('Scholastic Corporation', '557 Broadway, New York, NY, USA', '+1 212-343-6100', 'www.scholastic.com'),
('Pearson Education', '330 Hudson Street, New York, NY, USA', '+1 212-414-6000', 'www.pearson.com');;

INSERT INTO genres (name, description) VALUES
('Fiction', 'Books that are not based on real events or people'),
('Non-Fiction', 'Books that are based on real events or people'),
('Science Fiction', 'Books that speculate on scientific discoveries or technologies'),
('Mystery', 'Books that involve solving a crime or puzzle'),
('Fantasy', 'Books that involve magical or supernatural elements'),
('Thriller', 'A genre of literature, film, or television that is designed to excite the audience.'),
('Romance', 'Focuses on romantic love relationships between characters.'),
('Historical Fiction', 'Set in the past and often incorporates real historical events or people.'),
('Horror', 'Intended to scare, shock, or disgust the audience with supernatural elements, violence, or gore.'),
('Biography', 'An account of someones life written by someone else.'),
('Self-Help', 'Books offering guidance on personal growth, self-improvement, or self-help.'),
('Poetry', 'Literary work that uses aesthetic and rhythmic qualities of language to evoke meanings.');

INSERT INTO book_authors (name, birth_date, nationality, biography) VALUES
('John Smith', '1975-08-15', 'American', 'John Smith is a prolific author with over 20 published books.'),
('Jane Doe', '1980-04-20', 'British', 'Jane Doe is an award-winning author known for her captivating storytelling.'),
('Michael Johnson', '1992-11-30', 'Canadian', 'Michael Johnson is a new author making waves in the literary world.'),
('Emily Wilson', '1985-06-25', 'Australian', 'Emily Wilson writes gripping mysteries that keep readers on the edge of their seats.'),
('David Brown', '1970-01-10', 'Irish', 'David Brown is known for his epic fantasy series set in a richly imagined world.'),
('Jane Austen', '1775-12-16', 'British', 'Jane Austen was an English novelist known primarily for her six major novels, which interpret, critique and comment upon the British landed gentry at the end of the 18th century.'),
('Charles Dickens', '1812-02-07', 'British', 'Charles Dickens was an English writer and social critic. He created some of the world''s best-known fictional characters and is regarded by many as the greatest novelist of the Victorian era.'),
('Ernest Hemingway', '1899-07-21', 'American', 'Ernest Hemingway was an American novelist, short-story writer, and journalist. His economical and understated style had a strong influence on 20th-century fiction, while his adventurous lifestyle and his public image brought him admiration from later generations.'),
('Agatha Christie', '1890-09-15', 'British', 'Agatha Christie was an English writer known for her 66 detective novels and 14 short story collections, particularly those revolving around fictional detectives Hercule Poirot and Miss Marple.'),
('Toni Morrison', '1931-02-18', 'American', 'Toni Morrison was an American novelist, essayist, editor, teacher, and professor emeritus at Princeton University. Her novels are known for their epic themes, vivid dialogue, and richly detailed characters.'),
('J.R.R. Tolkien', '1892-01-03', 'British', 'J.R.R. Tolkien was an English writer, poet, philologist, and academic, best known as the author of the high fantasy works The Hobbit and The Lord of the Rings.'),
('Gabriel García Márquez', '1927-03-06', 'Colombian', 'Gabriel García Márquez was a Colombian novelist, short-story writer, screenwriter, and journalist, known affectionately as Gabo throughout Latin America. He was considered one of the most significant authors of the 20th century and was awarded the Nobel Prize in Literature in 1982.');

INSERT INTO books (title, isbn, edition, release_year, price, publisher_id, genre_id) VALUES
('The Journey of Self-Discovery', '978-1234567890', 1, 2020, 19.99, 1, 1),
('Secrets Unveiled: A Detective Memoir', '978-0987654321', 2, 2018, 15.99, 2, 2),
('Recipes for Success: Business Strategies Unveiled', '978-9876543210', 1, 2022, 24.99, 1, 3),
('Thriving in the Digital Age: Strategies for Success', '978-5432109876', 1, 2021, 29.99, 3, 4),
('The Art of Mindfulness: Living in the Present', '978-1357924680', 3, 2019, 12.99, 4, 5),
('Pride and Prejudice', '9780141439518', 1, 2000, 9.99, 1, 1), 
('Great Expectations', '9780141439563', 1, 2001, 12.99, 2, 1), 
('The Old Man and the Sea', '9780684801223', 1, 2002, 10.99, 3, 1), 
('Murder on the Orient Express', '9780062693662', 1, 2002, 11.99, 4, 3), 
('The Fellowship of the Ring', '9780547928210', 1, 2004, 15.99, 5, 5), 
('Beloved', '9781400033416', 1, 2005, 14.99, 6, 1), 
('One Hundred Years of Solitude', '9780060883287', 1, 2006, 13.99, 7, 2);

INSERT INTO customers (name, address, phone, email, password_code) VALUES
('Alice Johnson', '123 Maple St, Smalltown', '555-123-4567', 'alice.johnson@gmail.com', 'SecurePass123!'),
('Bob Smith', '456 Oak St, Villagetown', '555-987-6543', 'bob.smith@yahoo.com', 'StrongPass456$'),
('Charlie Brown', '789 Pine St, Hamletville', '555-111-2222', 'charlie.brown@hotmail.com', 'SafePassword789!'),
('David Davis', '654 Elm St, Countryside', '555-333-4444', 'david.davis@example.com', 'ProtectedPassABC$'),
('Emma Wilson', '987 Cedar St, Cityville', '555-555-5555', 'emma.wilson@outlook.com', 'SecretPassDEF!'),
('Emma Johnson', '789 Elm Road, Village, Country', '+1122334455', 'emma@example.com', 'new_hashed_password_1'),
('Oliver Brown', '101 Pine Lane, City, Country', '+1122334455', 'oliver@example.com', 'new_hashed_password_2'),
('Ava Wilson', '202 Maple Street, Town, Country', '+9988776655', 'ava@example.com', 'new_hashed_password_3'),
('Liam Anderson', '303 Cedar Avenue, Village, Country', '+5544332211', 'liam@example.com', 'new_hashed_password_4'),
('Charlotte Taylor', '404 Birch Road, City, Country', '+7711223344', 'charlotte@example.com', 'new_hashed_password_5'),
('Noah Smith', '123 Main Street, City, Country', '+1234567890', 'noah@example.com', 'new_hashed_password_6'),
('Isabella Doe', '456 Oak Avenue, Town, Country', '+1987654321', 'isabella@example.com', 'new_hashed_password_7');

INSERT INTO loans (customer_id, book_id, loan_date, due_date, return_date) VALUES
(1, 1, '2024-01-01', '2024-01-15', '2024-01-14'),
(2, 2, '2024-01-05', '2024-01-20', NULL),
(3, 3, '2024-01-10', '2024-01-25', NULL),
(4, 4, '2024-01-15', '2024-01-30', NULL),
(1, 5, '2024-01-20', '2024-02-04', NULL),
(6, 6, '2024-02-01', '2024-02-15', NULL),
(7, 7, '2024-02-02', '2024-02-16', NULL),
(1, 8, '2024-02-03', '2024-02-17', NULL),
(9, 9, '2024-02-04', '2024-02-18', NULL),
(10, 10, '2024-02-05', '2024-02-19', NULL),
(1, 11, '2024-02-06', '2024-02-20', NULL),
(12, 12, '2024-02-07', '2024-02-21', NULL);

INSERT INTO genres_mtm (book_id, genre_id) 
VALUES 
(1, 1), (1, 2),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 1),
(7, 1),
(8, 1),
(9, 2),
(10, 5),
(11, 1),
(12, 2);

INSERT INTO customers_mtm (customer_id, loan_id) 
VALUES 
(1, 1),
(2, 2),
(1, 3),
(4, 4),
(5, 5),
(1, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(1, 11),
(12, 12);


CREATE VIEW rented_books_view AS
SELECT b.title, a.name, p.name, b.release_year, l.loan_date, TIMESTAMPDIFF(DAY, CURDATE(), l.due_date)
FROM books b
INNER JOIN book_authors a ON a.book_id = b.id
INNER JOIN publishers p ON p.id = b.publisher_id
INNER JOIN loans l ON l.book_id = b.id;

CREATE INDEX publishers_idx ON publishers(id);
CREATE INDEX books_idx ON books(id);
CREATE INDEX authors_idx ON book_authors(id);
CREATE INDEX loans_idx ON loans(id);
