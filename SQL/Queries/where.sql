/*
where statement
=, (does not)<>, <, >, And, Or, Like, Null, Not Null< In
*/

--SELECT *
--FROM EmployeeDemographics
--WHERE FirstName = 'Jim'

--SELECT *
--FROM EmployeeDemographics
--WHERE Age <=32 AND Gender = 'Male'

--SELECT *
--FROM EmployeeDemographics
--WHERE LastName LIKE 'S%'
-- lastname start with S

--SELECT *
--FROM EmployeeDemographics
--WHERE LastName LIKE '%S%'
--lastname has S

--SELECT *
--FROM EmployeeDemographics
--WHERE LastName LIKE 'S%o%'
--S in the beginning and o is also present somewhere.another example: 'S%c%ott%'


SELECT *
FROM EmployeeDemographics
WHERE FirstName IN ('Jim', 'Michael')
--IN is short version of multiple AND