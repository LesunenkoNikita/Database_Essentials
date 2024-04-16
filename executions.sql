CALL choose_publishers_books('Random House');

SET @unreturned_books_amount = 0;
CALL unreturned_books(@unreturned_books_amount);
SELECT @unreturned_books_amount;

SET @authors_books_amount = 0;
CALL written_books_amount('John Smith', @authors_books_amount);
SELECT @authors_books_amount;
