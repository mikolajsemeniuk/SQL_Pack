# T-SQL
Lorem ipsum dolor sit amet.
## Creating Table
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
```sql
DROP TABLE IF EXISTS [Test]

CREATE TABLE [Test] (
  [Uno] VARCHAR(255),
  [Dos] DATE,
  [Tres] FLOAT(12),
  [Cuatro] BIGINT
)

SELECT * FROM [Test]
```
## Insert values
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
```sql
INSERT INTO
  [Test]
VALUES
  ('lorem', '2020-05-14', 1.57, 753),
  ('ipsum', CURRENT_TIMESTAMP, 1.82694321, 1.942)
  ('dolor', '2020-01-01', 4.29, 951)
 
SELECT * FROM [Test]
```
