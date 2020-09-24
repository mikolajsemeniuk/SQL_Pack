# CTE
In this section we gonna focus on CTE which comes with such great functionalities like edit, remove or even transfer specific rows.

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

## Update 50 percent random rows
Update specific rows rows, columns and range of rows
```sql
; -- remeber to end the previous line before using CTE
WITH CTE AS (
  SELECT TOP 50 PERCENT
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
UPDATE
  CTE
SET
  [col1] = 'your value You wish to update'
```

## Remove 50 percent random rows
Update specific rows rows, columns and range of rows
```sql
; -- remeber to end the previous line before using CTE
WITH CTE AS (
  SELECT TOP 50 PERCENT
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
UPDATE
  CTE
SET
  [col1] = 'your value You wish to update'
```

## Transfer 50 percent random rows
Update specific rows rows, columns and range of rows
```sql
; -- remeber to end the previous line before using CTE
WITH CTE AS (
  SELECT TOP 50 PERCENT
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
