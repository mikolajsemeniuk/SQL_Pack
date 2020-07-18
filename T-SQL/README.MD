# T-SQL
Lorem ipsum dolor sit amet.
## Creating Table
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
```sql
DROP TABLE IF EXISTS [P]

CREATE TABLE [P] (
  [Uno] VARCHAR(255),
  [Dos] DATE,
  [Tres] FLOAT(12),
  [Cuatro] BIGINT
)

SELECT * FROM [P]
```
## Insert values
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
```sql
INSERT INTO
  [P]
VALUES
  ('lorem', '2020-05-14', 1.57, 753),
  ('ipsum', CURRENT_TIMESTAMP, 1.82694321, 1.942)
  ('dolor', '2020-01-01', 4.29, 951)
 
SELECT * FROM [P]
```
## Insert from existing table
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
```sql
INSERT INTO
  [P] ([Uno], [Dos], [Tres], [Cuatro])
SELECT 
  [Tres], [Cuatro], [Dos] -- [Cuatro] will be a null 
FROM
  [Q]
 
SELECT * FROM [Test]
```
## Insert whole table into another table
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
```sql

INSERT INTO [P] SELECT * FROM [Q]

SELECT * FROM [P]
```
## Insert values from existing table into new table
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
```sql
DROP TABLE IF EXISTS [Q]

SELECT * INTO [P] FROM [Q]

SELECT * FROM [P]
```
