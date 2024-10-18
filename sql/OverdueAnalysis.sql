DECLARE @ThirtyDaysAgo DATE = DATEADD(DAY, -30, GETDATE());

SELECT Borrowers.FirstName, Borrowers.LastName, Books.Title, Loans.DateBorrowed, Loans.DueDate
FROM Loans
         JOIN Borrowers ON Loans.BorrowerID = Borrowers.BorrowerID
         JOIN Books ON Loans.BookID = Books.BookID
WHERE Loans.DueDate < @ThirtyDaysAgo
  AND Loans.DateReturned IS NULL;
