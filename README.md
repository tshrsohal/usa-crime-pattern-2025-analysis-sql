# Crime Pattern Analysis using SQL (2025 US Data)

## Project Overview
This project analyzes 2025 U.S. crime data using SQL to identify crime trends, repeat locations, victim demographics, and weapon-related risk patterns. The goal is to demonstrate beginner-to-intermediate SQL skills applied to a real-world public safety dataset.

## Objectives
- Analyze overall crime volume
- Identify the most common crime types
- Detect repeat crime locations (hotspots)
- Examine victim age patterns by crime type
- Compare weapon involvement across areas

## Dataset
- Publicly available U.S. crime dataset (2025)

- Contains incident-level data including crime type, location, time, victim demographics, and weapon usage

> Raw CSV is not included in this repository. The project focuses on SQL-based data preparation and analysis.

## Database Design
- `crimes_raw`: Stores raw imported CSV data
- `crimes`: Cleaned and transformed table for analysis

Key transformations:
- Parsed date and time fields
- Converted numeric time codes into SQL TIME format
- Standardized missing values using NULL
- Created analysis-ready fields

## Key Questions Answered
1. How many total crime incidents are recorded?
2. What are the most frequent crime types?
3. Do victim age patterns differ by crime type?
4. Are there repeat crime locations?
5. Which areas have higher weapon involvement?

## Skills Demonstrated
- SQL data cleaning and transformation
- Aggregations (COUNT, AVG)
- GROUP BY and HAVING
- JOINs and self-joins
- Analytical problem solving

## Tools Used
- MySQL
- MySQL Workbench
- GitHub
