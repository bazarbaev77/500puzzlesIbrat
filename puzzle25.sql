CREATE TABLE YourTable (
    A INT,
    B INT,
    C INT,
    CompanyCode VARCHAR(10),
    GL INT
);
INSERT INTO YourTable (A, B, C, CompanyCode, GL) VALUES
(1, 1, 1, 'AA', 1),
(1, 1, 2, 'AA', 2),
(1, 1, 3, 'AA', 3),
(1, 1, 4, 'AA', 4),
(2, 2, 1, 'BB', 1),
(2, 2, 2, 'BB', 2);

select * from YourTable

;WITH cte AS (
    SELECT
        A,
        B,
        C,
        CompanyCode,
        GL,
        ROW_NUMBER() OVER (PARTITION BY A ORDER BY GL) AS rn_a,
        ROW_NUMBER() OVER (PARTITION BY B ORDER BY GL) AS rn_b
    FROM 
        YourTable
)
SELECT
    CASE WHEN rn_a = 1 THEN A ELSE NULL END AS A,
    CASE WHEN rn_b = 1 THEN B ELSE NULL END AS B,
    C,
    CompanyCode,
    GL
FROM 
    cte
ORDER BY
    GL;


;WITH cte AS (
    SELECT
        A,
        B,
        C,
        CompanyCode,
        GL,
        ROW_NUMBER() OVER (PARTITION BY A ORDER BY GL) AS rn_a,
        ROW_NUMBER() OVER (PARTITION BY B ORDER BY GL) AS rn_b
    FROM 
        YourTable
)
SELECT
    CASE WHEN rn_a = 1 THEN A ELSE NULL END AS A,
    CASE WHEN rn_b = 1 THEN B ELSE NULL END AS B,
    C,
    CASE WHEN rn_a = 1 AND rn_b = 1 THEN CompanyCode ELSE NULL END AS CompanyCode,
    GL
FROM 
    cte;

