# T-SQL
lorem ipsum
## Add empty column
```sql
ALTER TABLE
  [P]
ADD
  [Cinco] VARCHAR(255)
```
## Add column with values
lorem ipsum
```sql
ALTER TABLE
  [P]
ADD
  [Cinco] VARCHAR(255)
DEFAULT
  'def'
WITH VALUES
```
## Change column data
```sql
UPDATE
  [P]
SET
  [Uno] = 'changed'
```
## Conditional changed column data
```sql
UPDATE
  [P]
SET
  [Uno] = 
    CASE WHEN [Dos] IS NULL THEN
      [Tres]
    ELSE
      [Dos]
    END
```
## Transfer data from one column to another (the same table)
lorem ipsum
```sql
UPDATE 
  [P]
SET
  [Uno] = [Dos]
```
## Transfer data from one column to another (the diffrent tables)
lorem ipsum
```sql
UPDATE 
  [P]
SET
  [Uno] = (
    SELECT
      [Uno]
    FROM
      [Q]
  )
```
## Transfer data from one column to another (left outer join)
lorem ipsum
```sql
UPDATE 
  P
SET
  P.[Uno] = Q.[Uno],
  P.[Dos] = P.[Dos]
FROM
  [Table A] P
LEFT OUTER JOIN
  [Table B] Q
ON
  P.[Tres] = Q.[Tres]
```
## Removed duplicates
```sql
WITH CTE AS (
  SELECT
    [Uno],
    [Dos],
    [Tres],
    [Cuatro]
    ROW_NUMBER() OVER (
      PARTITION BY
        [Uno],
        [Dos]
      ORDER BY
        [Uno],
        [Dos]
    ) row_num
  FROM
    [P]
)

DELETE FROM CTE
WHERE row_num > 1
```
## Rename column
```sql
  EXEC sp_rename
  @objname = 'P.Uno'
  @newname = 'newName'
  @objtype = 'COLUMN'
```
