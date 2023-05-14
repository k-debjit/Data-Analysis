/*
Common table expressions. CTE
*/

WITH CTE_Employee as (
SELECT FirstName, LastName, Gender, Salary,
COUNT(Gender) OVER (PARTITION BY Gender) AS TotalGender,
AVG(Salary) OVER (PARTITION BY Gender) AS AvgSalary
FROM [SQL Tutorial].dbo.EmployeeDemographics AS Emp
JOIN [SQL Tutorial].dbo.EmployeeSalary AS Sal
ON Emp.EmployeeID = Sal.EmployeeID
WHERE Salary > '45000'
)

--This statement doesn't work alone. Previous statement is always needed.
SELECT * 
FROM CTE_Employee

