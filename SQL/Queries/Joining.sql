/* Inner joins, full/left/right Outer Joins
*/

--SELECT *
--FROM [SQL Tutorial].dbo.EmployeeDemographics
--Inner Join [SQL Tutorial].dbo.EmployeeSalary
--ON EmployeeDemographics.EmployeeID = EmployeeSalary.Employee
--Inner join shows only common between two tables

select * from EmployeeSalary
select * from EmployeeDemographics



--SELECT *
--FROM [SQL Tutorial].dbo.EmployeeDemographics
--Full Outer Join [SQL Tutorial].dbo.EmployeeSalary
--ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
--Full outer join shows everything between tables


--SELECT *
--FROM [SQL Tutorial].dbo.EmployeeDemographics
--Left Outer Join [SQL Tutorial].dbo.EmployeeSalary
--ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
--It shows everything on the left or first table + common between the two tables
--It doesn't show any data that is only on right table or 2nd table


--SELECT *
--FROM [SQL Tutorial].dbo.EmployeeDemographics
--Right Outer Join [SQL Tutorial].dbo.EmployeeSalary
--ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
--It is just opposit of Left Outer Join. shows everything on the right table and common data between two tables


--SELECT EmployeeDemographics.EmployeeID, FirstName, LastName, Salary
--FROM [SQL Tutorial].dbo.EmployeeDemographics
--Inner Join [SQL Tutorial].dbo.EmployeeSalary
--ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
--WHERE FirstName <> 'Michael'
--ORDER BY Salary DESC


SELECT Jobtitle, AVG(Salary) AS 'Average Salary'
FROM [SQL Tutorial].dbo.EmployeeDemographics
Inner Join [SQL Tutorial].dbo.EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
WHERE Jobtitle = 'Salesman'
GROUP BY Jobtitle


