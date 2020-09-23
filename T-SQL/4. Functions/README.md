# Functions
We know how to store data, make conditional statement, and create loops as well.
In this section we gonna focus on most used built-in functions and their example usage for:
* REPLACE
* SPLIT
* SUBSTRING
* ISNULL
* TRY_CONVERT

## REPLACE - simple usage
This function gonna return a replaced string
```sql
SELECT
    (
        REPLACE([col1], '.', '')
    )
FROM
    [Table]
```

## REPLACE - advanced usage
Let's use this function replace amount like 10.213,57 to value ready to change type of column to FLOAT(12)
```sql
UPDATE
    [Table]
SET 
    [col1] = REPLACE(REPLACE([col1], '.', ''), ',', '.')
```

## SPLIT - simple usage
This function gonna return rows splited by given value, we have to use 'value' after SELECT
```sql
SELECT 
    value
FROM 
    STRING_SPLIT('Lorem ipsum dolor', ' ')
```

## SPLIT - advanced usage
Let's use this function to change date in string to ready to convert to type DATE
```sql
DECLARE @day VARCHAR(255)
SET @day = (
    SELECT 
        value
    FROM 
        STRING_SPLIT([col2], '.')
    ORDER BY
        (SELECT NULL)
    OFFSET 0 ROWS
        FETCH NEXT 1 ROWS ONLY
)
DECLARE @month VARCHAR(255)
SET @month = (
    SELECT 
        value
    FROM 
        STRING_SPLIT([col2], '.')
    ORDER BY
        (SELECT NULL)
    OFFSET 1 ROWS
        FETCH NEXT 1 ROWS ONLY
)
DECLARE @year VARCHAR(255)
SET @year = (
    SELECT 
        value
    FROM 
        STRING_SPLIT([col2], '.')
    ORDER BY
        (SELECT NULL)
    OFFSET 2 ROWS
        FETCH NEXT 1 ROWS ONLY
)
PRINT 'date: ' + @year + '-' + @month + '-' + @day
```

## SUBSTRING - simple usage
This function gonna return substring of given string, we could use len to get LEN function to get length of string
```sql
SELECT 
    SUBSTRING([col1], 1, LEN([col1]))
FROM 
    [Table]
```

## SUBSTRING - advanced usage
Let's use this function to remove trailing zeros
```sql
UPDATE
    [Table]
SET
    [col3] = SUBSTRING([col3], PATINDEX('%[^0]%', [col3] + '.'), LEN([col3]))
```

## ISNULL - simple usage
This function gonna return given value if value if null in this case it would be empty string
```sql
SELECT 
    ISNULL([col1], '')
FROM 
    [Table]
```

## ISNULL - advanced usage
Let's use this ISNULL to prevent failed concatenating the string when 'col1' is null
```sql
SELECT 
    CAST(ISNULL([col1], 0) AS VARCHAR) + ISNULL([col2], '')
FROM 
    [Table]
```

## TRY_CONVERT
If the function could change value to certain type the value would change otherwise value is null 
```sql
SELECT 
    TRY_CONVERT(float, [col3])
FROM 
    [Table]
```
