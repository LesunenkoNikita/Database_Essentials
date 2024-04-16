SELECT b.id, b.title 
FROM books b
WHERE b.genre_id = (
                    SELECT id
                    FROM genres
                    WHERE name = 'Fiction');
-- Обрали книги жанром яких є фантастика, SELECT = with non-correlated subqueries result

SELECT b.id, b.title
FROM books b
WHERE b.genre_id IN (
                     SELECT id
                     FROM genres
                     WHERE name IN ('Fiction', 'Mystery', 'Science Fiction'));
-- Обрали книги жанром яких є один з жанрів : фантастика, наукова фантастика, містика, SELECT IN with non-correlated subqueries result
SELECT b.id, b.title
FROM books b
WHERE b.genre_id NOT IN (
                     SELECT id
                     FROM genres
                     WHERE name IN ('Fiction', 'Mystery', 'Science Fiction'));
-- Обрали книги жанром яких не є один з жанрів : фантастика, наукова фантастика, містика, SELECT NOT IN with non-correlated subqueries result

SELECT b.id, b.title
FROM books b
WHERE EXISTS (
              SELECT id
              FROM genres
              WHERE genres.name = 'Fiction');

-- Обрати книги, в яких жанр фантастика, EXISTS with non-correlated subqueries result

SELECT b.id, b.title
FROM books b
WHERE NOT EXISTS (
              SELECT id
              FROM genres
              WHERE genres.name = 'Fiction');

-- Обрати всі книги, окрім тих, в яких жанр фантастика, NOT EXISTS with non-correlated subqueries result

UPDATE books
SET price = 19.99
WHERE genre_id = (
                    SELECT id
                    FROM genres
                    WHERE name = 'Fiction');
-- змінити ціну на 19.99 у всіх книжок жанру фантастики, update query with = with non-correlated subqueries result

UPDATE books
SET price = 19.99
WHERE genre_id IN (
                     SELECT id
                     FROM genres
                     WHERE name IN ('Fiction', 'Mystery', 'Science Fiction'));
-- змінити ціну на 19.99 у всіх книжок жанру фантастики, наукової фантастики або містики, update query with IN with non-correlated subqueries

UPDATE books
SET price = 19.99
WHERE genre_id NOT IN (
                     SELECT id
                     FROM genres
                     WHERE name IN ('Fiction', 'Mystery', 'Science Fiction'));

-- змінити ціну на 19.99 у всіх книжок будь-якого жанру, крім фантастики, наукової фантастики або містики, update query with  NOT IN with non-correlated subqueries

UPDATE books
SET price = 19.99
WHERE EXISTS (
              SELECT id
              FROM genres
              WHERE genres.name = 'Fiction');
-- змінити ціну на 19.99 у всіх книжок жанру фантастики, update query with EXISTS with non-correlated subqueries

UPDATE books
SET price = 19.99
WHERE NOT EXISTS (
              SELECT id
              FROM genres
              WHERE genres.name = 'Fiction');

-- змінити ціну на 19.99 у всіх книжок будь-якого жанру, крім фантастики, update query with NOT EXISTS with non-correlated subqueries

DELETE
FROM books b
WHERE b.genre_id = (
                    SELECT id
                    FROM genres
                    WHERE name = 'Fiction');
-- Видалити книги жанром яких є фантастика, DELETE = with non-correlated subqueries result

DELETE
FROM books b
WHERE b.genre_id IN (
                     SELECT id
                     FROM genres
                     WHERE name IN ('Fiction', 'Mystery', 'Science Fiction'));
-- видалити книги жанром яких є один з жанрів : фантастика, наукова фантастика, містика, DELETE IN with non-correlated subqueries result

DELETE
FROM books b
WHERE b.genre_id NOT IN (
                     SELECT id
                     FROM genres
                     WHERE name IN ('Fiction', 'Mystery', 'Science Fiction'));
-- Видалити книги жанром яких не є один з жанрів : фантастика, наукова фантастика, містика, DELETE NOT IN with non-correlated subqueries result

DELETE
FROM books b
WHERE EXISTS (
              SELECT id
              FROM genres
              WHERE genres.name = 'Fiction');

-- Видалити книги, в яких жанр фантастика,DELETE EXISTS with non-correlated subqueries result

DELETE
FROM books b
WHERE NOT EXISTS (
              SELECT id
              FROM genres
              WHERE genres.name = 'Fiction');

-- Видалити всі книги, окрім тих, в яких жанр фантастика, DELETE NOT EXISTS with non-correlated subqueries result

SELECT b.id, b.title 
FROM books b
WHERE genre_id = (
                    SELECT id
                    FROM genres
                    WHERE name = 'Fiction' AND genres.id = b.genre_id);
