CREATE TABLE w (
    ID INT PRIMARY KEY,
    Typ CHAR(1),
    Value1 VARCHAR(50),
    Value2 VARCHAR(50),
    Value3 VARCHAR(50)
);

INSERT INTO w (ID, Typ, Value1, Value2, Value3)
VALUES 
    (1, 'I', 'a', 'b', NULL),
    (2, 'O', 'a', 'd', 'f'),
    (3, 'I', 'd', 'b', NULL),
    (4, 'O', 'g', 'l', NULL),
    (5, 'I', 'z', 'g', 'a'),
    (6, 'I', 'z', 'g', 'a');

select typ, count(*) counts from w
where value1 = 'a'
or value2 = 'a'
or value3 = 'a'
group by typ