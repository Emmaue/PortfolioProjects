SELECT *
FROM PortifolioProject..[Tech Jobs on Linkedln]

--Top 15 job titles
SELECT TOP 15(title), COUNT(title) Top15JpbTitles
FROM PortifolioProject..[Tech Jobs on Linkedln]
Group by title
ORDER BY Top15JpbTitles desc;
 
--Top 10 most active employers
SELECT TOP 5(company), COUNT(company) Top5companies
FROM PortifolioProject..[Tech Jobs on Linkedln]
Group by company
ORDER BY Top5companies desc;
 
 --Top 15 locations by job post
SELECT TOP 10(location), COUNT(location) Toplocation
FROM PortifolioProject..[Tech Jobs on Linkedln]
Group by location
ORDER BY Toplocation desc;

SELECT DISTINCT [Seniority level], AVG (Months_experience) MonthsOfExperience
FROM PortifolioProject..[Tech Jobs on Linkedln] 
WHERE [Seniority level] <> ('NO level listed') AND [seniority level] <> ('Not Applicable')
GROUP BY [Seniority level], Months_experience
ORDER BY 2 DESC;

 
 --Top 15 industies
 SELECT TOP 10(Industries), COUNT(Industries) TopIndustries
FROM PortifolioProject..[Tech Jobs on Linkedln]
WHERE Industries <> 'No Industires'
Group by Industries
ORDER BY TopIndustries desc;
