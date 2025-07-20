
-- SQL Data Exploration Project: HIV/AIDS Dataset

-- Step 1: Create Database
CREATE DATABASE HIV_AIDS_Analysis;
GO

-- Step 2: Use Database
USE HIV_AIDS_Analysis;
GO

-- Step 3: Create Table
CREATE TABLE HIV_AIDS_Stats (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Country NVARCHAR(100),
    Region NVARCHAR(100),
    Year INT,
    Gender NVARCHAR(10),
    Cases INT,
    Deaths INT
);
GO

-- Step 4: Insert Sample Data
INSERT INTO HIV_AIDS_Stats (Country, Region, Year, Gender, Cases, Deaths)
VALUES
('Ethiopia', 'Africa', 2020, 'Male', 12000, 4500),
('Ethiopia', 'Africa', 2020, 'Female', 14000, 5000),
('Nigeria', 'Africa', 2020, 'Male', 18000, 7000),
('USA', 'Americas', 2020, 'Male', 15000, 4000),
('USA', 'Americas', 2021, 'Female', 12000, 3500),
('South Africa', 'Africa', 2021, 'Male', 25000, 10000),
('South Africa', 'Africa', 2021, 'Female', 27000, 11000);
GO

-- Step 5: Data Exploration Queries

-- 1. Total Cases and Deaths per Year
SELECT Year, 
       SUM(Cases) AS Total_Cases, 
       SUM(Deaths) AS Total_Deaths
FROM HIV_AIDS_Stats
GROUP BY Year
ORDER BY Year;
GO

-- 2. Yearly Trend by Country
SELECT Country, Year, SUM(Cases) AS Cases, SUM(Deaths) AS Deaths
FROM HIV_AIDS_Stats
GROUP BY Country, Year
ORDER BY Country, Year;
GO

-- 3. Death Rate per Country
SELECT Country,
       SUM(Cases) AS Total_Cases,
       SUM(Deaths) AS Total_Deaths,
       ROUND(100.0 * SUM(Deaths) / NULLIF(SUM(Cases), 0), 2) AS Death_Rate_Percent
FROM HIV_AIDS_Stats
GROUP BY Country
ORDER BY Death_Rate_Percent DESC;
GO

-- 4. Gender Distribution
SELECT Gender,
       SUM(Cases) AS Total_Cases,
       SUM(Deaths) AS Total_Deaths
FROM HIV_AIDS_Stats
GROUP BY Gender;
GO

-- 5. Regional Summary
SELECT Region,
       SUM(Cases) AS Region_Cases,
       SUM(Deaths) AS Region_Deaths
FROM HIV_AIDS_Stats
GROUP BY Region
ORDER BY Region_Cases DESC;
GO
