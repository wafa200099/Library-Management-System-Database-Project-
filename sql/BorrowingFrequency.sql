SELECT BorrowerID, COUNT(*) AS BorrowingCount,
       RANK() OVER (ORDER BY COUNT(*) DESC) AS BorrowerRank
FROM Loans
GROUP BY BorrowerID;