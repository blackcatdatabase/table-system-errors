-- Auto-generated from schema-views-postgres.yaml (map@sha1:5C6FE96DC2067A978A357A1DCB8631B46C71D429)
-- engine: postgres
-- table:  system_errors

-- Contract view for [system_errors]
-- Hides stack_trace/token; adds ip_hash_hex helper.
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
  UPPER(encode(ip_hash,'hex')) AS ip_hash_hex,
  ip_hash_key_version,
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
