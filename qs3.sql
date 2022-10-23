SELECT B.CompanyName, ROUND(A.count1*1.0/B.count2,2)As Ratio
FROM
(SELECT COUNT(*) AS count1,Shipper.CompanyName
FROM 'Order',Shipper 
WHERE
    Shipper.Id='Order'.ShipVia AND
    ShippedDate > RequiredDate
GROUP BY 'Order'.ShipVia)A
NATURAL JOIN
(SELECT COUNT(*) AS count2,Shipper.CompanyName
FROM 'Order',Shipper 
WHERE
    Shipper.Id='Order'.ShipVia
GROUP BY 'Order'.ShipVia)B
Order BY Ratio DESC