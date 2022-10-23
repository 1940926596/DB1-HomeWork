SELECT group_concat(ProductName,',') as Product
FROM
(SELECT P.ProductName,P.Id
    FROM Product P,Customer C,'Order' O,OrderDetail OrD
    WHERE  
            C.Id=O.CustomerId AND
            O.Id=OrD.OrderId AND
            P.Id=OrD.ProductId AND
            C.CompanyName='Queen Cozinha' AND
            O.OrderDate LIKE '%2014-12-25%'
            Order by P.id
)