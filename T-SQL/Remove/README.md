# T-SQL
Remove table and rows
## Remove whole table
```sql
DROP TABLE IF EXISTS [P]
```
## Remove certain row
lorem ipsum
```sql
ALTER TABLE 
  [P]
DROP COLUMN IF EXISTS
  [Uno]
GO
```
## Remove and transfer whole table into existing table
lorem ipsum
```sql
DELETE FROM
  [P]
OUTPUT
  deleted.*
INTO
  [Q]
```
## Remove and transfer certain rows into existing table
lorem ipsum
```sql
WITH CTE AS (
  SELECT
    [Uno], [Dos]
  FROM
    [P]
)
DELETE CTE
OUTPUT deleted.*
INTO [Q]
```
