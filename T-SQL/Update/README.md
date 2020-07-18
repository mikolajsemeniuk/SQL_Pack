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
