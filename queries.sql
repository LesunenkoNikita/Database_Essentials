SELECT g.name, b.price
FROM genres g
JOIN books b ON g.id=b.id
ORDER BY b.price ASC;

SELECT g.name, SUM(b.price)
FROM genres g
JOIN books b ON g.id=b.id
GROUP BY g.name
HAVING SUM(b.price) > 16;

SELECT b.title, l.due_date
FROM books b 
JOIN loans l ON b.id=l.book_id
WHERE l.return_date is NULL;

SELECT title, edition
FROM books
WHERE release_year > 2020;

SELECT name, birth_date
FROM book_authors
ORDER BY birth_date ASC
