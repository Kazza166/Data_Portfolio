SELECT *
FROM PortfolioProject..CovidDeaths
WHERE continent is not null
ORDER BY 3,4;

--Select and view data in CovidDeaths & CovidVaccinations Tables

SELECT Location, date, total_cases, new_cases, total_deaths, population
FROM PortfolioProject..CovidDeaths
WHERE continent IS NOT NULL
ORDER BY 1,2;

--Select and view data in CovidDeaths ordered by specified columns

SELECT Location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 AS 'Death Percentage'
FROM PortfolioProject..CovidDeaths
WHERE location like'%kingdom%'
AND continent IS NOT NULL
ORDER BY 1,2;


--Total Cases vs Total Deaths for UK googled UK Deaths to validate number 
-- Death Percentage is likelihood of death from contracting covid in the UK

SELECT Location, date, total_cases, population, (total_cases/population)*100 AS 'Percentage of Population Infected'
FROM PortfolioProject..CovidDeaths
--WHERE location like'%kingdom%'
WHERE continent IS NOT NULL
ORDER BY 1,2;

--Total Cases vs Population for UK 
-- Percentage of Population in UK that contracted Covid

SELECT Location,MAX(total_cases) as HighestInfectionCount, population, MAX((total_cases/population))*100 AS 'Percentage of Population Infected'
FROM PortfolioProject..CovidDeaths
--WHERE location like'%kingdom%'
GROUP BY Continent, Population
ORDER BY 'Percentage of Population Infected' DESC;

--Countries with Highest Infection Rate compared to Population

SELECT Location,MAX(CAST(total_deaths AS INT)) AS 'Total Death Count'
FROM PortfolioProject..CovidDeaths
WHERE continent IS NOT NULL
GROUP BY location
ORDER BY 'Total Death Count' DESC;

--Countries with Highest Death Rate per Population

SELECT continent,MAX(CAST(total_deaths AS INT)) AS 'Total Death Count'
FROM PortfolioProject..CovidDeaths
WHERE continent IS NULL
GROUP BY continent
ORDER BY 'Total Death Count' DESC;

SELECT continent,MAX(CAST(total_deaths AS INT)) AS 'Total Death Count'
FROM PortfolioProject..CovidDeaths
WHERE continent IS NOT NULL
GROUP BY continent
ORDER BY 'Total Death Count' DESC;

--BY Continent


--Global Info

SELECT date,SUM(new_cases) AS 'Total New Cases',SUM(CAST(new_deaths AS INT)) AS 'Total New Deaths', SUM(CAST(new_deaths AS INT))/SUM(new_cases)*100 AS 'Death Percentage'
FROM PortfolioProject..CovidDeaths
WHERE continent IS NOT NULL
GROUP BY date
ORDER BY 1,2;

--Daily

SELECT SUM(new_cases) AS 'Total New Cases',SUM(CAST(new_deaths AS INT)) AS 'Total New Deaths', SUM(CAST(new_deaths AS INT))/SUM(new_cases)*100 AS 'Death Percentage'
FROM PortfolioProject..CovidDeaths
WHERE continent IS NOT NULL
ORDER BY 1,2;

--To Date

SELECT * 
FROM PortfolioProject..CovidVaccinations;

--View Table

SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
,SUM(CONVERT(int,vac.new_vaccinations)) OVER (PARTITION BY dea.location ORDER BY dea.location,dea.date)
AS 'Count of Vaccinated'
,('Count of Vaccinated'/population)*100
FROM PortfolioProject..CovidVaccinations vac
JOIN PortfolioProject..CovidDeaths dea
	ON dea.location = vac.location
	AND dea.date = vac.date
WHERE dea.continent IS NOT NULL
ORDER BY 2,3
--JOIN CovidVaccinations & CovidDeaths on date and location aliased
--Total Pop Vs Vaccinated Per Day
--SUM(CAST(vac.new_vaccinations AS int)) OVER (PARTITION BY dea.location) can be used instead of CAST

WITH PopvsVac (continent,location,date,population,new_vaccinations,CountofVaccinated)
AS
(
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
,SUM(CONVERT(BIGINT,vac.new_vaccinations)) OVER (PARTITION BY dea.location ORDER BY dea.location,dea.date)
AS CountofVaccinated
--,(CountofVaccinated/population)*100
FROM PortfolioProject..CovidVaccinations vac
JOIN PortfolioProject..CovidDeaths dea
	ON dea.location = vac.location
	AND dea.date = vac.date
WHERE dea.continent IS NOT NULL
--ORDER BY 2,3
)

SELECT *,
(CountofVaccinated/population)*100
FROM PopvsVac

--CTE
DROP TABLE IF EXISTS #PercentPopulationVaccinated
CREATE TABLE #PercentPopulationVaccinated
(
Continent nvarchar(255),
Location nvarchar(255),
Date datetime,
Population numeric,
New_Vaccinations numeric,
CountofVaccinated numeric
)

INSERT INTO #PercentPopulationVaccinated 
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
,SUM(CAST(vac.new_vaccinations AS BIGINT)) OVER (PARTITION BY dea.location ORDER BY dea.location,dea.date)
AS CountofVaccinated
--,(CountofVaccinated/population)*100
FROM PortfolioProject..CovidVaccinations vac
JOIN PortfolioProject..CovidDeaths dea
	ON dea.location = vac.location
	AND dea.date = vac.date
--WHERE dea.continent IS NOT NULL

SELECT *,
(CountofVaccinated/population)*100
FROM #PercentPopulationVaccinated

--TEMP TABLE

CREATE VIEW PercentPopulationVaccinated AS 
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
,SUM(CAST(vac.new_vaccinations AS BIGINT)) OVER (PARTITION BY dea.location ORDER BY dea.location,dea.date)
AS CountofVaccinated
--,(CountofVaccinated/population)*100
FROM PortfolioProject..CovidVaccinations vac
JOIN PortfolioProject..CovidDeaths dea
	ON dea.location = vac.location
	AND dea.date = vac.date
WHERE dea.continent IS NOT NULL


SELECT * FROM PercentPopulationVaccinated