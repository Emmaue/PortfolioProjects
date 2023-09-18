SELECT *
FROM PortifolioProject..[Tech Jobs on Linkedln]

--Total number of companies
SELECT DISTINCT COUNT (company_id) as NumberOfCompanies
FROM PortifolioProject..[Tech Jobs on Linkedln];


--Triming unwanted space
UPDATE [Tech Jobs on Linkedln]
SET [Employment type] = TRIM([Employment type]),
	Industries = TRIM(Industries),
	[Job function] = TRIM([Job function]),
	[Seniority level] = TRIM([Seniority level]),
	company = TRIM(company),
	company_id = TRIM(CAST (company_id AS nvarchar)),
	context = TRIM(context),
	date = TRIM(date),
	description = TRIM(description),
	education = TRIM(education),
	location = TRIM(location),
	months_experience = TRIM(CAST (months_experience AS nvarchar)),
	post_id = TRIM(CAST (post_id AS nvarchar)),
	post_url = TRIM(post_url),
	sal_high = TRIM(CAST (sal_low AS nvarchar)),
	sal_low = TRIM(CAST (sal_low AS nvarchar)),
	salary = TRIM(salary),
	title = TRIM(title)
SELECT *
FROM PortifolioProject..[Tech Jobs on Linkedln]

 --Checking for null values
SELECT 'Employment Type' AS COLUMNAME,  COUNT (*) AS NULLCOUNT
FROM PortifolioProject..[Tech Jobs on Linkedln]
WHERE  [Employment type] IS NULL
UNION
SELECT 'Industries' AS COLUMNAME,  COUNT (*) AS NULLCOUNT
FROM PortifolioProject..[Tech Jobs on Linkedln]
WHERE  Industries IS NULL
UNION
SELECT 'Job function' AS COLUMNAME,  COUNT (*) AS NULLCOUNT
FROM PortifolioProject..[Tech Jobs on Linkedln]
WHERE  [Job function] IS NULL
UNION
SELECT 'Seniority level' AS COLUMNAME,  COUNT (*) AS NULLCOUNT
FROM PortifolioProject..[Tech Jobs on Linkedln]
WHERE  [Seniority level] IS NULL
UNION
SELECT 'Company' AS COLUMNAME,  COUNT (*) AS NULLCOUNT
FROM PortifolioProject..[Tech Jobs on Linkedln]
WHERE  company IS NULL
UNION
SELECT 'Company_id' AS COLUMNAME,  COUNT (*) AS NULLCOUNT
FROM PortifolioProject..[Tech Jobs on Linkedln]
WHERE  Company_id IS NULL
UNION
SELECT 'Context' AS COLUMNAME,  COUNT (*) AS NULLCOUNT
FROM PortifolioProject..[Tech Jobs on Linkedln]
WHERE  context IS NULL
UNION
SELECT 'Date' AS COLUMNAME,  COUNT (*) AS NULLCOUNT
FROM PortifolioProject..[Tech Jobs on Linkedln]
WHERE  date IS NULL
UNION
SELECT 'Description' AS COLUMNAME,  COUNT (*) AS NULLCOUNT
FROM PortifolioProject..[Tech Jobs on Linkedln]
WHERE  description IS NULL
UNION
SELECT 'Education' AS COLUMNAME,  COUNT (*) AS NULLCOUNT
FROM PortifolioProject..[Tech Jobs on Linkedln]
WHERE  education IS NULL
UNION
SELECT 'Location' AS COLUMNAME,  COUNT (*) AS NULLCOUNT
FROM PortifolioProject..[Tech Jobs on Linkedln]
WHERE  location IS NULL
UNION
SELECT 'Months_experience' AS COLUMNAME,  COUNT (*) AS NULLCOUNT
FROM PortifolioProject..[Tech Jobs on Linkedln]
WHERE  months_experience IS NULL
UNION
SELECT 'Post_id' AS COLUMNAME,  COUNT (*) AS NULLCOUNT
FROM PortifolioProject..[Tech Jobs on Linkedln]
WHERE  post_id IS NULL
UNION
SELECT 'Post_url' AS COLUMNAME,  COUNT (*) AS NULLCOUNT
FROM PortifolioProject..[Tech Jobs on Linkedln]
WHERE  post_url IS NULL
UNION
SELECT 'Sal_high' AS COLUMNAME,  COUNT (*) AS NULLCOUNT
FROM PortifolioProject..[Tech Jobs on Linkedln]
WHERE  sal_high IS NULL
UNION
SELECT 'Sal_low' AS COLUMNAME,  COUNT (*) AS NULLCOUNT
FROM PortifolioProject..[Tech Jobs on Linkedln]
WHERE  sal_low IS NULL
UNION
SELECT 'Salary' AS COLUMNAME,  COUNT (*) AS NULLCOUNT
FROM PortifolioProject..[Tech Jobs on Linkedln]
WHERE  salary IS NULL
UNION
SELECT 'Title' AS COLUMNAME,  COUNT (*) AS NULLCOUNT
FROM PortifolioProject..[Tech Jobs on Linkedln]
WHERE  title IS NULL;


