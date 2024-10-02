CREATE TABLE FruitCount
(
Name VARCHAR(20)
,Fruit VARCHAR(25)
)
GO
 
--Insert Data
INSERT INTO FruitCount(Name,Fruit) VALUES
('Neeraj'    ,'MANGO'),
('Neeraj'    ,'MANGO'),
('Neeraj'    ,'MANGO'),
('Neeraj'    ,'APPLE'),
('Neeraj'    ,'ORANGE'),
('Neeraj'    ,'LICHI'),
('Neeraj'    ,'LICHI'),
('Neeraj'    ,'LICHI'),
('Isha'     ,'MANGO'),
('Isha'     ,'MANGO'),
('Isha'     ,'APPLE'),
('Isha'     ,'ORANGE'),
('Isha'     ,'LICHI'),
('Gopal' ,'MANGO'),
('Gopal' ,'MANGO'),
('Gopal' ,'APPLE'),
('Gopal' ,'APPLE'),
('Gopal' ,'APPLE'),
('Gopal' ,'ORANGE'),
('Gopal' ,'LICHI'),
('Mayank'  ,'MANGO'),
('Mayank'  ,'MANGO'),
('Mayank'  ,'APPLE'),
('Mayank'  ,'APPLE'),
('Mayank'  ,'ORANGE'),
('Mayank'  ,'LICHI')
 
--Verify Data
SELECT count(Name),Fruit, name FROM FruitCount
group by fruit, name


SELECT Name, [APPLE], [MANGO], [ORANGE], [LICHI]
FROM 
(
    SELECT Name, Fruit, COUNT(*) AS [count]
    FROM FruitCount
    GROUP BY Name, Fruit
) AS SourceTable
PIVOT
(
    SUM(count)  
    FOR Fruit IN ([APPLE], [MANGO], [ORANGE], [LICHI])  
) AS p
ORDER BY Name;



;WITH FruitCounts AS
(
    SELECT Name, Fruit, COUNT(*) AS Count
    FROM FruitCount
    GROUP BY Name, Fruit
)


SELECT Name, [APPLE], [MANGO], [ORANGE], [LICHI]
FROM 
(
    SELECT Name, Fruit, Count
    FROM FruitCounts 
) AS SourceTable
PIVOT
(
    SUM(Count)  
    FOR Fruit IN ([APPLE], [MANGO], [ORANGE], [LICHI])  -- Pivoted columns
) AS PivotTable
ORDER BY Name;


