-- Auto-generated from joins-mysql.yaml (map@sha1:DA70105A5B799F72A56FEAB71A5171F946A770D2)
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
