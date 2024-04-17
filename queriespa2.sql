SELECT b.title, g.name
FROM books b
JOIN genres_mtm gm ON b.id = gm.book_id
JOIN genres g ON gm.genre_id = g.id
WHERE gm.genre_id = 1;

SELECT c.name, l.loan_date
FROM loans l
JOIN customers_mtm cm ON l.id = cm.loan_id
JOIN customers c ON c.id = cm.customer_id
WHERE cm.customer_id = 1
