SELECT C.CategoryName,count(*)count,Round(avg(P.UnitPrice),2)avgPrice,
min(P.UnitPrice)minPrice,max(P.UnitPrice)maxPrice,Sum(P.UnitsOnOrder)sumOrder
FROM Product P,Category C
WHERE C.Id=P.CategoryId
GROUP BY P.CategoryId
HAVING count(*)>10