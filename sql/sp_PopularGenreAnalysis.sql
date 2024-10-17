CREATE PROCEDURE sp_PopularGenreAnalysis
    @Month INT
AS
BEGIN
SELECT Genre, COUNT(*) AS BorrowCount,
       RANK() OVER (ORDER BY COUNT(*) DESC) AS GenreRank
FROM Loans
         JOIN Books ON Loans.BookID = Books.BookID
WHERE MONTH(Loans.DateBorrowed) = @Month
GROUP BY Genre;
END;
