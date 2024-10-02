
CREATE TABLE Approver
(
ID INT
,Name VARCHAR(10)
)
GO
 
 
--Insert data
INSERT INTO Approver(ID,Name)
VALUES (1001,'Ram') , (1002,'Ramesh') , (1003,'Supriya') ,(1004,'Sharlee')
 
 
--Verify data
SELECT ID,Name FROM Approver
 
 
--Create table
CREATE TABLE TicketDetails
(
TicketID INT
,CreatedBy INT
,ApprovedBy INT
)
GO
 
--Insert data
INSERT INTO TicketDetails(TicketID,CreatedBy,ApprovedBy)
VALUES
(1,1001,1004),
(2,1001,1004),
(3,1002,1004),
(4,1001,1003)
 

select td.TicketID,
    c.name as CreatedByName,
    a.name as ApprovedByName
from 
    TicketDetails td
join 
    Approver c on td.CreatedBy = c.ID
join 
    Approver a on td.ApprovedBy = a.ID
order by 
    td.TicketID;



