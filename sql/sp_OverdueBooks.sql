CREATE PROCEDURE sp_OverdueBooks
    AS
BEGIN
CREATE TABLE #OverdueBorrowers (BorrowerID INT);

INSERT INTO #OverdueBorrowers (BorrowerID)
SELECT DISTINCT BorrowerID
FROM Loans
WHERE DATEDIFF(DAY, Loans.DueDate, GETDATE()) > 30
  AND Loans.DateReturned IS NULL;

SELECT Borrowers.FirstName, Borrowers.LastName, Books.Title
FROM #OverdueBorrowers
         JOIN Loans ON #OverdueBorrowers.BorrowerID = Loans.BorrowerID
         JOIN Books ON Loans.BookID = Books.BookID
WHERE DATEDIFF(DAY, Loans.DueDate, GETDATE()) > 30
  AND Loans.DateReturned IS NULL;
END;
