# Conditions
In the previous section we learned about variables and how to store different types of data from primitive int to whole rows or even tables.
In this section we gonna learn how to:
* Execute different part of code depends of variable value
* ads

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
