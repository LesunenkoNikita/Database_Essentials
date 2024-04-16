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

CREATE TABLE book_authors (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    birth_date DATE,
    nationality VARCHAR(50),
    biography VARCHAR(255),
    book_id INT,
    FOREIGN KEY (book_id) REFERENCES books(id)
);

CREATE TABLE customers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(255),
    phone VARCHAR(20),
    email VARCHAR(100),
    password_code VARCHAR(100)
);

CREATE TABLE loans (
    id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    book_id INT,
    loan_date DATE NOT NULL,
    due_date DATE,
    return_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(id),
    FOREIGN KEY (book_id) REFERENCES books(id)
);

INSERT INTO publishers (name, address, phone, website) VALUES
('Random House', '123 Main St, Cityville', '123-456-7890', 'www.randomhouse.com'),
('HarperCollins', '456 Elm St, Townsville', '987-654-3210', 'www.harpercollins.com'),
('Simon & Schuster', '789 Oak St, Villagetown', '555-123-4567', 'www.simonschuster.com'),
('Penguin Books', '321 Pine St, Hamletville', '555-987-6543', 'www.penguinbooks.com'),
('Hachette Book Group', '654 Maple St, Countryside', '111-222-3333', 'www.hachettebookgroup.com');

INSERT INTO genres (name, description) VALUES
('Fiction', 'Books that are not based on real events or people'),
('Non-Fiction', 'Books that are based on real events or people'),
('Science Fiction', 'Books that speculate on scientific discoveries or technologies'),
('Mystery', 'Books that involve solving a crime or puzzle'),
('Fantasy', 'Books that involve magical or supernatural elements');

INSERT INTO book_authors (name, birth_date, nationality, biography) VALUES
('John Smith', '1975-08-15', 'American', 'John Smith is a prolific author with over 20 published books.'),
('Jane Doe', '1980-04-20', 'British', 'Jane Doe is an award-winning author known for her captivating storytelling.'),
('Michael Johnson', '1992-11-30', 'Canadian', 'Michael Johnson is a new author making waves in the literary world.'),
('Emily Wilson', '1985-06-25', 'Australian', 'Emily Wilson writes gripping mysteries that keep readers on the edge of their seats.'),
('David Brown', '1970-01-10', 'Irish', 'David Brown is known for his epic fantasy series set in a richly imagined world.');

INSERT INTO books (title, isbn, edition, release_year, price, publisher_id, genre_id) VALUES
('The Journey of Self-Discovery', '978-1234567890', 1, 2020, 19.99, 1, 1),
('Secrets Unveiled: A Detective Memoir', '978-0987654321', 2, 2018, 15.99, 2, 2),
('Recipes for Success: Business Strategies Unveiled', '978-9876543210', 1, 2022, 24.99, 1, 3),
('Thriving in the Digital Age: Strategies for Success', '978-5432109876', 1, 2021, 29.99, 3, 4),
('The Art of Mindfulness: Living in the Present', '978-1357924680', 3, 2019, 12.99, 4, 5);

INSERT INTO customers (name, address, phone, email, password_code) VALUES
('Alice Johnson', '123 Maple St, Smalltown', '555-123-4567', 'alice.johnson@gmail.com', 'SecurePass123!'),
('Bob Smith', '456 Oak St, Villagetown', '555-987-6543', 'bob.smith@yahoo.com', 'StrongPass456$'),
('Charlie Brown', '789 Pine St, Hamletville', '555-111-2222', 'charlie.brown@hotmail.com', 'SafePassword789!'),
('David Davis', '654 Elm St, Countryside', '555-333-4444', 'david.davis@example.com', 'ProtectedPassABC$'),
('Emma Wilson', '987 Cedar St, Cityville', '555-555-5555', 'emma.wilson@outlook.com', 'SecretPassDEF!');

INSERT INTO loans (customer_id, book_id, loan_date, due_date, return_date) VALUES
(1, 1, '2024-01-01', '2024-01-15', '2024-01-14'),
(2, 2, '2024-01-05', '2024-01-20', NULL),
(3, 3, '2024-01-10', '2024-01-25', NULL),
(4, 4, '2024-01-15', '2024-01-30', NULL),
(5, 5, '2024-01-20', '2024-02-04', NULL);