--Replacing Null values
UPDATE [Tech Jobs on Linkedln]
SET Industries = ISNULL(NULL,'No Industires')
WHERE Industries IS NULL;
UPDATE [Tech Jobs on Linkedln]
SET [Employment type] = ISNULL(NULL,'No Employment type')
WHERE [Employment type] IS NULL;
UPDATE [Tech Jobs on Linkedln]
SET [Job function] = ISNULL(NULL,'No Job function')
WHERE [Job function] IS NULL;
UPDATE [Tech Jobs on Linkedln]
SET [Seniority level] = ISNULL(NULL,'No Level listed')
WHERE [Seniority level] IS NULL;
UPDATE [Tech Jobs on Linkedln]
SET company = ISNULL(NULL,'No company')
WHERE company IS NULL;
UPDATE [Tech Jobs on Linkedln]
SET company_id = ISNULL(NULL,0)
WHERE company_id  IS NULL;
UPDATE [Tech Jobs on Linkedln]
SET context = ISNULL(NULL,'No Context')
WHERE context IS NULL;
UPDATE [Tech Jobs on Linkedln]
SET date = ISNULL(NULL,'No date')
WHERE date IS NULL
UPDATE [Tech Jobs on Linkedln]
SET description = ISNULL(NULL,'No job description')
WHERE description IS NULL;
UPDATE [Tech Jobs on Linkedln]
SET education = ISNULL(NULL,'No education')
WHERE education IS NULL;
UPDATE [Tech Jobs on Linkedln]
SET location = ISNULL(NULL,'No location listed')
WHERE location IS NULL;
UPDATE [Tech Jobs on Linkedln]
SET months_experience = ISNULL(NULL,0)
WHERE months_experience IS NULL;
--UPDATE [Tech Jobs on Linkedln]
--SET post_id = ISNULL(NULL,'No post_Id')
--WHERE post_id IS NULL
UPDATE [Tech Jobs on Linkedln]
SET post_url = ISNULL(NULL,'No post_Url')
WHERE post_url IS NULL;
UPDATE [Tech Jobs on Linkedln]
SET sal_high = ISNULL(NULL, 0)
WHERE sal_high IS NULL;
UPDATE [Tech Jobs on Linkedln]
SET sal_low = ISNULL(NULL,0)
WHERE sal_low IS NULL;
UPDATE [Tech Jobs on Linkedln]
SET salary = ISNULL(NULL, 0)
WHERE salary IS NULL
UPDATE [Tech Jobs on Linkedln]
SET title = ISNULL(NULL,'No title listed')
WHERE title IS NULL

SELECT *
FROM PortifolioProject..[Tech Jobs on Linkedln]

--checking for empty values
SELECT *
FROM PortifolioProject..[Tech Jobs on Linkedln]
WHERE [Employment type] = ' '
OR Industries = ' '
OR [Job function] = ' '
OR [Seniority level] = ' '
OR company = ' '
OR company_id = ' '
OR context = ' '
OR date = ' '
OR description = ' '
OR education = ''
OR location = ' '
OR months_experience = ' '
OR post_id = ' '
OR post_url = ' '
OR sal_high = ' '
OR sal_low = ' '
OR salary = ' '
OR title = ' ';

--Checking for duplicate rows
SELECT DISTINCT Company_ID, COUNT (Company_ID) AS Duplicate_count
FROM PortifolioProject..[Tech Jobs on Linkedln]
GROUP BY company_id
HAVING COUNT (Company_ID) > 1

--Removing duplicate rows
WITH dupcte AS(
SELECT *, ROW_NUMBER() OVER (PARTITION BY Company_ID ORDER BY Company_ID) duplicatedValues
FROM PortifolioProject..[Tech Jobs on Linkedln])

delete 
FROM dupcte
where duplicatedValues > 1;

--Removing unused column
ALTER TABLE PortifolioProject..[Tech Jobs on Linkedln]
DROP COLUMN F2

SELECT *
FROM PortifolioProject..[Tech Jobs on Linkedln]










