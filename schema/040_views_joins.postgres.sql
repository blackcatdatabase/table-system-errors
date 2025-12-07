-- Auto-generated from joins-postgres.yaml (map@sha1:29CF395A3A4C8964482083733F8E613ABFBEF5CC)
-- engine: postgres
-- view:   system_errors_top_fingerprints

-- Top fingerprints by total occurrences
CREATE OR REPLACE VIEW vw_system_errors_top_fingerprints AS
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
