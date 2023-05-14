/*
Temp Tables
*/

--CREATE TABLE #temp_Employee (
--EmployeeID int,
--JobTitle varchar(100),
--Salary int
--)

--SELECT * 
--FROM #temp_Employee

--INSERT INTO #temp_Employee VALUES(
--'1001', 'HR', '45000'
--)


--copying data from a table into temp table
--INSERT INTO #temp_Employee
--SELECT *
--FROM [SQL Tutorial].dbo.EmployeeSalary


CREATE TABLE #Temp_Employee2(
JobTitle varchar(50),
EmployeePerJob int,
AvgAge int,
AvgSalary int
)

INSERT INTO #Temp_Employee2
SELECT JobTitle, COUNT(JobTitle), Avg(Age), AVG(Salary)
FROM [SQL Tutorial].dbo.EmployeeDemographics Emp
JOIN [SQL Tutorial].dbo.EmployeeSalary Sal
ON Emp.EmployeeID = Sal.EmployeeID
GROUP BY JobTitle

SELECT *
FROM #Temp_Employee2

--This will delete previous table
--DROP TABLE IF EXISTS #Temp_Employee2