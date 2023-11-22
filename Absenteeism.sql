---Create a join table 
SELECT * 
FROM Absenteeism_at_work a
LEFT JOIN dbo.compensation b
ON a.ID = b.ID
LEFT JOIN Reasons r
ON a.Reason_for_absence = r.Number;

--find the healthiest employee for the bonus

SELECT * 
FROM Absenteeism_at_work 
WHERE Social_drinker = 0 AND Social_drinker = 0
AND Body_mass_index < 25 AND 
Absenteeism_time_in_hours < (SELECT AVG(Absenteeism_time_in_hours)from Absenteeism_at_work);

--compensation rate for non-smokers/budget $983.221. So .66 increase per hour/ $1,414 per year
SELECT COUNT(*) AS Nonsmokers
FROM Absenteeism_at_work
WHERE Social_smoker = 0;


----Optimizing query for visual purposes
SELECT 
a.ID,
R.Reason,
month_of_absence,
Body_mass_index,
Day_of_the_week,
disciplinary_failure,
age,
work_load_average_day,
Absenteeism_time_in_hours,
pet,
son,
social_drinker,
social_smoker,
CASE WHEN month_of_absence IN (12,1,2) THEN 'Winter'
WHEN month_of_absence IN (3,4,5) THEN 'Spring'
WHEN month_of_absence IN (6,7,8) THEN 'Summer'
WHEN month_of_absence IN (9,10,11) THEN 'Fall'
ELSE 'Unkown' END as Saeaon_names
FROM Absenteeism_at_work a
LEFT JOIN dbo.compensation b
ON a.ID = b.ID
LEFT JOIN Reasons r
ON a.Reason_for_absence = r.Number;




