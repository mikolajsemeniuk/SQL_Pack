-- Declare row outside the loop because sometime value is not overwrite in loop scope and we have to clean it manually
DECLARE @col VARCHAR(255)

-- Declare loop
WHILE(@i < @len)
BEGIN
    -- Break the current loop when i = 5
    IF @i = 5
        BREAK 
    
    -- Get all values from col1 where col2 is not null
    SELECT 
        @col = COALESCE(@col + ',', '') + CONVERT(VARCHAR(255), [col1])
    FROM
        [Table]
    WHERE
        [col2] IS NOT NULL
    ORDER BY
        (SELECT NULL)
    OFFSET @i ROWS
        FETCH NEXT 1 ROWS ONLY
    
    -- Print number of iterations
    PRINT 'i: ' + CAST(@i AS VARCHAR) 
    
    -- Print catched value
    PRINT 'col: ' + @col -- no need to cast value becuase @val is type of VARCHAR(255) so there is no problem with concatenate 
 
    -- clear values just to make sure because sometimes Declaring in loop scope doesn't overwrite @val value 
    SET @col = NULL
 
    -- Increase iterator to avoid infinitive loop
    SET @i = @i + 1
END
