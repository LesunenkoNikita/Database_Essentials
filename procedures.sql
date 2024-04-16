--This procedure chooses all books of a publisher with IN parameter
CREATE PROCEDURE choose_publishers_books_sproc(IN publisher_name VARCHAR(100))
BEGIN 
    SELECT b.title 
    FROM books b
    INNER JOIN publishers p ON b.publisher_id = p.id
    WHERE p.name = publisher_name;
END;
--This procedure returns amount of unreturned books in the library with OUT parameter
CREATE PROCEDURE unreturned_books_sproc(OUT unreturned_amount INT)
BEGIN 
    SELECT COUNT(1) INTO unreturned_amount
    FROM loans l
    WHERE l.return_date = NULL;
END;
--This procedure takes in authors name and returns amount of books they wrote with INOUT parameter
CREATE PROCEDURE written_books_amount_sproc(IN author_name VARCHAR(100), INOUT amount_of_books INT)
BEGIN 
    SELECT COUNT(1) INTO amount_of_books
    FROM books b
    INNER JOIN book_authors a ON b.author_id = a.id
    WHERE a.name = author_name;
END;
--This procedure with transaction takes in customers name and checks if they can borrow more books. they can borrow more books if they have no more than three unreturned books
CREATE PROCEDURE borrowing_ability_sproc(IN customer_name VARCHAR(100))
BEGIN
DECLARE borrowed_amount INT;
START TRANSACTION;
SET borrowed_amount = (SELECT COUNT(1) 
                       FROM loans l 
                       INNER JOIN customers c ON l.customer_id = c.id 
                       WHERE c.name = customer_name);
IF borrowed_amount > 3 THEN 
    ROLLBACK;
    UPDATE customers
    SET can_borrow = FALSE
    WHERE customers.name = customer_name;
    SELECT 'you cannot borrow any more books' AS message;
ELSE
    COMMIT;
    SELECT 'you can borrow more books' AS message;
END IF;
END;
