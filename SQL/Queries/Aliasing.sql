/*
Aliasing
*/

--SELECT FirstName AS Fname
--FROM [SQL Tutorial].dbo.EmployeeDemographics

--SELECT FirstName Fname
--FROM [SQL Tutorial].dbo.EmployeeDemographics

--SELECT FirstName +' '+ LastName AS FullName
--FROM [SQL Tutorial].dbo.EmployeeDemographics


--SELECT AVG(Age) AS AverageAge
--FROM [SQL Tutorial].dbo.EmployeeDemographics


--Aliasing Table name
SELECT Demo.EmployeeID, Sal.Salary --its important to use alias name prefacing with column name
FROM [SQL Tutorial].dbo.EmployeeDemographics AS Demo
JOIN [SQL Tutorial].dbo.EmployeeSalary AS Sal
ON Demo.EmployeeID = Sal.EmployeeID


SELECT Demo.EmployeeID, Demo.FirstName, Demo.LastName, Sal.JobTitle, Ware.Age
FROM [SQL Tutorial].dbo.EmployeeDemographics AS Demo
LEFT JOIN [SQL Tutorial].dbo.EmployeeSalary AS Sal
ON Demo.EmployeeID = Sal.EmployeeID
LEFT JOIN [SQL Tutorial].dbo.WareHouseEmployeeDemographics AS Ware
ON Demo.EmployeeID = Ware.EmployeeID