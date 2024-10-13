SELECT CASE
           WHEN DATEDIFF(YEAR, Borrowers.DateOfBirth, GETDATE()) BETWEEN 0 AND 10 THEN '0-10'
           WHEN DATEDIFF(YEAR, Borrowers.DateOfBirth, GETDATE()) BETWEEN 11 AND 20 THEN '11-20'
           WHEN DATEDIFF(YEAR, Borrowers.DateOfBirth, GETDATE()) BETWEEN 21 AND 30 THEN '21-30'
           ELSE '31+'
           END AS AgeGroup, Books.Genre, COUNT(*) AS BorrowCount
FROM Loans
         JOIN Borrowers ON Loans.BorrowerID = Borrowers.BorrowerID
         JOIN Books ON Loans.BookID = Books.BookID
GROUP BY Books.Genre,
         CASE
             WHEN DATEDIFF(YEAR, Borrowers.DateOfBirth, GETDATE()) BETWEEN 0 AND 10 THEN '0-10'
             WHEN DATEDIFF(YEAR, Borrowers.DateOfBirth, GETDATE()) BETWEEN 11 AND 20 THEN '11-20'
             WHEN DATEDIFF(YEAR, Borrowers.DateOfBirth, GETDATE()) BETWEEN 21 AND 30 THEN '21-30'
             ELSE '31+'
             END
HAVING COUNT(*) > 0;
