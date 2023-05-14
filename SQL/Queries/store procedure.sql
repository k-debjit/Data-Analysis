/*
Stored Procedure
*/

--CREATE PROCEDURE TEST
--AS
--SELECT *
--FROM EmployeeDemographics

--EXEC TEST

--It stores the data into programmability->stored procedures folder

CREATE PROCEDURE Temp_Employee
AS
CREATE TABLE #temp_employee( --temp table creation
JobTitle varchar(100),
EmployeePerJob int,
AvgAge int,
AvgSalary int
)


INSERT INTO #temp_employee
SELECT JobTitle, COUNT(JobTitle), AVG(Age), AVG(Salary)
FROM [SQL Tutorial].dbo.EmployeeDemographics emp
JOIN [SQL Tutorial].dbo.EmployeeSalary Sal
ON emp.EmployeeID = Sal.EmployeeID
GROUP BY JobTitle

SELECT * 
FROM #temp_employee


EXEC Temp_Employee

/*
In the stored procedure folder we need to alter procedure. We can add a parameter
*/

EXEC Temp_Employee @JobTitle = 'Salesman'