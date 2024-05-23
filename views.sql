CREATE VIEW rented_books_view AS
SELECT b.title, a.name, p.pname, b.release_year, l.loan_date, TIMESTAMPDIFF(DAY, CURDATE(), l.due_date), l.due_date
FROM loans l
INNER JOIN books b ON l.book_id = b.id
INNER JOIN book_authors a ON b.authors_id = a.id
INNER JOIN publishers p ON b.publisher_id = p.id;
SELECT title, name,	pname, release_year, loan_date,	TIMESTAMPDIFF(DAY, CURDATE(), due_date) FROM rented_books_view;

CREATE INDEX books_idx ON books(id);
CREATE INDEX authors_idx ON book_authors(id);
CREATE INDEX loans_idx ON loans(id);
CREATE INDEX publishers_idx ON publishers(id);
