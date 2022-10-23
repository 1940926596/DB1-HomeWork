SELECT a.ProductName,a.CompanyName,a.ContactName
FROM
(SELECT a.ProductName,a.CompanyName,a.ContactName,min(a.OrderDate)
FROM
    (SELECT P.ProductName,C.CompanyName,C.ContactName,P.Id,O.OrderDate
    From Product P,Customer C,'Order' O,OrderDetail OrD
    WHERE P.DiScontinued=1 AND
        C.Id=O.CustomerId AND
        O.Id=OrD.OrderId AND
        P.Id=OrD.ProductId
    )a INNER JOIN
    (SELECT P.Id FROM Product P WHERE DiScontinued=1)b
    ON a.Id=b.Id
GROUP BY ProductName)a