-- Обрали книги жанром яких є фантастика, SELECT = with correlated subqueries result

SELECT b.id, b.title
FROM books b
WHERE b.genre_id IN (
                     SELECT id
                     FROM genres
                     WHERE name IN ('Fiction', 'Mystery', 'Science Fiction') AND genres.id = b.genre_id);
-- Обрали книги жанром яких є один з жанрів : фантастика, наукова фантастика, містика, SELECT IN with correlated subqueries result
SELECT b.id, b.title
FROM books b
WHERE b.genre_id NOT IN (
                     SELECT id
                     FROM genres
                     WHERE name IN ('Fiction', 'Mystery', 'Science Fiction') AND genres.id = b.genre_id);
-- Обрали книги жанром яких не є один з жанрів : фантастика, наукова фантастика, містика, SELECT NOT IN with correlated subqueries result

SELECT b.id, b.title
FROM books b
WHERE EXISTS (
              SELECT id
              FROM genres
              WHERE genres.name = 'Fiction' AND genres.id = b.genre_id);

-- Обрати книги, в яких жанр фантастика, EXISTS with correlated subqueries result

SELECT b.id, b.title
FROM books b
WHERE NOT EXISTS (
              SELECT id
              FROM genres
              WHERE genres.name = 'Fiction' AND genres.id = b.genre_id);

-- Обрати всі книги, окрім тих, в яких жанр фантастика, NOT EXISTS with correlated subqueries result

UPDATE books
SET price = 19.99
WHERE genre_id = (
                    SELECT id
                    FROM genres
                    WHERE name = 'Fiction' AND genres.id = b.genre_id);
-- змінити ціну на 19.99 у всіх книжок жанру фантастики, update query with = with correlated subqueries result

UPDATE books
SET price = 19.99
WHERE genre_id IN (
                     SELECT id
                     FROM genres
                     WHERE name IN ('Fiction', 'Mystery', 'Science Fiction') AND genres.id = b.genre_id);
-- змінити ціну на 19.99 у всіх книжок жанру фантастики, наукової фантастики або містики, update query with IN with correlated subqueries

UPDATE books
SET price = 19.99
WHERE genre_id NOT IN (
                     SELECT id
                     FROM genres
                     WHERE name IN ('Fiction', 'Mystery', 'Science Fiction') AND genres.id = b.genre_id);

-- змінити ціну на 19.99 у всіх книжок будь-якого жанру, крім фантастики, наукової фантастики або містики, update query with  NOT IN with correlated subqueries

UPDATE books
SET price = 19.99
WHERE EXISTS (
              SELECT id
              FROM genres
              WHERE genres.name = 'Fiction' AND genres.id = b.genre_id);
-- змінити ціну на 19.99 у всіх книжок жанру фантастики, update query with EXISTS with correlated subqueries

UPDATE books
SET price = 19.99
WHERE NOT EXISTS (
              SELECT id
              FROM genres
              WHERE genres.name = 'Fiction' AND genres.id = b.genre_id);

-- змінити ціну на 19.99 у всіх книжок будь-якого жанру, крім фантастики, update query with NOT EXISTS with correlated subqueries

DELETE
FROM books b
WHERE b.genre_id = (
                    SELECT id
                    FROM genres
                    WHERE name = 'Fiction' AND genres.id = b.genre_id);
-- Видалити книги жанром яких є фантастика, DELETE = with correlated subqueries result

DELETE
FROM books b
WHERE b.genre_id IN (
                     SELECT id
                     FROM genres
                     WHERE name IN ('Fiction', 'Mystery', 'Science Fiction') AND genres.id = b.genre_id);
-- видалити книги жанром яких є один з жанрів : фантастика, наукова фантастика, містика, DELETE IN with correlated subqueries result

DELETE
FROM books b
WHERE b.genre_id NOT IN (
                     SELECT id
                     FROM genres
                     WHERE name IN ('Fiction', 'Mystery', 'Science Fiction' AND genres.id = b.genre_id);
-- Видалити книги жанром яких не є один з жанрів : фантастика, наукова фантастика, містика, DELETE NOT IN with correlated subqueries result

DELETE
FROM books b
WHERE EXISTS (
              SELECT id
              FROM genres
              WHERE genres.name = 'Fiction' AND genres.id = b.genre_id);

-- Видалити книги, в яких жанр фантастика,DELETE EXISTS with correlated subqueries result

DELETE
FROM books b
WHERE NOT EXISTS (
              SELECT id
              FROM genres
              WHERE genres.name = 'Fiction' AND genres.id = b.genre_id);

-- Видалити всі книги, окрім тих, в яких жанр фантастика, DELETE NOT EXISTS with correlated subqueries result
