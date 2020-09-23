# Conditions
In the previous section we learned about variables and how to store different types of data from primitive int to whole rows or even tables.
In this section we gonna learn how to:
* Execute different part of code depends of variable value
* Make conditional SELECT 
* Make conditional UPDATE

## Simple If/Else
Let's execute simple part of code depedens of our variable @custom of type int
```sql
IF @custom = 0 THEN
  PRINT 'custom is 0'
ELSE
  PRINT 'custom is not 0'
```

## Complex If/Else
Let's execute more than one line of code depedens of our variable @custom of type int
```sql
IF @custom = 0 THEN
BEGIN
  PRINT 'custom is 0'
  PRINT 'second line of code goes here...'
END
ELSE
BEGIN
  PRINT 'custom is not 0'
  PRINT 'second line of code goes here...'
END
```

## Conditional SELECT
Let's make conditional select and concatenate string to result
```sql
SELECT
    [col1],
    [col2],
    (
      CASE
          WHEN [col1] IS NOT NULL THEN
              'not null, ' + [col1]
          WHEN [col2] IS NOT NULL THEN
              'not null, ' + [col2]
          ELSE
              'null, ' + [col3] 
      END
    ),
    [col3]
FROM
    [Table]
```

## Conditional UPDATE
Let's make conditional select and concatenate string to result
```sql
UPDATE
    [Table]
SET
    [col1] = (
      CASE
          WHEN [col2] IS NOT NULL THEN
              '1'
          ELSE
              '0'
      END
    ),
    [col2] = (
      CASE
          WHEN [col3] IS NOT NULL THEN
              '1'
          ELSE
              '0'
      END
    )
```
