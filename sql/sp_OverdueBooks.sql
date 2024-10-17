CREATE PROCEDURE sp_OverdueBooks
    AS
BEGIN
    DECLARE @ThirtyDaysAgo DATE = DATEADD(DAY, -30, GETDATE());

CREATE TABLE #OverdueBorrowers (BorrowerID INT);

INSERT INTO #OverdueBorrowers (BorrowerID)
SELECT DISTINCT BorrowerID
FROM Loans
WHERE Loans.DueDate < @ThirtyDaysAgo
  AND Loans.DateReturned IS NULL;

SELECT Borrowers.FirstName, Borrowers.LastName, Books.Title
FROM #OverdueBorrowers
         JOIN Loans ON #OverdueBorrowers.BorrowerID = Loans.BorrowerID
         JOIN Books ON Loans.BookID = Books.BookID
WHERE Loans.DueDate < @ThirtyDaysAgo
  AND Loans.DateReturned IS NULL;
END;
