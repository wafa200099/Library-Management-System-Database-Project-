
-- Identify borrowers who’ve borrowed 2 or more books but haven’t returned any.
--
-- CTE
WITH ActiveBorrowers AS (
    SELECT BorrowerID, COUNT(*) AS BorrowedBooks
    FROM Loans
    WHERE DateReturned IS NULL
    GROUP BY BorrowerID
    HAVING COUNT(*) >= 2
)
SELECT Borrowers.FirstName, Borrowers.LastName, ActiveBorrowers.BorrowedBooks
FROM ActiveBorrowers
         JOIN Borrowers ON ActiveBorrowers.BorrowerID = Borrowers.BorrowerID;
