DROP TABLE IF EXISTS hospital;
CREATE TABLE hospital(
	Hospital_Name VARCHAR (100),
	Locations VARCHAR (100),
	Department VARCHAR (50),
	Doctors_Count INT ,
	Patients_Count INT ,
	Admission_Date DATE,
	Discharge_Date DATE ,
	Medical_Expenses NUMERIC(10,2)
);

SELECT * FROM hospital;

--1. Total Number of Patients
-- Write an SQL query to find the total number of patients across all hospitals.

SELECT SUM(patients_count) AS total_patients FROM hospital;

--2. Average Number of Doctors per Hospital
-- Retrieve the average count of doctors available in each hospital.

SELECT hospital_name, AVG(doctors_count) AS avg_doctors FROM hospital
GROUP BY hospital_name;

--3. Top 3 Departments with the Highest Number of Patients
-- Find the top 3 hospital departments that have the highest number of patients.

SELECT department, SUM(patients_count) as total_patients FROM hospital 
GROUP BY department
ORDER BY total_patients DESC
LIMIT 3;

--4. Hospital with the Maximum Medical Expenses
--Identify the hospital that recorded the highest medical expenses.

SELECT hospital_name, MAX(medical_expenses)AS max_expenses FROM hospital
GROUP BY hospital_name
ORDER BY max_expenses DESC
LIMIT 1;

--5. Daily Average Medical Expenses  8888888
--Calculate the average medical expenses per day for each hospital.

SELECT hospital_name,admission_date, AVG(medical_expenses) AS avg_expenses FROM hospital
GROUP BY hospital_name ,admission_date
ORDER by hospital_name;

--6. Longest Hospital Stay
-- Find the patient with the longest stay by calculating the difference between
--  Discharge Date and Admission Date.

SELECT hospital_name,admission_date,discharge_date , (discharge_date - admission_date) AS hospital_stay FROM hospital
ORDER BY hospital_stay DESC
LIMIT 1;

--7. Total Patients Treated Per City
-- Count the total number of patients treated in each city.

SELECT locations AS city , SUM(patients_count) AS total_patients FROM hospital
GROUP BY locations;

--8. Average Length of Stay Per Department
-- Calculate the average number of days patients spend in each department.

SELECT department , AVG(discharge_date - admission_date) AS avg_hospital_stay FROM hospital
GROUP BY department;

--9. Identify the Department with the Lowest Number of Patients
--Find the department with the least number of patients.

SELECT department, patients_count FROM hospital
ORDER BY patients_count
LIMIT 1;

--10. Monthly Medical Expenses Report
-- Group the data by month and calculate the total medical expenses for each month.

SELECT EXTRACT(MONTH FROM admission_date) AS months, SUM(medical_expenses) AS toatl_medical_expenses FROM hospital
GROUP BY EXTRACT(MONTH FROM admission_date) 
ORDER BY months;







