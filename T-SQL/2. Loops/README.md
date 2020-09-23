# Loops

Foobar is a Python library for dealing with word pluralization.

## Get iterator

Get iterator to know when to finish the loop

```sql
-- Declare iterator
DECLARE @i BIGINT
SET @i = 0
```

## Get length of all rows

Iterating through all records

```sql
-- Get len of all rows
DECLARE @len BIGINT
SET @len = (
    SELECT
        COUNT(*)
    FROM
        [Table A]
)
```

## Make simple loop

Get iterator to know when to finish the loop

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

## Break loop

Get iterator to know when to finish the loop

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
