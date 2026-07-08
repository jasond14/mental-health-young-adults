SELECT
  Occupation,
  COUNT(*) AS total_people,
  SUM(CASE WHEN growing_stress = 'Yes' THEN 1 ELSE 0 END) AS yes_count,
  SUM(CASE WHEN growing_stress = 'Maybe' THEN 1 ELSE 0 END) AS maybe_count,
  SUM(CASE WHEN growing_stress = 'No' THEN 1 ELSE 0 END) AS no_count,
  ROUND(
      SUM(CASE WHEN growing_stress = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
    2
    ) AS yes_percentage,
  ROUND(
      SUM(CASE WHEN growing_stress = 'Maybe' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
      2
  ) AS maybe_percentage,
  ROUND(
      SUM(CASE WHEN growing_stress = 'No' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
      2
  ) AS no_percentage

FROM `stellar-cipher-490617-m9.mental_health.mental_health_data`
WHERE Country = 'United States'
GROUP BY Occupation
