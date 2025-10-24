-- Auto-generated from schema-views-postgres.psd1 (map@mtime:2025-10-24T09:45:40Z)
-- engine: postgres
-- table:  system_errors
-- Contract view for [system_errors]
-- Hides stack_trace and token; safe for dashboards and triage.
CREATE OR REPLACE VIEW vw_system_errors AS
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
  ip_hash_key_version,
  ip_text,
  ip_bin,
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
