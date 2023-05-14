/*
Subqueries
*/

SELECT *
FROM EmployeeSalary

-- Subquery in select
SELECT EmployeeID, Salary, (SELECT AVG(Salary) FROM EmployeeSalary) AS AllAvgSalary
FROM EmployeeSalary

-- How to do it with Partition By
SELECT EmployeeID, Salary, AVG(Salary) OVER () AS AllAvgSalary
FROM EmployeeSalary

--Why group by doesn't work
SELECT EmployeeID, Salary, AVG(Salary)  AS AllAvgSalary
FROM EmployeeSalary
GROUP BY EmployeeID, Salary
ORDER BY 1,2

--Subquery in FROM

SELECT a.EmployeeID, AllAvgSalary
FROM (SELECT EmployeeID, Salary, AVG(Salary) OVER () AS AllAvgSalary
FROM EmployeeSalary) a

--Subquery in where
SELECT EmployeeID, JobTitle, Salary
FROM EmployeeSalary
WHERE EmployeeSalary in 
(SELECT EpmloyeeID FROM EmployeeDemographics WHERE Age > 30)