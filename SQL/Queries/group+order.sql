/*
Group By, Order By
*/

--Select Gender, COUNT(Gender)
--FROM EmployeeDemographics
--GROUP BY Gender
----showing grouping by gender column

--Select Gender, Age, COUNT(Gender)
--FROM EmployeeDemographics
--GROUP BY Gender, Age

----showing grouping by gender and age column

--SELECT *
--FROM EmployeeDemographics
--ORDER BY Age
----By default its ascending order

--SELECT *
--FROM EmployeeDemographics
--ORDER BY Age DESC
---- descending order


--SELECT *
--FROM EmployeeDemographics
--ORDER BY Age DESC, Gender DESC
----both descending

--SELECT *
--FROM EmployeeDemographics
--ORDER BY Age, Gender DESC
---- only gender descending

SELECT *
FROM EmployeeDemographics
ORDER BY 4 DESC, 5 DESC
--culumn number instead of column name