--Top,distinct,count,as,max,min,avg



--Select FistName, LastName 
--from EmployeeDemographics

--select top * 
--from EmployeeDemographics

--select distinct(EmployeeID)
--from EmployeeDemographics

--select count(LastName)
--from EmployeeDemographics

--select count(LastName) As EmployeeLastName
--from EmployeeDemographics

--select max(Salary)
--from EmployeeSalary

--select avg(Salary) as average
--from EmployeeSalary

-- specify database inside query. This gives access to correct database from anywhere
select * 
from [SQL Tutorial].dbo.EmployeeSalary