SELECT  location, date, total_cases, total_deaths, CONCAT ((ROUND (CAST (total_deaths as float) / (total_cases),4)*100),'%') AS DeathPercentage
FROM PortifolioProject..CovidDeaths
WHERE location LIKE '%NIGERIA%'
ORDER BY 1,2;


SELECT  location, population, total_cases, CONCAT ((ROUND ((total_cases) / (population),4)*100),'%') AS AffectedPercentagePopulation
FROM PortifolioProject..CovidDeaths
WHERE location LIKE '%United states%'
ORDER BY 1,2;


SELECT location, population, MAX (total_cases) AS HighestInfectedCount, CONCAT ((ROUND (MAX (Total_cases) / (population),4 )* 100),'%') AS CountriesInfectionPercentage
FROM PortifolioProject..CovidDeaths
--WHERE location IS NOT NULL
WHERE continent IS NOT NULL
GROUP BY location, population
ORDER BY CountriesInfectionPercentage DESC;  

SELECT location, MAX(CAST (total_deaths AS int)) AS TotalDeathCount
FROM PortifolioProject..CovidDeaths
WHERE continent IS NULL
GROUP BY location
ORDER BY TotalDeathCount DESC;


SELECT continent, MAX(CAST (total_deaths AS int)) AS TotalDeathCount
FROM PortifolioProject..CovidDeaths
WHERE continent IS NOT NULL
GROUP BY continent
ORDER BY TotalDeathCount DESC;



SELECT date, SUM (new_cases) as total_cases, SUM (CAST(new_deaths as int)) as total_deaths,
CASE
	WHEN SUM(new_cases) = 0 THEN NULL
	WHEN SUM(new_deaths) = 0 THEN NULL
	ELSE CONCAT ((ROUND (SUM (CAST(new_deaths as int))/ SUM(New_Cases),4)* 100),'%') 
	END as DeathPercentage
FROM PortifolioProject..CovidDeaths
WHERE continent IS NOT NULL
GROUP BY date
ORDER BY 1,2;

 


 
SELECT SUM (new_cases) as total_cases, SUM (CAST(new_deaths as int)) as total_deaths,
CASE
	WHEN SUM(new_cases) = 0 THEN NULL
	WHEN SUM(new_deaths) = 0 THEN NULL
	ELSE CONCAT ((ROUND (SUM (CAST(new_deaths as int))/ SUM(New_Cases),4)* 100),'%') 
	END as DeathPercentage
FROM PortifolioProject..CovidDeaths
WHERE continent IS NOT NULL
ORDER BY 1,2;

 


WITH PopvsVac(continent,location, date, population, new_vaccinations, TotalVaccinations)
as
(
SELECT dea.continent, dea.location, dea.date,dea.population, vac.new_vaccinations,
SUM (CONVERT(float, vac.new_vaccinations)) OVER(Partition by dea.location order by dea.location, dea.date) TotalVaccinations
FROM PortifolioProject..CovidDeaths dea
JOIN PortifolioProject..CovidVaccinations vac
ON dea.location = vac.location and dea.date = vac.date
WHERE dea.continent is not null
)

SELECT *, CONCAT((ROUND ((TotalVaccinations)/(population),4)*100),'%') PercentageOfVaccinatedPopulation
FROM PopvsVac


CREATE TABLE #PercentagePopulationVaccinated
(
continent nvarchar(255),
location nvarchar(255),
date datetime,
population numeric,
new_vaccinations numeric,
TotalVaccinations numeric
)

INSERT INTO #PercentagePopulationVaccinated
SELECT dea.continent, dea.location, dea.date,dea.population, vac.new_vaccinations,
SUM (CONVERT(float, vac.new_vaccinations)) OVER(Partition by dea.location order by dea.location, dea.date) TotalVaccinations
FROM PortifolioProject..CovidDeaths dea
JOIN PortifolioProject..CovidVaccinations vac
ON dea.location = vac.location and dea.date = vac.date
WHERE dea.continent is not null

SELECT *, CONCAT((ROUND ((TotalVaccinations)/(population),4)*100),'%') PercentageOfVaccinatedPopulation
FROM  #PercentagePopulationVaccinated


 
DROP TABLE if exists  #PercentagePopulationVaccinated
CREATE TABLE #PercentagePopulationVaccinated
(
continent nvarchar(255),
location nvarchar(255),
date datetime,
population numeric,
new_vaccinations numeric,
TotalVaccinations numeric
)

INSERT INTO #PercentagePopulationVaccinated
SELECT dea.continent, dea.location, dea.date,dea.population, vac.new_vaccinations,
SUM (CONVERT(float, vac.new_vaccinations)) OVER(Partition by dea.location order by dea.location, dea.date) TotalVaccinations
FROM PortifolioProject..CovidDeaths dea
JOIN PortifolioProject..CovidVaccinations vac
ON dea.location = vac.location and dea.date = vac.date
WHERE dea.continent is not null

SELECT *, CONCAT((ROUND ((TotalVaccinations)/(population),4)*100),'%') PercentageOfVaccinatedPopulation
FROM  #PercentagePopulationVaccinated


 