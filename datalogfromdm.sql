ALTER PROCEDURE GetDataLogByDm
    @Dm VARCHAR(100)
AS
BEGIN
    SELECT 
        dl.*
    FROM 
        traDataLog AS dl
    INNER JOIN 
        traProducts AS p 
		ON 
		dl.SerialNo = p.SerialNo
    WHERE 
        p.Dm = @Dm;
END;
