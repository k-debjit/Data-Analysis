/*

Today's Topic: String Functions - TRIM, LTRIM, RTRIM, Replace, Substring, Upper, Lower

*/

--Drop Table EmployeeErrors;


CREATE TABLE EmployeeErrors (
EmployeeID varchar(50)
,FirstName varchar(50)
,LastName varchar(50)
)

Insert into EmployeeErrors Values 
('1001  ', 'Jimbo', 'Halbert')
,('  1002', 'Pamela', 'Beasely')
,('1005', 'TOby', 'Flenderson - Fired')

Select *
From EmployeeErrors

-- Using Trim, LTRIM, RTRIM

Select EmployeeID, TRIM(employeeID) AS IDTRIM
FROM EmployeeErrors --trim gets rid of blank spaces

Select EmployeeID, RTRIM(employeeID) as IDRTRIM
FROM EmployeeErrors --Trimming blank space from right side

Select EmployeeID, LTRIM(employeeID) as IDLTRIM
FROM EmployeeErrors --Trimming from left side

	



-- Using Replace

Select LastName, REPLACE(LastName, '- Fired', '') as LastNameFixed
FROM EmployeeErrors


-- Using Substring

Select Substring(err.FirstName,1,3), Substring(dem.FirstName,1,3), Substring(err.LastName,1,3), Substring(dem.LastName,1,3) --this will start at 1st spot and will include next two spot. Total 3 spot
FROM EmployeeErrors err
JOIN EmployeeDemographics dem
	on Substring(err.FirstName,1,3) = Substring(dem.FirstName,1,3)
	and Substring(err.LastName,1,3) = Substring(dem.LastName,1,3)

/* its also called fuzzy match. For example: one column is Alex and another is called Alexander. These two tables can't be joined on these two columns, because the names
 are different. But substring can match.
 */

-- Using UPPER and lower

Select firstname, LOWER(firstname)
from EmployeeErrors --making all lower case

Select Firstname, UPPER(FirstName)
from EmployeeErrors --making all upper case