CREATE PROCEDURE sp_BorrowedBooksReport
    @StartDate DATE,
    @EndDate DATE
AS
BEGIN
SELECT Books.Title, Borrowers.FirstName, Borrowers.LastName, Loans.DateBorrowed
FROM Loans
         JOIN Books ON Loans.BookID = Books.BookID
         JOIN Borrowers ON Loans.BorrowerID = Borrowers.BorrowerID
WHERE Loans.DateBorrowed BETWEEN @StartDate AND @EndDate;
END;
