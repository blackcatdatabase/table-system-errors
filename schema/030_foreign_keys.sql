-- Auto-generated from schema-map.psd1 on 2025-10-21T02:32:05
-- table: system_errors
ALTER TABLE system_errors ADD CONSTRAINT fk_err_user FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE SET NULL;

ALTER TABLE system_errors ADD CONSTRAINT fk_err_resolved_by FOREIGN KEY (resolved_by) REFERENCES users(id) ON DELETE SET NULL;
