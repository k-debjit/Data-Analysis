USE [SQL Tutorial]
GO
/****** Object:  StoredProcedure [dbo].[Temp_Employee]    Script Date: 13-May-23 3:59:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[Temp_Employee]
@JobTitle nvarchar(100) --parameter
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
WHERE JobTitle = @JobTitle -- input
GROUP BY JobTitle

SELECT * 
FROM #temp_employee