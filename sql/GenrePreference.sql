WITH BorrowerAgeGroups AS (
    SELECT
        CASE
            WHEN DATEDIFF(YEAR, Borrowers.DateOfBirth, GETDATE()) BETWEEN 0 AND 10 THEN '0-10'
            WHEN DATEDIFF(YEAR, Borrowers.DateOfBirth, GETDATE()) BETWEEN 11 AND 20 THEN '11-20'
            WHEN DATEDIFF(YEAR, Borrowers.DateOfBirth, GETDATE()) BETWEEN 21 AND 30 THEN '21-30'
            ELSE '31+'
            END AS AgeGroup,
        Books.Genre
    FROM Loans
             JOIN Borrowers ON Loans.BorrowerID = Borrowers.BorrowerID
             JOIN Books ON Loans.BookID = Books.BookID
)
SELECT
    AgeGroup,
    Genre,
    COUNT(*) AS BorrowCount
FROM BorrowerAgeGroups
GROUP BY AgeGroup, Genre
HAVING COUNT(*) > 0;
