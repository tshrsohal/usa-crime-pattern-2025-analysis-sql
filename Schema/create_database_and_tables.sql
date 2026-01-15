DROP TABLE IF EXISTS crimes_raw;

CREATE TABLE crimes_raw (
  DR_NO BIGINT PRIMARY KEY,
  `Date Rptd` VARCHAR(50),
  `DATE OCC` VARCHAR(50),
  `TIME OCC` INT,
  AREA INT,
  `AREA NAME` VARCHAR(100),
  `Rpt Dist No` INT,
  `Part 1-2` INT,
  `Crm Cd` INT,
  `Crm Cd Desc` VARCHAR(255),
  Mocodes VARCHAR(255),
  `Vict Age` INT,
  `Vict Sex` VARCHAR(10),
  `Vict Descent` VARCHAR(10),
  `Premis Cd` INT,
  `Premis Desc` VARCHAR(255),
  `Weapon Used Cd` VARCHAR(20) NULL,
  `Weapon Desc` VARCHAR(255),
  Status VARCHAR(10),
  `Status Desc` VARCHAR(100),
  `Crm Cd 1` INT,
  `Crm Cd 2` VARCHAR(20) NULL,
  `Crm Cd 3` VARCHAR(20) NULL,
  `Crm Cd 4` VARCHAR(20) NULL,
  LOCATION VARCHAR(255),
  `Cross Street` VARCHAR(255),
  LAT DECIMAL(10,6),
  LON DECIMAL(10,6)
);

-- To create a cleaned table

CREATE TABLE crimes AS
SELECT
  DR_NO,

  STR_TO_DATE(`Date Rptd`, '%m/%d/%Y %h:%i:%s %p') AS date_reported,
  STR_TO_DATE(`DATE OCC`,  '%m/%d/%Y %h:%i:%s %p') AS date_occ,

  `TIME OCC` AS time_occ_num,
  MAKETIME(FLOOR(`TIME OCC`/100), MOD(`TIME OCC`,100), 0) AS time_occ,

  AREA,
  `AREA NAME` AS area_name,

  `Crm Cd` AS crm_cd,
  `Crm Cd Desc` AS crm_desc,

  CAST(NULLIF(`Crm Cd 2`, '') AS UNSIGNED) AS crm_cd_2,
  CAST(NULLIF(`Crm Cd 3`, '') AS UNSIGNED) AS crm_cd_3,
  CAST(NULLIF(`Crm Cd 4`, '') AS UNSIGNED) AS crm_cd_4,

  CAST(NULLIF(`Weapon Used Cd`, '') AS UNSIGNED) AS weapon_used_cd,
  `Weapon Desc` AS weapon_desc,

  `Vict Age` AS vict_age,
  NULLIF(`Vict Sex`, '') AS vict_sex,
  NULLIF(`Vict Descent`, '') AS vict_descent,

  `Premis Cd` AS premis_cd,
  `Premis Desc` AS premis_desc,

  Status,
  `Status Desc` AS status_desc,
  LOCATION,
  `Cross Street` AS cross_street,
  LAT,
  LON

FROM crimes_raw;