-- Auto-generated from schema-views-mysql.psd1 (map@62c9c93)
-- engine: mysql
-- table:  system_errors_top_fingerprints
-- Top fingerprints by total occurrences
CREATE OR REPLACE ALGORITHM=MERGE SQL SECURITY INVOKER VIEW vw_system_errors_top_fingerprints AS
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

-- Auto-generated from schema-views-mysql.psd1 (map@62c9c93)
-- engine: mysql
-- table:  system_errors_daily
-- System errors per day and level
CREATE OR REPLACE ALGORITHM=MERGE SQL SECURITY INVOKER VIEW vw_system_errors_daily AS
SELECT
  DATE(created_at) AS day,
  level,
  COUNT(*) AS count
FROM system_errors
GROUP BY DATE(created_at), level
ORDER BY day DESC, level;


-- Auto-generated from schema-views-mysql.psd1 (map@62c9c93)
-- engine: mysql
-- table:  system_errors
-- Contract view for [system_errors]
-- Hides stack_trace and token; adds HEX/ip_pretty helpers.
CREATE OR REPLACE ALGORITHM=MERGE SQL SECURITY INVOKER VIEW vw_system_errors AS
SELECT
  id,
  level,
  message,
  exception_class,
  file,
  line,
  context,
  fingerprint,
  occurrences,
  user_id,
  ip_hash,
  CAST(LPAD(HEX(ip_hash), 64, '0')  AS CHAR(64)) AS ip_hash_hex,
  ip_hash_key_version,
  ip_text,
  ip_bin,
  CAST(LPAD(HEX(ip_bin), 32, '0') AS CHAR(32)) AS ip_bin_hex,
  CAST(COALESCE(INET6_NTOA(ip_bin), ip_text) AS CHAR(39)) AS ip_pretty,
  user_agent,
  url,
  `method`,
  http_status,
  resolved,
  resolved_by,
  resolved_at,
  created_at,
  last_seen
FROM system_errors;

