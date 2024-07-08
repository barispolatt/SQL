ALTER PROCEDURE GetDataLogByCreationDateRange
    @StartDateStr varchar(50), @EndDateStr varchar(50)   
AS
BEGIN
    DECLARE @StartDate DATETIME
    DECLARE @EndDate DATETIME
    BEGIN TRY
        SET @StartDate = CONVERT(DATETIME, @StartDateStr, 121) 
        SET @EndDate = CONVERT(DATETIME, @EndDateStr, 121)
    END TRY
    BEGIN CATCH
        RAISERROR('Invalid date format. Please provide date in yyyy-mm-dd hh:mi:ss.mmm format.', 16, 1)
        RETURN
    END CATCH

    IF @StartDate IS NULL OR @EndDate IS NULL
    BEGIN
        RAISERROR('Conversion failed. Ensure dates are in a valid format.', 16, 1)
        RETURN
    END

    SELECT 
        dl.*
    FROM 
        traDataLog AS dl
    INNER JOIN 
        traProducts AS p ON dl.SerialNo = p.SerialNo
    WHERE 
        p.CreationDate BETWEEN @StartDate AND @EndDate
END
