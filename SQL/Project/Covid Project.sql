SELECT 
location, date, total_cases, new_cases, total_deaths, population
FROM PortfolioProject..CovidDeaths
ORDER BY 1,2 -- first and second column data will be in alphabetical order

--total cases vs total deaths
SELECT 
location, date, total_cases, total_deaths, (total_deaths/total_cases) * 100 AS DeathPercentage
FROM PortfolioProject..CovidDeaths
WHERE location LIKE '%state%'
ORDER BY 1,2


-- Total cases vs Population. 
-- What percentage of population affected by covid
SELECT
location, date, total_cases, population, (total_cases/population)*100 AS AffectedPercentage
FROM PortfolioProject..CovidDeaths
WHERE location LIKE '%australia%'
ORDER BY 1,2

-- Countries with highest infection rate compared to population
SELECT
location,MAX(total_cases) AS HighestInfection, population, MAX((total_cases/population))*100 AS AffectedPercentage
FROM PortfolioProject..CovidDeaths
GROUP BY location, population
ORDER BY AffectedPercentage DESC

--Countries with Highest Death count per population
SELECT
location,MAX(CAST(total_deaths AS INT)) AS TotalDeath -- cast or read as integer is needed because of datatype mismatch
FROM PortfolioProject..CovidDeaths
WHERE continent IS NOT NULL
GROUP BY location
ORDER BY TotalDeath DESC

--Continent with highest Death count
SELECT
continent,MAX(CAST(total_deaths AS INT)) AS TotalDeath -- cast or read as integer is needed because of datatype mismatch
FROM PortfolioProject..CovidDeaths
WHERE continent IS NOT NULL
GROUP BY continent
ORDER BY TotalDeath DESC


-- GLOBAL NUMBERS

Select SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, SUM(cast(new_deaths as int))/SUM(New_Cases)*100 as DeathPercentage
From PortfolioProject..CovidDeaths
--Where location like '%states%'
where continent is not null 
--Group By date
order by 1,2

--Total population vs total vaccination
SELECT CD.continent, CD.location, CD.date, CD.population, CV.new_vaccinations
, SUM(CONVERT(int,CV.new_vaccinations)) OVER (Partition by CD.Location Order by CD.location, CD.Date) as RollingPeopleVaccinated
FROM PortfolioProject..CovidDeaths AS CD
JOIN PortfolioProject..CovidVaccinations AS CV
ON CD.location = CV.location
AND CD.date = CV.date
WHERE CD.continent IS NOT NULL
ORDER BY 1,2,3


--Total population vs total vaccination using CTE
With PopvsVac (Continent, Location, Date, Population, New_Vaccinations, RollingPeopleVaccinated)
as
(
Select CD.continent, CD.location, CD.date, CD.population, CV.new_vaccinations
, SUM(CONVERT(int,CD.new_vaccinations)) OVER (Partition by CD.Location Order by CD.location, CD.Date) as RollingPeopleVaccinated
From PortfolioProject..CovidDeaths AS CD
Join PortfolioProject..CovidVaccinations AS CV
	On CD.location = CV.location
	and CD.date = CV.date
where CD.continent is not null 
--order by 2,3
)
Select * , (RollingPeopleVaccinated/Population)*100
From PopvsVac


-- Using Temp Table to perform Calculation on Partition By in previous query

DROP Table if exists #PercentPopulationVaccinated
Create Table #PercentPopulationVaccinated
(
Continent nvarchar(255),
Location nvarchar(255),
Date datetime,
Population numeric,
New_vaccinations numeric,
RollingPeopleVaccinated numeric
)

Insert into #PercentPopulationVaccinated
Select CD.continent, CD.location, CD.date, CD.population, CV.new_vaccinations
, SUM(CONVERT(int,CV.new_vaccinations)) OVER (Partition by CD.Location Order by CD.location, CD.Date) as RollingPeopleVaccinated
--, (RollingPeopleVaccinated/population)*100
From PortfolioProject..CovidDeaths CD
Join PortfolioProject..CovidVaccinations CV
	On CD.location = CV.location
	and CD.date = CV.date
--where CD.continent is not null 
--order by 2,3

Select *, (RollingPeopleVaccinated/Population)*100
From #PercentPopulationVaccinated


-- Creating View to store data for later visualizations. In SQL, a view is a virtual table based on the result-set of an SQL statement.

Create View PercentPopulationVaccinated 
AS
Select CD.continent, CD.location, CD.date, CD.population, CV.new_vaccinations
, SUM(CONVERT(int,CV.new_vaccinations)) OVER (Partition by CD.Location Order by CD.location, CD.Date) as RollingPeopleVaccinated
--, (RollingPeopleVaccinated/population)*100
From PortfolioProject..CovidDeaths CD
Join PortfolioProject..CovidVaccinations CV
	On CD.location = CV.location
	and CD.date = CV.date
where CD.continent is not null 
--order by 2,3

SELECT * FROM PercentPopulationVaccinated
 