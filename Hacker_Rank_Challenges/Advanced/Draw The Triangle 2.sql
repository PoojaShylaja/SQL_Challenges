Draw The Triangle 2

DECLARE @num int;
SET @num = 1;
WHILE (@num < 21)
BEGIN
PRINT(REPLICATE('* ',@num))
SET @num = @num + 1;
END
