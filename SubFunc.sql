CREATE FUNCTION dbo.Cikarma (@num1 FLOAT, @num2 FLOAT)
RETURNS FLOAT
AS
BEGIN
    RETURN @num1 - @num2;
END;
