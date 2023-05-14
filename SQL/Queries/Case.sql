/*
Case statement
*/

--SELECT FirstName, LastName, Age,
--CASE
--WHEN Age > 30 THEN 'Old'
--ELSE 'Young'
--END
--FROM [SQL Tutorial].dbo.EmployeeDemographics
--WHERE Age is NOT NULL
--ORDER BY Age


--SELECT FirstName, LastName, Age,
--CASE
--WHEN Age > 30 THEN 'Old'
--WHEN Age BETWEEN 27 AND 30 THEN 'Young' -- this statement is not going to be returned. Because if first condition is satisfied, 2nd condition will not be returned
--ELSE 'Young'
--END
--FROM [SQL Tutorial].dbo.EmployeeDemographics
--WHERE Age is NOT NULL
--ORDER BY Age


SELECT FirstName, LastName, JobTitle, Salary,

CASE
WHEN JobTitle = 'Salesman' THEN Salary + (Salary * .10)
WHEN JobTitle = 'Accountant' THEN Salary + (Salary * .05)
WHEN JobTitle = 'HR' THEN Salary + (Salary * .000001)
ELSE Salary + (Salary * .03)
END AS SalaryRaise

FROM [SQL Tutorial].dbo.EmployeeDemographics
Join [SQL Tutorial].dbo.EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
