/*Having*/

SELECT JobTitle, COUNT(JobTitle)
FROM [SQL Tutorial].dbo.EmployeeDemographics
JOIN [SQL Tutorial].dbo.EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
--WHERE COUNT(JobTitle) > 1 -- aggregate function can't be used in where statement
GROUP BY JobTitle --Group by statement needs to be written first because aggregate function cannot work before it is actually aggregated in groupby statement
HAVING COUNT(JobTitle) > 1


SELECT JobTitle, AVG(Salary)
FROM [SQL Tutorial].dbo.EmployeeDemographics
JOIN [SQL Tutorial].dbo.EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
--WHERE COUNT(JobTitle) > 1 -- aggregate function can't be used in where statement
GROUP BY JobTitle --Group by statement needs to be written first because aggregate function cannot work before it is actually aggregated in groupby statement
HAVING AVG(Salary) > 45000
ORDER BY AVG(Salary)