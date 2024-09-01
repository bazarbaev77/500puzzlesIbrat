--[Movie Puzzle] – Write a query which will gets the movie details
--where Mr. Amitabh and Mr. Vinod acted together and their role is actor.
--use puzzles500

CREATE TABLE #Movie
(
 
[MName] [varchar] (10) NULL,
[AName] [varchar] (10) NULL,
[Roles] [varchar] (10) NULL
)
 
GO
 
--Insert data in the table
 
INSERT INTO #Movie(MName,AName,Roles)
SELECT 'A','Amitabh','Actor'
UNION ALL
SELECT 'A','Vinod','Villan'
UNION ALL
SELECT 'B','Amitabh','Actor'
UNION ALL
SELECT 'B','Vinod','Actor'
UNION ALL
SELECT 'D','Amitabh','Actor'
UNION ALL
SELECT 'E','Vinod','Actor' 


Select mname,
	   AName, 
	   roles
From #Movie  
Where MName in 
		(
			Select mname 
			From #movie 
			Where roles = 'actor'
			Group By mname
            Having Count(*) >1
		)