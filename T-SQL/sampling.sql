-- =====================================
--
--  Sample Size
-- -------------------------------------
--
--  Catch to variables of Sample size colum
--  from config table
--
-- =====================================
DECLARE @sample_size FLOAT(12)
SET @sample_size = (
    SELECT
        [Sample size]
    FROM
        [Config]
    ORDER BY 
        (SELECT NULL)
    OFFSET 0 ROWS
        FETCH NEXT 1 ROWS ONLY
)

-- =====================================
--
--  Buckets
-- -------------------------------------
--
--  Catch to variables of bucket colum
--  from config table
--
-- =====================================
DECLARE @bucket1 FLOAT(12)
DECLARE @bucket2 FLOAT(12)
DECLARE @bucket3 FLOAT(12)
SET @bucket1 = (
    SELECT 
        [Bucket]
    FROM
        [Config]
    ORDER BY
        (SELECT NULL)
    OFFSET 0 ROWS
        FETCH NEXT 1 ROWS ONLY
)
SET @bucket2 = (
    SELECT 
        [Bucket]
    FROM
        [Config]
    ORDER BY
        (SELECT NULL)
    OFFSET 1 ROWS
        FETCH NEXT 1 ROWS ONLY
)
SET @bucket3 = (
    SELECT 
        [Bucket]
    FROM
        [Config]
    ORDER BY
        (SELECT NULL)
    OFFSET 2 ROWS
        FETCH NEXT 1 ROWS ONLY
)

-- =====================================
--
--  Non-PO
-- -------------------------------------
--
--  Catch to variables of Non-PO colum
--  from config table
--
-- =====================================
DECLARE @Non_PO1 FLOAT(12)
DECLARE @Non_PO2 FLOAT(12)
DECLARE @Non_PO3 FLOAT(12)
SET @Non_PO1 = (
    SELECT 
        [Percent Non-PO]
    FROM
        [Config]
    ORDER BY
        (SELECT NULL)
    OFFSET 0 ROWS
        FETCH NEXT 1 ROWS ONLY
)
SET @Non_PO2 = (
    SELECT 
        [Percent Non-PO]
    FROM
        [Config]
    ORDER BY
        (SELECT NULL)
    OFFSET 1 ROWS
        FETCH NEXT 1 ROWS ONLY
)
SET @Non_PO3 = (
    SELECT 
        [Percent Non-PO]
    FROM
        [Config]
    ORDER BY
        (SELECT NULL)
    OFFSET 2 ROWS
        FETCH NEXT 1 ROWS ONLY
)

-- =====================================
--
--  PO
-- -------------------------------------
--
--  Catch to variables of PO colum
--  from config table
--
-- =====================================
DECLARE @PO1 FLOAT(12)
DECLARE @PO2 FLOAT(12)
DECLARE @PO3 FLOAT(12)
SET @PO1 = (
    SELECT 
        [Percent PO]
    FROM
        [Config]
    ORDER BY
        (SELECT NULL)
    OFFSET 0 ROWS
        FETCH NEXT 1 ROWS ONLY
)
SET @PO2 = (
    SELECT 
        [Percent PO]
    FROM
        [Config]
    ORDER BY
        (SELECT NULL)
    OFFSET 1 ROWS
        FETCH NEXT 1 ROWS ONLY
)
SET @PO3 = (
    SELECT 
        [Percent PO]
    FROM
        [Config]
    ORDER BY
        (SELECT NULL)
    OFFSET 2 ROWS
        FETCH NEXT 1 ROWS ONLY
)

-- SAVE TO DELETE ABOVE - ONLY FOR DEV
PRINT '' + CHAR(13) + CHAR(10)
PRINT 'sample size: ' + CAST(@sample_size as VARCHAR) + CHAR(13) + CHAR(10)

PRINT 'bucket1: ' + CAST(@bucket1 as VARCHAR)
PRINT 'bucket2: ' + CAST(@bucket2 as VARCHAR)
PRINT 'bucket3: ' + CAST(@bucket3 as VARCHAR) + CHAR(13) + CHAR(10)

PRINT 'Non_PO1: ' + CAST(@Non_PO1 as VARCHAR)
PRINT 'Non_PO2: ' + CAST(@Non_PO2 as VARCHAR)
PRINT 'Non_PO3: ' + CAST(@Non_PO3 as VARCHAR) + CHAR(13) + CHAR(10)

