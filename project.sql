
-- Cleaning the data activity table by changing the data types and storing them in a newly created table so that it can be used in analysis



IF EXISTS (SELECT*
           FROM Bellabeat.dbo.daily_activity_cleaned)

DROP TABLE Bellabeat.dbo.daily_activity_cleaned;

CREATE TABLE Bellabeat.dbo.daily_activity_cleaned
(Id FLOAT, ActivityDate DATETIME, TotalSteps INT, TotalDistance FLOAT, VeryActiveDistance Float, ModeratelyActiveDistance FLOAT, 
LightActiveDistance FLOAT, SedentaryActiveDistance  FLOAT, VeryActiveMinutes INT, FairlyActiveMinutes INT, LightlyActiveMinutes INT, 
SedentaryMinutes INT, Calories FLOAT);


INSERT INTO Bellabeat.dbo.daily_activity_cleaned
(Id, ActivityDate, TotalSteps, TotalDistance, VeryActiveDistance, ModeratelyActiveDistance , LightActiveDistance, SedentaryActiveDistance, 
VeryActiveMinutes, FairlyActiveMinutes, LightlyActiveMinutes, SedentaryMinutes, Calories)
SELECT
 Id,
 CAST (ActivityDate AS DATETIME) AS ActivityDate,
 TotalSteps,
 CAST(TotalDistance AS FLOAT) AS TotalDistance,
 CAST(VeryActiveDistance AS FlOAT) AS VeryActiveDistance,
 CAST(ModeratelyActiveDistance AS FLOAT) AS ModeratelyActiveDistance,
 CAST(LightActiveDistance AS FLOAT) AS LightActiveDistance,
 CAST(SedentaryActiveDistance AS FLOAT) AS SedentaryActiveDistance,
 VeryActiveMinutes,
 FairlyActiveMinutes,
 LightlyActiveMinutes,
 SedentaryMinutes,
 Calories
FROM
 Bellabeat.dbo.daily_activity ;


 select * from Bellabeat.dbo.daily_activity_cleaned ;




 -- calculating the number of users tracking their physical activity and the averages

SELECT
 
 COUNT(DISTINCT Id) AS num_of_users,
 ROUNd(AVG(TotalSteps),2) AS avg_steps,
 ROUND(AVG(TotalDistance),2) AS avg_distance,
 ROUND(AVG(Calories),2) AS avg_calories_burned
 
FROM
 Bellabeat.dbo.daily_activity_cleaned



-- calculating the number of users tracking their heart rate and the averages

SELECT
 COUNT(DISTINCT Id) As number_of_users,
 AVG(Value) AS avg_heartrate,
 MAX(Value) AS max_heartrate,
 MIN(Value) AS min_heartrate
 
FROM
 Bellabeat.dbo.heartrate_seconds


-- calculating number of users tracking their sleep

SELECT
 COUNT(DISTINCT Id) AS users_tracking_sleep,
 ROUND(AVG(TotalMinutesAsleep)/60.0,2) AS avg_hours_sleep,
 ROUND(AVG(TotalTimeInBed)/60.0,2) AS avg_time_in_bed, 
 ROUND(MAX(TotalMinutesAsleep)/60.0,2) AS max_hours_asleep,
 ROUND(Min(TotalMinutesAsleep)/60.0,2) AS min_hours_asleep

FROM
 Bellabeat.dbo.sleep_day

 -- calculating number of users tracking their weight

 Select
  COUNT(DISTINCT Id) AS Users_tracking_weight,
  ROUND(AVG(WeightKg),2) AS avg_weight,
  ROUND(MAX(WeightKg),2) AS max_weight,
  ROUND(MIN(WeightKg),2) AS min_weight
FROM
 Bellabeat.dbo.weight_cleaned
 

 -- Cleaning the hourly activity table for the purpose of visualization


IF EXISTS (SELECT*
            FROM Bellabeat.dbo.hourly_activity_cleaned)

DROP TABLE Bellabeat.dbo.hourly_activity_cleaned;

 CREATE TABLE Bellabeat.dbo.hourly_activity_cleaned
 (Id FLOAT, ActivityHour DATETIME, StepTotal FLOAT, Calories Float, 
 TotalIntensity FLOAT, AverageIntensity FLOAT);  

 
 INSERT INTO Bellabeat.dbo.hourly_activity_cleaned
 (Id, ActivityHour, StepTotal, Calories, TotalIntensity, AverageIntensity)
 SELECT
  Id,
  CAST(ActivityHour AS DATETIME) AS ActivityHour,
  StepTotal,
  Calories,
  TotalIntensity,
  CAST(AverageIntensity AS FLOAT) AS AverageIntensity

FROM
 Bellabeat.dbo.hourly_activity;


SELECT*

FROM Bellabeat.dbo.hourly_activity_cleaned;
