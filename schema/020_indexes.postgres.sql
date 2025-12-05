-- Auto-generated from schema-map-postgres.yaml (map@sha1:F0EE237771FBA8DD7C4E886FF276F91A862C3718)
-- engine: postgres
-- table:  system_errors

CREATE INDEX IF NOT EXISTS idx_err_level ON system_errors (level);

CREATE INDEX IF NOT EXISTS idx_err_time ON system_errors (created_at);

CREATE INDEX IF NOT EXISTS idx_err_user ON system_errors (user_id);

CREATE INDEX IF NOT EXISTS idx_err_ip ON system_errors (ip_hash);

CREATE INDEX IF NOT EXISTS idx_err_resolved ON system_errors (resolved);

CREATE INDEX IF NOT EXISTS idx_system_errors_last_seen ON system_errors (last_seen);

CREATE INDEX IF NOT EXISTS gin_system_errors_ctx    ON system_errors USING GIN (context jsonb_path_ops);
