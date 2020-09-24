# CTE
In this section we gonna focus on CTE which comes with such great functionalities like edit, remove or even transfer specific rows without id column or using 'WHERE' clause.
Moreover when we remove, edit or transfer from CTE we manipulate our original Table we wish to change.

## Update specific rows
Update specific rows rows, columns and range of rows
```sql
; -- remeber to end the previous line before using CTE
WITH CTE AS (
  SELECT
    *
  FROM
    [Table]
  ORDER BY
    (SELECT NULL)
  OFFSET 1 ROWS
    FETCH NEXT 1 ROWS ONLY
)
UPDATE
  CTE
SET
  [col1] = 'your value You wish to update'
```

## Update 33 percent random rows
Update specific rows rows, columns and range of rows
```sql
; -- remeber to end the previous line before using CTE
WITH CTE AS (
  SELECT TOP 33 PERCENT
    *
  FROM
    [Table]
  ORDER BY
    NEWID()
)
UPDATE
  CTE
SET
  [col1] = 'your value You wish to update'
```

## Remove specific rows
Update specific rows rows, columns and range of rows
```sql
; -- remeber to end the previous line before using CTE
WITH CTE AS (
  SELECT
    *
  FROM
    [Table]
  ORDER BY
    (SELECT NULL)
  OFFSET 1 ROWS
    FETCH NEXT 1 ROWS ONLY
)
DELETE FROM
  CTE
```

## Remove 33 percent random rows
Update specific rows rows, columns and range of rows
```sql
; -- remeber to end the previous line before using CTE
WITH CTE AS (
  SELECT TOP 33 PERCENT
    *
  FROM
    [Table]
  ORDER BY
    NEWID()
)
DELETE FROM
  CTE
```

## Transfer specific rows
Update specific rows rows, columns and range of rows
```sql
; -- remeber to end the previous line before using CTE
WITH CTE AS (
  SELECT
    *
  FROM
    [Table]
  ORDER BY
    (SELECT NULL)
  OFFSET 1 ROWS
    FETCH NEXT 1 ROWS ONLY
)
DELETE FROM 
  CTE 
OUTPUT
  deleted.*
INTO
  [Table2]
```

## Transfer 33 percent random rows
Update specific rows rows, columns and range of rows
```sql
; -- remeber to end the previous line before using CTE
WITH CTE AS (
  SELECT TOP 33 PERCENT
    *
  FROM
    [Table]
  ORDER BY
    NEWID()
)
DELETE FROM 
  CTE 
OUTPUT
  deleted.*
INTO
  [Table2]
```

## Remove duplicates (keeping original)
Update specific rows rows, columns and range of rows
```sql
; -- remeber to end the previous line before using CTE
WITH CTE AS
(
    SELECT 
        *, ROW_NUMBER() OVER 
        (
            PARTITION BY
                [col1] -- column You wish to remove duplicates
            ORDER BY
                [col1] -- column You wish to remove duplicates
        ) AS RN
FROM
    [Table]
)
DELETE FROM 
  CTE
WHERE
  RN <> 1
```

## Remove duplicates (without keeping original)
Update specific rows rows, columns and range of rows
```sql
; -- remeber to end the previous line before using CTE
WITH CTE AS
(
    SELECT
        *,
        R = RANK() OVER 
        (
            ORDER BY
                [col1] -- column You wish to remove duplicates
        )
    FROM 
        [Table]
) 
DELETE 
  CTE
WHERE 
  R 
IN
  (SELECT R FROM CTE GROUP BY R HAVING COUNT(*) > 1)
```
