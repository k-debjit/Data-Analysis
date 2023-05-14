/*
Partition By
*/

SELECT FirstName, LastName, Gender, Salary
FROM [SQL Tutorial].dbo.EmployeeDemographics AS dem
JOIN [SQL Tutorial].dbo.EmployeeSalary AS sal
ON dem.EmployeeID = sal.EmployeeID


SELECT FirstName, LastName, Gender, Salary,
COUNT(Gender) OVER (PARTITION BY Gender) AS TotalGender
FROM [SQL Tutorial].dbo.EmployeeDemographics AS dem
JOIN [SQL Tutorial].dbo.EmployeeSalary AS sal
ON dem.EmployeeID = sal.EmployeeID

/* Difference between group by and partition*/

--'Group By' cannot aggregate totalgender like 'partition by' when other columns are selected
SELECT FirstName, LastName, Gender, Salary,COUNT(Gender) 
FROM [SQL Tutorial].dbo.EmployeeDemographics AS dem
JOIN [SQL Tutorial].dbo.EmployeeSalary AS sal
ON dem.EmployeeID = sal.EmployeeID
GROUP BY FirstName, LastName, Gender, Salary


--'Group By' is aggregating this way. 'Partition by' is taking this query and implementing in one line
SELECT Gender, COUNT(Gender) AS TotalGender
FROM [SQL Tutorial].dbo.EmployeeDemographics AS dem
JOIN [SQL Tutorial].dbo.EmployeeSalary AS sal
ON dem.EmployeeID = sal.EmployeeID
GROUP BY Gender
