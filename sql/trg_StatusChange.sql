CREATE TRIGGER trg_StatusChange
    ON Books
    AFTER UPDATE
              AS
BEGIN
    IF (UPDATE(CurrentStatus))
BEGIN
INSERT INTO AuditLog (BookID, StatusChange, ChangeDate)
SELECT INSERTED.BookID, INSERTED.CurrentStatus, GETDATE()
FROM INSERTED;
END
END;
