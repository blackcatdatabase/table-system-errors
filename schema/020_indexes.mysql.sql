-- Auto-generated from schema-map-mysql.yaml (map@sha1:5E62933580349BE7C623D119AC9D1301A62F03EF)
-- engine: mysql
-- table:  system_errors

CREATE INDEX idx_system_errors_last_seen ON system_errors (last_seen);
