Print Prime Numbers

    CREATE TABLE Prime_Numbers(number int);

    DECLARE @nr int;
    DECLARE @div int;
    DECLARE @prime bit;

    SELECT @nr = 1;

    WHILE(@nr <= 1000)
    BEGIN
    SELECT @div = FLOOR(@nr/2);
    SELECT @prime = 1;

    WHILE(@div > 1)

     BEGIN
     IF @nr % @div =0
     SELECT @prime = 0
     SELECT @div = @div - 1;
     END

     IF @prime = 1 AND @nr <> 1
     INSERT INTO Prime_Numbers (number) values (@nr);

    SELECT @nr = @nr + 1
    END

    SELECT STRING_AGG(number,'&') FROM Prime_Numbers;