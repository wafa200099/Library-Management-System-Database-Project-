SELECT Books.Author, COUNT(*) AS BorrowCount
FROM Loans
         JOIN Books ON Loans.BookID = Books.BookID
GROUP BY Books.Author
ORDER BY BorrowCount DESC;