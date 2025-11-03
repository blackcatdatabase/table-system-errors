-- Auto-generated from schema-map-postgres.psd1 (map@9d3471b)
-- engine: postgres
-- table:  system_errors
ALTER TABLE system_errors ADD CONSTRAINT fk_err_user FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE SET NULL;

ALTER TABLE system_errors ADD CONSTRAINT fk_err_resolved_by FOREIGN KEY (resolved_by) REFERENCES users(id) ON DELETE SET NULL;
