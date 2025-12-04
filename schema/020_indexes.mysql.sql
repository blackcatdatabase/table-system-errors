-- Auto-generated from schema-map-mysql.yaml (map@74ce4f4)
-- engine: mysql
-- table:  system_errors

CREATE INDEX idx_system_errors_last_seen ON system_errors (last_seen);
