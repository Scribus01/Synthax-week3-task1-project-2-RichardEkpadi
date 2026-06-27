CREATE TABLE hr_employee (
    EmployeeID INT,
	Age INT,
	Gender VARCHAR(20),
	Department VARCHAR(100),
	JobRole VARCHAR(100),
	MonthlyIncome INT,
	YearsAtCompany INT,
	DistanceFromHome INT,
	OverTime VARCHAR(10),
	MartialStatus VARCHAR(20),
	EducationField VARCHAR(50),
	JobStatisfaction INT,
	EnvironmentStatiafaction INT,
	Attrition VARCHAR (10)
);
SELECT *
FROM hr_employee
LIMIT 10;
SELECT COUNT(*) AS total_employees
FROM hr_employee;
SELECT ROUND(AVG(MonthlyIncome),2) AS avg_salary
FROM hr_employee;
SELECT ROUND(AVG(YearsAtCompany),2) AS avg_tenure
FROM hr_employee;
SELECT 
Gender,
COUNT(*) AS emplyees
FROM hr_employee
GROUP BY Gender;
SELECT COUNT(*) AS attrition_count
FROM hr_employee
WHERE Attrition = 'Yes';
SELECT 
ROUND(
COUNT(CASE WHEN Attrition='Yes' THEN 1 END)
*100.0/COUNT(*),
2
) AS attrition_rate
FROM hr_employee;
SELECT
ROUND(
COUNT(CASE WHEN Attrition='No' THEN 1 END)
*100.0/COUNT(*),
2
) AS retention_rate
FROM hr_employee;
SELECT 
Department,
COUNT(*) AS total_employees,
COUNT(CASE WHEN Attrition='Yes' THEN 1 END) AS attrition_count,
ROUND(
COUNT(CASE WHEN Attrition='Yes' THEN 1 END)
*100.0/COUNT(*),
2
) AS attrition_rate
FROM hr_employee
GROUP BY Department
ORDER BY attrition_rate DESC;
SELECT
JobRole,
COUNT(*) AS employees,
COUNT(CASE WHEN Attrition='Yes' THEN 1 END) AS attrition_count,
ROUND(
COUNT(CASE WHEN Attrition='Yes' THEN 1 END)
*100.0/COUNT(*),
2
) AS attrition_rate
FROM hr_employee
GROUP BY JobRole
ORDER BY attrition_rate DESC;
SELECT
CASE
    WHEN MonthlyIncome < 3500 THEN 'Low Income'
	WHEN MonthlyIncome BETWEEN 3500 AND 6000 THEN 'Medium Income'
	ELSE 'High Income'
END AS Income_band,
COUNT(*) AS employees,
COUNT(CASE WHEN Attrition='Yes' THEN 1 END) AS attrition_count
FROM hr_employee
GROUP BY Income_band;

SELECT
JobStatisfaction,
COUNT(*) AS employees,
COUNT(CASE WHEN Attrition='Yes' THEN 1 END) AS attrition_count,
ROUND(
COUNT(CASE WHEN Attrition='Yes' THEN 1 END)
*100.0/COUNT(*),
2
) AS attrition_rate
FROM hr_employee
GROUP BY JobStatisfaction
ORDER BY JobStatisfaction;
SELECT 
YearsAtCompany,
COUNT(*) AS employees,
COUNT(CASE WHEN Attrition='Yes' THEN 1 END) AS attrition_count
FROM hr_employee
GROUP BY YearsAtCompany
ORDER BY YearsAtCompany;
SELECT
Department,
Overtime,
ROUND(AVG(MonthlyIncome),0) AS avg_salary,
ROUND(AVG(Jobstatisfaction),2) AS avg_satisfaction,
COUNT(*) AS employees,
COUNT(CASE WHEN Attrition='Yes' THEN 1 END) AS attrition_count
FROM hr_employee
GROUP BY Department, OverTime
ORDER BY attrition_count DESC;



)