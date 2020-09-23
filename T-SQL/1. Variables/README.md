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
Declare sample int
```sql
DECLARE @n VARCHAR(255)
SET @n = 'Hi SQL'
PRINT 'i: ' + @n
```

## Catch lenght of table to variable
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

## Catch certain value from table to variable
Declare sample int
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
