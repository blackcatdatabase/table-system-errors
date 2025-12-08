-- Auto-generated from schema-map-mysql.yaml (map@sha1:09DF9CA612D1573E058190CC207FA257C05AEC1F)
-- engine: mysql
-- table:  system_errors

CREATE INDEX idx_system_errors_last_seen ON system_errors (last_seen);
