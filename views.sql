CREATE VIEW rented_books_view AS
SELECT b.title, a.name, b.release_year, l.loan_date, TIMESTAMPDIFF(DAY, CURDATE(), l.due_date)
FROM loans l
INNER JOIN book_authors a ON a.book_id = l.book_id
INNER JOIN books b ON l.book_id = b.id;

CREATE INDEX books_idx ON books(id);
CREATE INDEX authors_idx ON book_authors(id);
CREATE INDEX loans_idx ON loans(id);
