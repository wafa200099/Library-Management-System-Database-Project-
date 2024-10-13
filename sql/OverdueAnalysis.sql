-- List all books overdue by more than 30 days with their associated borrowers.
SELECT Borrowers.FirstName, Borrowers.LastName, Books.Title, Loans.DateBorrowed, Loans.DueDate
FROM Loans
         JOIN Borrowers ON Loans.BorrowerID = Borrowers.BorrowerID
         JOIN Books ON Loans.BookID = Books.BookID
WHERE DATEDIFF(DAY, Loans.DueDate, GETDATE()) > 30
  AND Loans.DateReturned IS NULL;
