-- Create the table
CREATE TABLE ClubChampionships (
    club_id INT,
    club_name VARCHAR(50),
    championship_year INT,
    year_100th_champion BIT
);

-- Insert data into the table
INSERT INTO ClubChampionships (club_id, club_name, championship_year, year_100th_champion) VALUES
(1, 'FENERBAHCE', 2007, 1),
(2, 'GALATASARAY', 2006, 0),
(3, 'BESIKTAS', 2003, 1),
(1, 'FENERBAHCE', 2005, 0),
(1, 'FENERBAHCE', 2004, 0),
(2, 'GALATASARAY', 2002, 0),
(2, 'GALATASARAY', 2000, 0),
(2, 'GALATASARAY', 1999, 0),
(2, 'GALATASARAY', 1998, 0),
(2, 'GALATASARAY', 1997, 0),
(1, 'FENERBAHCE', 1996, 0),
(1, 'FENERBAHCE', 2001, 0),
(1, 'FENERBAHCE', 1989, 0),
(1, 'FENERBAHCE', 1985, 0);

;with cte4 as
(
select club_name,
       championship_year
from ClubChampionships
where year_100th_champion = 1
),
cs as
( 
select club_name, 
       count(championship_year) as tr 
from ClubChampionships
group by club_name
)
select top 1
    club_name, 
    max(tr) as mc
from cs
group by club_name
order by mc desc;
