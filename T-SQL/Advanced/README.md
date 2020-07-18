# T-SQL
lorem ipsum
## Variables
lorem ipsum
```sql
DECLARE @v1 VARCHAR(255)
SET @v1 = 'some text'
DECLARE @v2 FLOAT(12)
SET @v2 = 5.24

PRINT 'value: ' + @v1 + CHAR(13) + CHAR(10)
PRINT 'value: ' + CAST(@v2 AS VARCHAR) + CHAR(13) + CHAR(10)
```
## If Else
lorem ipsum
```sql
IF @v1 = 'dummy' -- short, one line
  BREAK
ELSE
  BREAK
  
IF @v2 = 5.24 -- long, all lines
BEGIN
  PRINT 'yes'
END

ELSE
BEGIN
  PRINT 'no'
END
```
## Loops
lorem ipsum
```sql
DECLARE @i INT
SET @i = 1

WHILE (@i < 10)
BEGIN
  PRINT 'i: ' + CAST(@i AS VARCHAR) + CHAR(13) + CHAR(10)
  SET @i = @i + 1
END
```
## Get count to variable
lorem ipsum
```sql
DECLARE @i BIGINT
SET @i = (
  SELECT
    COUNT(*)
   FROM
    [P]
)
PRINT 'i: ' + CAST(@i AS VARCHAR) + CHAR(13) + CHAR(10)
```
## Get certain cell value to variable
lorem ipsum
```sql
DECLARE @i VARCHAR(255)
SET @i = (
  SELECT
    [Uno]
   FROM
    [P]
   ORDER BY
    (SELECT NULL)
   OFFSET 0 ROWS
    FETCH NEXT 1 ROWS ONLY
)
PRINT 'i: ' + @i + CHAR(13) + CHAR(10)
```
## Iterate through column
lorem ipsum
```sql
DECLARE @len = BIGINT
SET @len = (
  SELECT
    COUNT(*)
  FROM
    [P]
)

DECLARE @i = BIGINT
SET @i = 0

WHILE (@i < @len)
BEGIN
  DECLARE @name VARCHAR(255)
  SET @name = (
    SELECT
      [Uno]
    FROM
      [P]
    ORDER BY
      (SELECT NULL)
    OFFSET @i ROWS
      FETCH NEXT 1 ROWS ONLY
    PRINT 'value: ' + @name + CHAR(13) + CHAR(10)
    PRINT 'iteration number: ' + CAST(@i AS VARCHAR) + CHAR(13) + CHAR(10)
  )
  SET @i = @i + 1
END
```
## Get 50 % random rows
lorem ipsum
```sql
SELECT TOP 50 PERCENT
  *
FROM
  [P]
ORDER BY
  NEWID()
```
## Transfer one random row from one table to another 
lorem ipsum
```sql
WITH CTE AS (
  SELECT TOP 1
    *
  FROM
    [P]
  ORDER BY
    NEWID()
)
DELETE 
  FROM CTE
OUTPUT 
  deleted.*
INTO 
  [Q]
```
