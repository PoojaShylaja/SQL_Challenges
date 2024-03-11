--Draw The Triangle 1
DECLARE @number int;
SET @number = 20 ;
WHILE (@number>0)
BEGIN
PRINT(REPLICATE('* ',@number))
SET @number = @number - 1;
END
