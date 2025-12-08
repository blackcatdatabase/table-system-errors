-- Auto-generated from schema-map-postgres.yaml (map@sha1:6D9B52237D942B2B3855FD0F5500331B935A7C62)
-- engine: postgres
-- table:  system_errors

ALTER TABLE system_errors ADD CONSTRAINT fk_err_user FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE SET NULL;

ALTER TABLE system_errors ADD CONSTRAINT fk_err_resolved_by FOREIGN KEY (resolved_by) REFERENCES users(id) ON DELETE SET NULL;
