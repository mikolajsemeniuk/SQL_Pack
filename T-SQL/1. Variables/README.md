# Variables

In this section You would know how to: 
* Create and assign custom values to variables in T-SQL.
* How to get number of all rows from tables if you need to iterate through whole table.
* Save value from certain column and certain row even if You don't have 'ID' column to string variable.
* Save whole certain row if You don't have 'ID' column to string variable.
* Save whole column row to string variable.
* Declare and temporary table for store certain rows.

**Enjoy !** :wink:

[Go back](https://github.com/mikolajs123/SQL_Pack/tree/master)

## Declare int
Declare and assign sample int
```sql
DECLARE @i BIGINT
SET @i = 0
PRINT 'i: ' + CAST(@i AS VARCHAR)
```

## Declare string
Declare and assign sample string
```sql
DECLARE @n VARCHAR(255)
SET @n = 'Hi SQL'
PRINT 'i: ' + @n
```

## Get length
Get number of all rows from table to variable
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
Get first value from column 'col1' to variable even if You don't have 'ID' column
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
Get whole first row from table to variable even if You don't have 'ID' column
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
Get all values from column 'col1' from table to variable
```sql
DECLARE @col VARCHAR(MAX)
SELECT 
    @col = COALESCE(@col + ',', '') + CONVERT(VARCHAR(255), [col1])
FROM
    [Table]
PRINT 'col: ' + @col
```

## Declare table
Declare temporary table to store certain rows as a temporary data
```sql
DECLARE @temp table (col1 BIGINT, col2 VARCHAR(MAX))
INSERT INTO @temp VALUES (1, 'Hi')
SELECT * FROM @temp
```

[Go back](https://github.com/mikolajs123/SQL_Pack/tree/master/T-SQL)
