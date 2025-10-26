-- Auto-generated from schema-views-mysql.psd1 (map@38d5403)
-- engine: mysql
-- table:  system_errors
-- Contract view for [system_errors]
-- Hides stack_trace and token; adds HEX/ip_pretty helpers.
CREATE OR REPLACE SQL SECURITY INVOKER VIEW vw_system_errors AS
SELECT
  id,
  level,
  message,
  exception_class,
  file,
  line,
  fingerprint,
  occurrences,
  user_id,
  ip_hash,
  HEX(ip_hash) AS ip_hash_hex,
  ip_hash_key_version,
  ip_text,
  ip_bin,
  HEX(ip_bin) AS ip_bin_hex,
  COALESCE(ip_text, INET6_NTOA(ip_bin)) AS ip_pretty,
  user_agent,
  url,
  method,
  http_status,
  resolved,
  resolved_by,
  resolved_at,
  created_at,
  last_seen,
  context
FROM system_errors;
