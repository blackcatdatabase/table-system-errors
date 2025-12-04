-- Auto-generated from schema-map-mysql.yaml (map@4ae85c5)
-- engine: mysql
-- table:  system_errors

CREATE INDEX idx_system_errors_last_seen ON system_errors (last_seen);
