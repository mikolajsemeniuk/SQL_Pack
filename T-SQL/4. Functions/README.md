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
