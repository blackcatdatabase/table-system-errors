-- Auto-generated from schema-map-mysql.yaml (map@sha1:7AAC4013A2623AC60C658C9BF8458EFE0C7AB741)
-- engine: mysql
-- table:  system_errors

CREATE INDEX idx_system_errors_last_seen ON system_errors (last_seen);
