WITH total AS(
SELECT *,ntile(4) OVER(Order BY sum) as buckets
FROM(SELECT O.CustomerId,ROUND(sum(ORD.UnitPrice*Quantity),2)as sum
    FROM 'Order' O,OrderDetail ORD
    WHERE
        ORD.OrderId=O.Id
    GROUP BY O.CustomerId
    ORDER BY sum)a
)

SELECT 'MISSING_NAME'as CompanyName,CustomerId,sum
FROM total 
WHERE total.CustomerId not in(SELECT C.Id FROM Customer C)

UNION

SELECT ifNull(C.CompanyName,'MISSING_NAME'),C.Id,sum
FROM total,Customer C
WHERE total.CustomerId=C.Id
    AND total.buckets=1
ORDER BY sum
