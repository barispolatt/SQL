USE [DWConfiguration]
GO
/****** Object:  StoredProcedure [dbo].[HesapMakinesi]    Script Date: 8 Tem 2024 11:43:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[HesapMakinesi] (@num1 FLOAT, @num2 FLOAT, @operation CHAR(1), @result FLOAT OUTPUT)
AS
BEGIN
    BEGIN TRANSACTION;
    DECLARE @tempResult FLOAT
    IF @operation = '+'
    BEGIN
        SET @tempResult = dbo.Toplama(@num1, @num2)
    END
    ELSE IF @operation = '-'
    BEGIN
        SET @tempResult = dbo.Cikarma(@num1, @num2)
    END
    ELSE IF @operation = '*'
    BEGIN
        SET @tempResult = dbo.Carpim(@num1, @num2)
    END
    ELSE IF @operation = '/'
    BEGIN
        SET @tempResult = dbo.Bolme(@num1, @num2)
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
        RAISERROR('Gecerli bir islem giriniz', 16, 1)
        RETURN
    END

    SET @result = @tempResult

    COMMIT TRANSACTION
END
