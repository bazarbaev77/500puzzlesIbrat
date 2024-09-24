CREATE TABLE ExampleTable (
    ID INT,
    VALUES_ VARCHAR(MAX)
);

INSERT INTO ExampleTable (ID, VALUES_) VALUES (1, 'a,b,c');
INSERT INTO ExampleTable (ID, VALUES_) VALUES (2, 's,t,u,v,w,x');

select * from ExampleTable

SELECT id, value
FROM ExampleTable
    CROSS APPLY STRING_SPLIT([VALUES_], ',')
