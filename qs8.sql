SELECT R.RegionDescription,FirstName,LastName,BirthDate
FROM Employee E,EmployeeTerritory EmpT,Territory T,Region R
WHERE E.id=EmpT.EmployeeId AND
    EmpT.TerritoryId=T.Id AND
    R.Id=T.RegionId
GROUP BY R.RegionDescription