CREATE PROCEDURE sp_AddNewBorrower
    @FirstName VARCHAR(100),
    @LastName VARCHAR(100),
    @Email VARCHAR(255),
    @DateOfBirth DATE,
    @MembershipDate DATE
AS
BEGIN
    IF EXISTS (SELECT 1 FROM Borrowers WHERE Email = @Email)
BEGIN
        PRINT 'Email already exists';
        RETURN;
END
ELSE
BEGIN
INSERT INTO Borrowers (FirstName, LastName, Email, DateOfBirth, MembershipDate)
VALUES (@FirstName, @LastName, @Email, @DateOfBirth, @MembershipDate);
SELECT SCOPE_IDENTITY() AS NewBorrowerID;
END
END;
