-- SQLite
SELECT 'Order'.Id,
    'Order'.ShipCountry,
    (
        CASE
            'Order'.ShipCountry
            WHEN 'USA' THEN 'NorthAmerica'
            WHEN 'Mexico' THEN 'NorthAmerica'
            WHEN 'Canada' THEN 'NorthAmerica'
            ELSE 'OtherPlace'
        END
    ) as Place
FROM 'ORDER'
WHERE Id >= 15445
ORDER BY Id
LIMIT 20