CREATE FUNCTION fn_CalculateOverdueFees (@LoanID INT)
    RETURNS DECIMAL(10, 2)
AS
BEGIN
    DECLARE @DueDate DATE, @DaysOverdue INT, @Fee DECIMAL(10, 2);

SELECT @DueDate = DueDate FROM Loans WHERE LoanID = @LoanID;
SET @DaysOverdue = DATEDIFF(DAY, @DueDate, GETDATE());

    IF @DaysOverdue <= 30
        SET @Fee = @DaysOverdue * 1;
ELSE
        SET @Fee = (30 * 1) + ((@DaysOverdue - 30) * 2);

RETURN @Fee;
END;
