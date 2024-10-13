CREATE PROCEDURE sp_ListBorrowedBooks
    @BorrowerID INT
AS
BEGIN
SELECT Books.Title, Loans.DateBorrowed, Loans.DueDate, Loans.DateReturned
FROM Loans
         JOIN Books ON Loans.BookID = Books.BookID
WHERE Loans.BorrowerID = @BorrowerID;
END;