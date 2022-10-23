-- SQLite
select distinct ShipName, SubStr(ShipName, 1, instr(ShipName, '-') -1) as ShipName1
from 'Order'
where ShipName Like '%-%'
Order by ShipName;