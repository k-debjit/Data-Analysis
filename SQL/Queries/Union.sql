/*
Union, Union
*/

--Create Table WareHouseEmployeeDemographics 
--(EmployeeID int, 
--FirstName varchar(50), 
--LastName varchar(50), 
--Age int, 
--Gender varchar(50)
--)


--Insert into WareHouseEmployeeDemographics VALUES
--(1013, 'Darryl', 'Philbin', NULL, 'Male'),
--(1050, 'Roy', 'Anderson', 31, 'Male'),
--(1051, 'Hidetoshi', 'Hasagawa', 40, 'Male'),
--(1052, 'Val', 'Johnson', 31, 'Female')

--SELECT *
--FROM [SQL Tutorial].dbo.EmployeeDemographics
--UNION
--SELECT *
--FROM [SQL Tutorial].dbo.WareHouseEmployeeDemographics
--all the data will shown within the same columns. Joining shows data in different column
--Union avoids duplicate data

SELECT *
FROM [SQL Tutorial].dbo.EmployeeDemographics
UNION ALL
SELECT *
FROM [SQL Tutorial].dbo.WareHouseEmployeeDemographics
--Union all doesn't exclude duplicate data
