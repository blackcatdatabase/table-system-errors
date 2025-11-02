-- Auto-generated from schema-views-postgres.psd1 (map@db2f8b8)
-- engine: postgres
-- table:  system_errors
-- Contract view for [system_errors]
-- Hides stack_trace/token; adds hex helpers and ip_pretty (from inet).
CREATE OR REPLACE VIEW vw_system_errors AS
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
  UPPER(encode(ip_hash,'hex'))::char(32) AS ip_hash_hex,
  ip_hash_key_version,
  ip_text,
  COALESCE(NULLIF(ip_text,''), bc_compat.inet6_ntoa(ip_bin))::varchar(39) AS ip_pretty,
  ip_bin,
  UPPER(encode(ip_bin,'hex'))::char(32) AS ip_bin_hex,
  user_agent,
  url,
  method,
  http_status,
  resolved,
  resolved_by,
  resolved_at,
  created_at,
  last_seen
FROM system_errors;
