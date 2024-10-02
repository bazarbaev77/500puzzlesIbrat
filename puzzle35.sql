CREATE TABLE [dbo].[RangeValues]
(
[Vals] [int] NULL
)
GO
 
--Insert Data
INSERT INTO [RangeValues](Vals)
VALUES
(125),
(350),
(270),
(140)
 
--Verify Data
SELECT Vals FROM [RangeValues]


SELECT vals,
    CONCAT(
        IIF(vals = 125, 100, null), 
        IIF(vals = 350, 300, null), 
        IIF(vals = 270, 200, null), 
        IIF(vals = 140, 100, null)
    ) AS ValCase
FROM 
    [RangeValues];


SELECT Vals 
,IIF ( Vals = 125 , '100' , IIF (Vals = 350 , '300' , IIF( Vals = 270 , '200', IIF( Vals = 140 , '100', Vals )))) as ValCase
FROM [dbo].[RangeValues]