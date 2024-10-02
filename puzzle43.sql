CREATE TABLE SpecialProductMaster
(
ID INT
,ProductName VARCHAR(10)
)
GO
 
INSERT INTO SpecialProductMaster(Id,ProductName)
VALUES
(1,'Maggi'),
(2,'Surf')
 
CREATE TABLE we
(
SaleID INT
,ProductName VARCHAR(10)
,CustID INT
,SaleDATE DATETIME DEFAULT GETDATE()
)
GO
 
INSERT INTO we(SaleID,ProductName,CustID)
VALUES
(112,'Surf',346),
(109,'Parle',345),
(101,'Maggi',345),
(201,'Surf',345),
(302,'Rin',122),
(303,'TV',142)

select * from we
select * from SpecialProductMaster



;with cte7 as(
select CustID, 
       count(ProductName) a
from we 
where ProductName in (select ProductName from SpecialProductMaster) 
group by CustID
),
cte8 as (
select * from we
)
select cte8.SaleID, cte8.ProductName, cte8.CustID, cte8.SaleDATE
from cte7 join cte8 on cte7.CustID = cte8.CustID
where cte7.a > 1 
and cte8.ProductName in (select ProductName from SpecialProductMaster); 









