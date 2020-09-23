# Functions
We know how to store data, make conditional statement, and create loops as well.
In this section we gonna focus on most used built-in functions and their example usage for:
* REPLACE
* SPLIT
* SUBSTRING
* ISNULL

## REPLACE - simple usage
This function gonna return a replaced string
```sql
SELECT
    (
        REPLACE([col1], '.', '')
    )
FROM
    [Table]
```

## SPLIT - simple usage
This function gonna return rows splited by given value, we have to use 'value' after SELECT
```sql
SELECT 
    value
FROM 
    STRING_SPLIT('Lorem ipsum dolor', ' ')
```
## SUBSTRING - simple usage
This function gonna return rows splited by given value, we have to use 'value' after SELECT
```sql
SELECT 
    SUBSTRING([col1], 1, LEN([col1]))
FROM 
    [Table]
```
## ISNULL - simple usage
This function gonna return rows splited by given value, we have to use 'value' after SELECT
```sql
SELECT 
    ISNULL([col1], '')
FROM 
    [Table]
```
