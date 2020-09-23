# Variables

Lorem ipsum

## Declare int
Declare sample int
```sql
DECLARE @i BIGINT
SET @i = 0
PRINT 'i: ' + CAST(@i AS VARCHAR)
```

## Declare string
Declare sample string
```sql
DECLARE @n VARCHAR(255)
SET @n = 'Hi SQL'
PRINT 'i: ' + @n
```

## Get length
Declare sample int
```sql
DECLARE @len BIGINT
SET @len = (
  SELECT
    COUNT(*)
  FROM
    [Table]
)
PRINT 'len: ' + CAST(@len AS VARCHAR)
```

## Get value
Get first value from column 'col1'
```sql
DECLARE @val VARCHAR(255)
SET @val = (
  SELECT
    [col1] --Y position
  FROM
    [Table]
   ORDER BY
    (SELECT NULL)
   OFFSET 1 ROWS -- X position
    FETCH NEXT 1 ROWS ONLY -- Range of rows
)
PRINT 'val: ' + @val
```

## Get row
Get whole first row from table
```sql
DECLARE @row VARCHAR(MAX)
SELECT 
    @row = @row + [col1] + ',' + [col2] + ',' + [col3] -- Remember to use CAST(col3 AS VARCHAR) or CAST(ISNULL(col3, 0) AS VARCHAR) 
FROM
    [Table]
ORDER BY
    (SELECT NULL)
OFFSET 1 ROWS
    FETCH NEXT 1 ROWS ONLY
PRINT 'row: ' + @row
```

## Get column
Get all values from column 'col1' from table
```sql
DECLARE @col VARCHAR(MAX)
SELECT 
    @col = COALESCE(@col + ',', '') + CONVERT(VARCHAR(255), [col1])
FROM
    [Table]
ORDER BY
    (SELECT NULL)
OFFSET @i ROWS
    FETCH NEXT 1 ROWS ONLY
PRINT 'col: ' + @col
```
