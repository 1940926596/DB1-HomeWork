SELECT Id,a.OrderDate,lag(a.OrderDate,1,OrderDate) OVER (ORDER BY a.OrderDate)as Previous,
ROUND(julianday(a.OrderDate)-julianday(lag(a.OrderDate,1,OrderDate)OVER (ORDER BY a.OrderDate)),2)as diff
FROM(SELECT O.OrderDate,O.Id
    FROM Customer C,'Order' O
    WHERE C.Id='BLONP' AND
        O.CustomerId='BLONP'
    LIMIT 10
    )a
