-- Auto-generated from schema-map-postgres.psd1 (map@mtime:2025-10-24T09:46:38Z)
-- engine: postgres
-- table:  system_errors
CREATE INDEX idx_err_level ON system_errors (level);

CREATE INDEX idx_err_time ON system_errors (created_at);

CREATE INDEX idx_err_user ON system_errors (user_id);

CREATE INDEX idx_err_ip ON system_errors (ip_hash);

CREATE INDEX idx_err_resolved ON system_errors (resolved);

CREATE INDEX idx_system_errors_last_seen ON system_errors (last_seen);
