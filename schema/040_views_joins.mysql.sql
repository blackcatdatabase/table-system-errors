-- Auto-generated from joins-mysql.yaml (map@94ebe6c)
-- engine: mysql
-- view:   system_errors_daily

CREATE OR REPLACE ALGORITHM=TEMPTABLE SQL SECURITY INVOKER VIEW vw_system_errors_daily AS
SELECT
  DATE(created_at) AS day,
  level,
  COUNT(*) AS count
FROM system_errors
GROUP BY DATE(created_at), level
ORDER BY day DESC, level;

-- Auto-generated from joins-mysql.yaml (map@94ebe6c)
-- engine: mysql
-- view:   system_errors_top_fingerprints

CREATE OR REPLACE ALGORITHM=TEMPTABLE SQL SECURITY INVOKER VIEW vw_system_errors_top_fingerprints AS
SELECT
  fingerprint,
  MAX(message) AS sample_message,
  SUM(occurrences) AS occurrences,
  MIN(created_at) AS first_seen,
  MAX(last_seen)  AS last_seen,
  MAX(CASE WHEN resolved THEN 1 ELSE 0 END) AS any_resolved,
  COUNT(*) AS rows_count
FROM system_errors
GROUP BY fingerprint
ORDER BY occurrences DESC, last_seen DESC;