PRINT 'PO1: ' + CAST(@PO1 as VARCHAR)
PRINT 'PO2: ' + CAST(@PO2 as VARCHAR)
PRINT 'PO3: ' + CAST(@PO3 as VARCHAR) + CHAR(13) + CHAR(10)
-- SAVE TO DELETE ABOVE - ONLY FOR DEV

-- SAVE TO DELETE BELOW - ONLY FOR DEV
DECLARE @nr INT
SET @nr = 1
-- SAVE TO DELETE ABOVE - ONLY FOR DEV

-- =====================================
--
--  First loop
-- -------------------------------------
--
--  Declare and initialize our proccess
--  to get all of processes and make
--  groups with them
--
-- =====================================
DECLARE @len_process INT
SET @len_process = (
    SELECT
        COUNT(DISTINCT [Sub-process])
    FROM
        [PTP_SAP_EXTRACT]
)
DECLARE @i INT
SET @i = 0

WHILE (@i < @len_process)
BEGIN
    DECLARE @process VARCHAR(255)
    SET @process = (
        SELECT 
            DISTINCT [Sub-process]
        FROM
            [PTP_SAP_EXTRACT]
        ORDER BY 
            [Sub-process] DESC
        OFFSET @i ROWS
            FETCH NEXT 1 ROWS ONLY
    )
    
    -- =====================================
    --
    --  Second loop
    -- -------------------------------------
    --
    --  Declare and initialize our company
    --  code to get all of company codes
    --  and make groups with them
    --
    -- =====================================
    DECLARE @len_cocd INT
    SET @len_cocd = (
        SELECT
            COUNT(DISTINCT [Company Code])
        FROM
            [PTP_SAP_EXTRACT]
    )
    DECLARE @j INT
    SET @j = 0

    WHILE(@j < @len_cocd)
    BEGIN
        DECLARE @co_cd VARCHAR(255)
        SET @co_cd = (
            SELECT
                DISTINCT [Company Code]
            FROM
               [PTP_SAP_EXTRACT]
            ORDER BY
                [Company Code] DESC
            OFFSET @j ROWS
                FETCH NEXT 1 ROWS ONLY
        )

        -- =====================================
        --
        --  Third loop
        -- -------------------------------------
        --
        --  Declare and initialize our scope
        --  to get all of scopes and
        --  make groups with them
        --
        -- =====================================
        DECLARE @len_scope INT
        SET @len_scope = (
            SELECT
                COUNT(DISTINCT [Scope])
            FROM
                [PTP_SAP_EXTRACT]
        )
        DECLARE @n INT
        SET @n = 0

        WHILE(@n < @len_scope)
        BEGIN
            DECLARE @scope VARCHAR(255)
            SET @scope = (
                SELECT
                    DISTINCT [Scope]
                FROM
                    [PTP_SAP_EXTRACT]
                ORDER BY
                    [Scope]
                OFFSET @n ROWS
                    FETCH NEXT 1 ROWS ONLY
            )

            -- SAVE TO DELETE BELOW - ONLY FOR DEV
            PRINT 'group nr: ' + CAST(@nr AS VARCHAR)
            PRINT 'process: ' + @process + ', scope: ' + @scope + ', cocd: ' + @co_cd
            PRINT '' + CHAR(13) + CHAR(10)
            SET @nr = @nr + 1
            -- SAVE TO DELETE ABOVE - ONLY FOR DEV

            -- ==============================
            --
            --  Length of Sub-group
            -- ------------------------------
            --
            --  Take amount of certain
            --  group to get the proper
            --  procent based on config
            --  to calculate the threshold
            --
            -- ==============================
            DECLARE @amount_of_group BIGINT
            SET @amount_of_group = (
                SELECT
                    COUNT(*)
                FROM
                    [PTP_SAP_EXTRACT]
                WHERE
                    [Company Code] = @co_cd -- '1100'
                AND
                    [Sub-process] = @process -- 'PO'
                AND
                    [Scope] = @scope -- 'India'
            )

            -- ==============================
            --
            --  Treshold to meet
            -- ------------------------------
            --
            --  Our threshold to meet to
            --  exit for loop and break
            --  sampling for certain group
            --  ceiled to always get equal
            --  or greater than our certain
            --  procent of group
            --
            -- ==============================
            DECLARE @threshold BIGINT
            SET @threshold = CEILING(@amount_of_group * @sample_size / 100)

            -- ==============================
            --
            --  Current samples
            -- ------------------------------
            --
            --  Variable to hold number
            --  of already added samples
            --  when @current_samples ==
            --  @threshold then we go out
            --  of certain group which we
            --  already 
            --
            -- ==============================
            DECLARE @current_samples BIGINT
            SET @current_samples = 0

            -- ==============================
            --
            --  Placeholders for PO and Non-PO
            -- ------------------------------
            --
            --  These custom variables
            --  catch PO or Non-PO values
            --  depends on what group
            --  we've already got to avoid
            --  duplicate unnecesarry code
            --
            -- ==============================
            DECLARE @custom1 FLOAT(12) -- First bucket
            DECLARE @custom2 FLOAT(12) -- Second bucket
            DECLARE @custom3 FLOAT(12) -- Third bucket

            IF @process = 'PO'
            BEGIN
                SET @custom1 = @PO1 -- 70
                SET @custom2 = @PO2 -- 10
                SET @custom3 = @PO3 -- 5
            END

            ELSE -- Non-PO
            BEGIN
                SET @custom1 = @Non_PO1 -- 100
                SET @custom2 = @Non_PO2 -- 10
                SET @custom3 = @Non_PO3 -- 5
            END

            -- SAVE TO DELETE BELOW - ONLY FOR DEV
            PRINT 'amount: ' + CAST(@amount_of_group AS VARCHAR)
            PRINT 'one: ' + CAST(@custom1 AS VARCHAR)
            PRINT 'two: ' + CAST(@custom2 AS VARCHAR)
            PRINT 'three: ' + CAST(@custom3 AS VARCHAR)
            -- SAVE TO DELETE ABOVE - ONLY FOR DEV

            -- ==============================
            --
            --  Length of first bucket
            -- ------------------------------
            --
            --  Get the procent length of
            --  the first bucket > 250000 $
            --
            -- ==============================
            DECLARE @amount_of_first_subgroup BIGINT
            SET @amount_of_first_subgroup = (
                SELECT 
                    COUNT(*)
                FROM
                    (
                        SELECT TOP (CAST(@custom1 AS INT)) PERCENT
                            *
                        FROM
                            [PTP_SAP_EXTRACT]
                    ) T1
                WHERE
                    [Company Code] = @co_cd
                AND
                    [Sub-process] = @process
                AND
                    [Scope] = @scope
                AND
                    [Amount in USD] > @bucket1       
            )

            -- SAVE TO DELETE BELOW - ONLY FOR DEV
            PRINT '70% amount of first PO group: ' + CAST(@amount_of_first_subgroup AS VARCHAR);
            -- SAVE TO DELETE ABOVE - ONLY FOR DEV

            WITH CTE1 AS (
                SELECT TOP (CAST(@custom1 AS INT)) PERCENT
                    *
                FROM 
                    [PTP_SAP_EXTRACT]
                WHERE
                    [Company Code] = @co_cd
                AND
                    [Sub-process] = @process
                AND
                    [Scope] = @scope
                AND
                    [Amount in USD] > @bucket1
                ORDER BY
                    NEWID()
            )
            DELETE FROM CTE1 
            OUTPUT deleted.*
            INTO [Samples]

            -- ==============================
            --
            --  Increase current samples
            -- ------------------------------
            --
            --  Add certain procent of group
            --  from current bucket to samples
            --  to @current_samples to know when
            --  we have to go out of the loop
            --
            -- ==============================
            SET @current_samples = @current_samples + @amount_of_first_subgroup

            -- ==============================
            --
            --  Check threshold
            -- ------------------------------
            --
            --  Check if the condition was
            --  met if yes exit the loop
            --  and go to the next group
            --  if not go the next bucket
            --  group to get more samples
            --
            -- ==============================
            IF @current_samples >= @threshold
            BEGIN

                -- SAVE TO DELETE BELOW - ONLY FOR DEV
                PRINT 'First sub-group met condition exit the loop'
                -- SAVE TO DELETE ABOVE - ONLY FOR DEV

                BREAK
            END

            ELSE
            BEGIN

                -- SAVE TO DELETE BELOW - ONLY FOR DEV
                PRINT 'Go to the next bucket from first sub-group'
                -- SAVE TO DELETE ABOVE - ONLY FOR DEV

                -- ==============================
                --
                --  Length of second bucket
                -- ------------------------------
                --
                --  Get the length of second
                --  bucket < 250000 $ and
                --  bucket > 50000 $
                --
                -- ==============================
                DECLARE @amount_of_second_subgroup BIGINT
                SET @amount_of_second_subgroup = (
                    SELECT 
                        COUNT(*)
                    FROM
                        (
                            SELECT TOP (CAST(@custom2 AS INT)) PERCENT
                                *
                            FROM
                                [PTP_SAP_EXTRACT]
                        ) T2
                    WHERE
                        [Company Code] = @co_cd
                    AND
                        [Sub-process] = @process
                    AND
                        [Scope] = @scope
                    AND
                        [Amount in USD] < @bucket1
                    AND
                        [Amount in USD] > @bucket2       
                )

                -- SAVE TO DELETE BELOW - ONLY FOR DEV
                PRINT '10% amount of second PO group: ' + CAST(@amount_of_second_subgroup AS VARCHAR);
                -- SAVE TO DELETE ABOVE - ONLY FOR DEV

                WITH CTE2 AS (
                    SELECT TOP (CAST(@custom2 AS INT)) PERCENT
                        *
                    FROM 
                        [PTP_SAP_EXTRACT]
                    WHERE
                        [Company Code] = @co_cd
                    AND
                        [Sub-process] = @process
                    AND
                        [Scope] = @scope
                    AND
                        [Amount in USD] < @bucket1
                    AND
                        [Amount in USD] > @bucket2
                    ORDER BY
                        NEWID()
                )
                DELETE FROM CTE2 
                OUTPUT deleted.*
                INTO [Samples]

                -- ==============================
                --
                --  Increase current samples
                -- ------------------------------
                --
                --  Add certain procent of group
                --  from current bucket to samples
                --  to @current_samples to know when
                --  we have to go out of the loop
                --
                -- ==============================
                SET @current_samples = @current_samples + @amount_of_second_subgroup

                -- ==============================
                --
                --  Check threshold
                -- ------------------------------
                --
                --  Check if the condition was
                --  met if yes exit the loop
                --  and go to the next group
                --  if not go the next bucket
                --  group to get more samples
                --
                -- ==============================
                IF @current_samples >= @threshold
                BEGIN

                    -- SAVE TO DELETE BELOW - ONLY FOR DEV
                    PRINT 'Second sub-group met condition exit the loop'
                    -- SAVE TO DELETE ABOVE - ONLY FOR DEV

                    BREAK
                END

                ELSE
                BEGIN

                    -- SAVE TO DELETE BELOW - ONLY FOR DEV
                    PRINT 'Go to the next bucket from second sub-group'
                    -- SAVE TO DELETE ABOVE - ONLY FOR DEV

                    -- ==============================
                    --
                    --  Length of second bucket
                    -- ------------------------------
                    --
                    --  Get the length of second
                    --  bucket < 250000 $ and
                    --  bucket > 50000 $
                    --
                    -- ==============================
                    DECLARE @amount_of_third_subgroup BIGINT
                    SET @amount_of_third_subgroup = (
                        SELECT 
                            COUNT(*)
                        FROM
                            (
                                SELECT TOP (CAST(@custom3 AS INT)) PERCENT
                                    *
                                FROM
                                    [PTP_SAP_EXTRACT]
                            ) T3
                        WHERE
                            [Company Code] = @co_cd
                        AND
                            [Sub-process] = @process
                        AND
                            [Scope] = @scope
                        AND
                            [Amount in USD] < @bucket2
                        AND
                            [Amount in USD] > @bucket3       
                    )

                    -- SAVE TO DELETE BELOW - ONLY FOR DEV
                    PRINT '10% amount of second PO group: ' + CAST(@amount_of_third_subgroup AS VARCHAR);
                    -- SAVE TO DELETE ABOVE - ONLY FOR DEV

                    WITH CTE3 AS (
                        SELECT TOP (CAST(@custom3 AS INT)) PERCENT
                            *
                        FROM 
                            [PTP_SAP_EXTRACT]
                        WHERE
                            [Company Code] = @co_cd
                        AND
                            [Sub-process] = @process
                        AND
                            [Scope] = @scope
                        AND
                            [Amount in USD] < @bucket2
                        AND
                            [Amount in USD] > @bucket3
                        ORDER BY
                            NEWID()
                    )
                    DELETE FROM CTE3 
                    OUTPUT deleted.*
                    INTO [Samples]

                    -- ==============================
                    --
                    --  Increase current samples
                    -- ------------------------------
                    --
                    --  Add certain procent of group
                    --  from current bucket to samples
                    --  to @current_samples to know when
                    --  we have to go out of the loop
                    --
                    -- ==============================
                    SET @current_samples = @current_samples + @amount_of_third_subgroup

                    -- ==============================
                    --
                    --  Check threshold
                    -- ------------------------------
                    --
                    --  Check if the condition was
                    --  met if yes exit the loop
                    --  and go to the next group
                    --  if not go the next bucket
                    --  group to get more samples
                    --
                    -- ==============================
                    IF @current_samples >= @threshold
                    BEGIN

                        -- SAVE TO DELETE BELOW - ONLY FOR DEV
                        PRINT 'Third sub-group met condition exit the loop'
                        -- SAVE TO DELETE ABOVE - ONLY FOR DEV

                        BREAK
                    END

                    ELSE
                    BEGIN

                        -- SAVE TO DELETE BELOW
                        PRINT 'Go to the draw invoices from third sub-group'
                        -- SAVE TO DELETE ABOVE

                        -- ==============================
                        --
                        --  Draw invoices
                        -- ------------------------------
                        --
                        --  From this stage we gonna
                        --  draw random invoices until
                        --  we reach @threshold to fulfil
                        --  condition of @sample_size
                        --  so to do this we gonna take only
                        --  one random invocie from
                        --  all groups which are left
                        --  until @current_samples >=
                        --  @threshold
                        --
                        -- ==============================
                        WHILE(@current_samples < @threshold)
                        BEGIN
                            -- ==============================
                            --
                            --  Get one random
                            -- ------------------------------
                            --
                            --  Get one random record 
                            --  which belongs to current group
                            --  and could be from any bucket
                            --
                            -- ==============================
                            WITH CTE4 AS (
                                SELECT TOP 1
                                    *
                                FROM 
                                    [PTP_SAP_EXTRACT]
                                WHERE
                                    [Company Code] = @co_cd
                                AND
                                    [Sub-process] = @process
                                AND
                                    [Scope] = @scope
                                ORDER BY
                                    NEWID()
                            )
                            DELETE FROM CTE4
                            OUTPUT deleted.*
                            INTO [Samples]
                            -- ==============================
                            --
                            -- Increase iterator
                            -- ------------------------------
                            --
                            --  Increasing iterator to avoid
                            --  infinitive loop
                            --
                            -- ==============================
                            SET @current_samples = @current_samples + 1

                        END

                        -- SAVE TO DELETE BELOW - ONLY FOR DEV
                        PRINT 'Drawing samples completed, breaking the loop'
                        PRINT '@current_samples: ' + CAST(@current_samples AS VARCHAR)
                        PRINT '@threshold: ' + CAST(@threshold AS VARCHAR)
                        -- SAVE TO DELETE ABOVE - ONLY FOR DEV

                    END
                
                END

            END

            -- =====================================
            --
            --  Increasing third loop
            -- -------------------------------------
            --
            --  Increasing third loop to avoid
            --  infinitive loop
            --
            -- =====================================
            SET @n = @n + 1
        END

      
        -- =====================================
        --
        --  Increasing second loop
        -- -------------------------------------
        --
        --  Increasing second loop to avoid
        --  infinitive loop
        --
        -- =====================================
        SET @j = @j + 1
    END
    
    -- =====================================
    --
    --  Increasing first loop
    -- -------------------------------------
    --
    --  Increasing first loop to avoid
    --  infinitive loop
    --
    -- =====================================
    SET @i = @i + 1
END

-- SAVE TO DELETE BELOW - ONLY FOR DEV
SELECT 
    COUNT(*), [Company Code], [Scope], [Sub-process]
FROM
    [PTP_SAP_EXTRACT]
GROUP BY
    [Company Code], [Scope], [Sub-process]
-- SAVE TO DELETE ABOVE - ONLY FOR DEV