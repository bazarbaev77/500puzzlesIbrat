CREATE TABLE [dbo].[TestMultipleZero]
(
[A] [int] NULL,
[B] [int] NULL,
[C] [int] NULL,
[D] [int] NULL
)
GO
 
--Insert Data
INSERT INTO [dbo].[TestMultipleZero](A,B,C,D)
VALUES (0,0,0,1),(0,0,1,0),(0,1,0,0),(1,0,0,0),(0,0,0,0),(1,1,1,0)
 
--Check data
SELECT A,B,C,D FROM [dbo].[TestMultipleZero]

;with cte7
as(
SELECT A,B,C,D, 
	case
	when A > 0 then 1
	when b > 0 then 1
	when c > 0 then 1
	when d > 0 then 1
	end as w
FROM [dbo].[TestMultipleZero]
)
select a, b, c, d from cte7 where w is not null


select * from TestMultipleZero
where a<>0 
or b<>0
or c<>0
or d<>0





