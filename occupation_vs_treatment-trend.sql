SELECT
  DENSE_RANK() OVER (
    ORDER BY SUM(CASE WHEN NOT treatment THEN 1 ELSE 0 END) / COUNT(*) DESC
  ) AS treatment_ord,
  Occupation,
  SUM(CASE WHEN treatment THEN 1 ELSE 0 END) AS num_treatment,
  SUM(CASE WHEN NOT treatment THEN 1 ELSE 0 END) AS num_notreatment,
  ROUND(
      SUM(CASE WHEN treatment THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
    2
    ) AS treatment_percentage,
FROM `stellar-cipher-490617-m9.mental_health.mental_health_data`
WHERE
  Country = 'United States'
GROUP BY Occupation
