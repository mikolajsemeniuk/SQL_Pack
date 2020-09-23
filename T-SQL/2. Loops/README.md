# Loops

This readme shows You how to make loops in T-SQL

## Get iterator

Get iterator to know when to finish the loop

```sql
-- Declare iterator
DECLARE @i BIGINT
SET @i = 0
```

## Get length of all rows

Get length of all rows to know how many iterations we have to do when we would like to go through whole table

```sql
-- Get len of all rows
DECLARE @len BIGINT
SET @len = (
    SELECT
        COUNT(*)
    FROM
        [Table]
)
```

## Make simple loop

Make simple loop with @i and @len and print all iterations

```sql
-- Declare loop
WHILE(@i < @len)
BEGIN
    -- Print number of iterations
    PRINT 'i: ' + CAST(@i AS VARCHAR)
    
    -- Increase iterator to avoid infinitive loop
    SET @i = @i + 1
END
```

## Get single value

Break loop when we meet our condition like e.g. reach the fifth row like above

```sql
-- Declare loop
WHILE(@i < @len)
BEGIN
    -- 
    DECLARE @val VARCHAR(255)
    SET @val = (
        SELECT
            [col1]
        FROM
            [Table]
        ORDER BY
            (SELECT NULL)
        OFFSET @i ROWS
            FETCH ONLY 1 ROWS ONLY
    )
    
    -- Print number of iterations
    PRINT 'i: ' + CAST(@i AS VARCHAR) 
    
    -- Print catched value
    PRINT 'val: ' + @val -- no need to cast value becuase @val is type of VARCHAR(255) so there is no problem with concatenate 
 
    -- clear values just to make sure because sometimes Declaring in loop scope doesn't overwrite @val value 
    SET @val = NULL
 
    -- Increase iterator to avoid infinitive loop
    SET @i = @i + 1
END
```

## Get whole column

Get whole column which m

```sql

-- Declare row outside the loop because sometime value is not overwrite in loop scope and we have to clean it manually
DECLARE @col VARCHAR(255)

-- Declare loop
WHILE(@i < @len)
BEGIN
    -- 
    SELECT 
        @col = COALESCE(@col + ',', '') + CONVERT(VARCHAR(255), [col1])
    FROM
        [Table]
    WHERE
        [col2] IS NOT NULL
    ORDER BY
        (SELECT NULL)
    OFFSET @i ROWS
        FETCH NEXT 1 ROWS ONLY
    
    -- Print number of iterations
    PRINT 'i: ' + CAST(@i AS VARCHAR) 
    
    -- Print catched value
    PRINT 'val: ' + @val -- no need to cast value becuase @val is type of VARCHAR(255) so there is no problem with concatenate 
 
    -- clear values just to make sure because sometimes Declaring in loop scope doesn't overwrite @val value 
    SET @val = NULL
 
    -- Increase iterator to avoid infinitive loop
    SET @i = @i + 1
END
```

## Break loop

Break loop when we meet our condition like e.g. reach the fifth row like aboce

```sql
-- Declare loop
WHILE(@i < @len)
BEGIN
    -- Print number of iterations
    PRINT 'i: ' + CAST(@i AS VARCHAR) 

    -- Break the current loop when i = 5
    IF @i = 5
        BREAK 
 
    -- Increase iterator to avoid infinitive loop
    SET @i = @i + 1
END
```

## Final code

```sql
-- Get len of all rows
DECLARE @len BIGINT
SET @len = (
    SELECT
        COUNT(*)
    FROM
        [Table A]
)

-- Declare iterator
DECLARE @i BIGINT
SET @i = 0

-- Declare loop
WHILE(@i < @len)
BEGIN
    -- Print number of iterations
    PRINT 'i: ' + CAST(@i AS VARCHAR)

    -- Break the current loop when i = 5
    IF @i = 5
        BREAK 

    -- Increase iterator to avoid infinitive loop
    SET @i = @i + 1
END
```


## License
[MIT](https://choosealicense.com/licenses/mit/)
