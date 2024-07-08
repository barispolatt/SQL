CREATE FUNCTION dbo.Bolme (@num1 FLOAT, @num2 FLOAT)
RETURNS FLOAT
AS
BEGIN
    IF @num2 = 0
        RETURN NULL;
    RETURN @num1 / @num2;
END;
