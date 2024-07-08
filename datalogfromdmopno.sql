ALTER PROCEDURE GetDataLogByDmAndOperationNo
    @Dm VARCHAR(100),
    @OperationNo INT
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
        p.Dm = @Dm AND 
        dl.OperationNo = @OperationNo;
END;
