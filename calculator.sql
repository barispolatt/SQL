CREATE PROCEDURE dbo.HesapMakinesi (@num1 FLOAT, @num2 FLOAT, @operation CHAR(1), @result FLOAT OUTPUT)
AS
BEGIN
    BEGIN TRANSACTION;
    DECLARE @tempResult FLOAT
    IF @operation = '+'
    BEGIN
        SET @tempResult = dbo.Addition(@num1, @num2)
    END
    ELSE IF @operation = '-'
    BEGIN
        SET @tempResult = dbo.Subtraction(@num1, @num2)
    END
    ELSE IF @operation = '*'
    BEGIN
        SET @tempResult = dbo.Multiplication(@num1, @num2)
    END
    ELSE IF @operation = '/'
    BEGIN
        SET @tempResult = dbo.Division(@num1, @num2)
        IF @tempResult IS NULL
        BEGIN
            ROLLBACK TRANSACTION
            RAISERROR('Sifirdan farkli bir deger giriniz', 16, 1)
            RETURN
        END
    END
    ELSE
    BEGIN
        ROLLBACK TRANSACTION;
        RAISERROR('Gecerli bir tuslama yapiniz', 16, 1)
        RETURN
    END

    SET @result = @tempResult

    COMMIT TRANSACTION
END
