# Change
In this section we gonna learn how to change name of column, name of table and type of column and check type as well

Enjoy!

## Rename column
Rename column 'col1' to 'col22'
```sql
EXEC sp_rename
@objname = 'Catalog.Schema.Table.col1', -- use catalog, schema, table and old column name without brackets here
@newname = 'col22', -- new column name without brackets here
@objtype = 'COLUMN'
```

## Rename table
Rename table 'Table' to 'Table_New'
```sql
EXEC sp_rename 'Catalog.Schema.Table', 'Table_New' -- use catalog, schema and table name without brackets here
```

## Change type
Change type of column 'col1' from VARCHAR(255) to DATE if even one value is null function failes
```sql
ALTER TABLE
  [Table]
ADD
  [col1] DATE
```

## Check type
Check type of column 'col1' from 'Table'
```sql
SELECT 
  TYPE_NAME(system_type_id)
FROM
  sys.columns
WHERE
  name = 'col1' -- your column name without brackets here
AND
  [object_id] = OBJECT_ID(Catalog.Schema.Table') -- use catalog, schema and table name without brackets here 
```
