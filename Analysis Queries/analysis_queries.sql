-- Total Incidents

SELECT COUNT(*) AS total_incidents FROM crimes;

-- Top 10 crime types

SELECT crm_desc, COUNT(*) AS incidents
FROM crimes
GROUP BY crm_desc
ORDER BY incidents DESC
LIMIT 10;

-- Average victim age by crime type

SELECT crm_desc,
       COUNT(*) AS incidents,
       ROUND(AVG(vict_age), 0) AS avg_victim_age
FROM crimes
WHERE vict_age IS NOT NULL AND vict_age > 0
GROUP BY crm_desc
HAVING incidents >= 3;

-- Location repeat hotspots

SELECT LOCATION, COUNT(*) AS incidents
FROM crimes
GROUP BY LOCATION
HAVING COUNT(*) >= 2;

-- Percentage of crimes involving weapons by area

SELECT t.area_name, t.total_crimes, w.weapon_crimes, ROUND(100 * w.weapon_crimes / t.total_crimes, 1) AS weapon_pct
FROM ( SELECT area_name, COUNT(*) AS total_crimes FROM crimes GROUP BY area_name ) t
JOIN ( SELECT area_name, COUNT(*) AS weapon_crimes
FROM crimes WHERE weapon_used_cd IS NOT NULL GROUP BY area_name ) w ON t.area_name = w.area_name
ORDER BY weapon_pct DESC;

-- Are the same locations involved in multiple incidents?

SELECT c1.LOCATION, COUNT(*) AS incident_pairs
FROM crimes c1
JOIN crimes c2 ON c1.LOCATION = c2.LOCATION AND c1.DR_NO <> c2.DR_NO
GROUP BY c1.LOCATION
HAVING incident_pairs > 2
ORDER BY incident_pairs DESC;

-- To find the percentage of crimes in each area involved a weapon?

SELECT
  t.area_name,
  t.total_crimes,
  w.weapon_crimes,
  ROUND(100 * w.weapon_crimes / t.total_crimes, 1) AS weapon_pct
FROM (
  SELECT area_name, COUNT(*) AS total_crimes
  FROM crimes
  GROUP BY area_name
) t
JOIN (
  SELECT area_name, COUNT(*) AS weapon_crimes
  FROM crimes
  WHERE weapon_used_cd IS NOT NULL
  GROUP BY area_name
) w
ON t.area_name = w.area_name
ORDER BY weapon_pct DESC;






