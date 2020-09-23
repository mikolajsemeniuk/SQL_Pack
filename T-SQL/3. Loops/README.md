# Loops

So far we've learned how to store data and make conditional statements
In this section we gonna learn how to:
* Save value from col1 from every row to variable and print it.
* Exit While loop.
Using previous declared and assign variables @i = 0 and @len = 7 every part of code executes 7 times

## Get Value
Let's declare and assign value from n row and from col1 to variable 'val' in a loop and print it as well
```sql
WHILE(@i < @len)
BEGIN

    DECLARE @val VARCHAR(255)
    
    SET @val = (
        SELECT
            [col1]
        FROM
            [Table]
        ORDER BY
            (SELECT NULL)
        OFFSET @i ROWS
            FETCH ONLY 1 NEXT ROWS
    )
    
    PRINT 'val: ' + @val
    
    SET @i = @i + 1
    
END
```

## Break loop
Let's break the loop using 'BREAK' statement when we reach value which is null
```sql
WHILE(@i < @len)
BEGIN

    DECLARE @val VARCHAR(255)
    
    SET @val = (
        SELECT
            [col1]
        FROM
            [Table]
        ORDER BY
            (SELECT NULL)
        OFFSET @i ROWS
            FETCH ONLY 1 NEXT ROWS
    )
    
    PRINT 'val: ' + @val
    
    IF @val IS NULL
        BREAK
    
    SET @i = @i + 1
    
END
```
