# system_errors

Application error/event log with grouping and resolution.

## Columns
| Column | Type | Null | Default | Description | Crypto |
| --- | --- | --- | --- | --- | --- |
| id | BIGINT | NO |  | Surrogate primary key. |  |
| level | mysql: ENUM('notice','warning','error','critical') / postgres: TEXT | NO |  | Severity level. (enum: notice, warning, error, critical) |  |
| message | TEXT | NO |  | Error message. |  |
| exception_class | VARCHAR(255) | YES |  | Exception class name (if any). |  |
| file | VARCHAR(1024) | YES |  | Source file path. |  |
| line | mysql: INT / postgres: INTEGER | YES |  | Source line number. |  |
| stack_trace | mysql: MEDIUMTEXT / postgres: TEXT | YES |  | Long stack trace. |  |
| token | VARCHAR(255) | YES |  | Correlated token/id. |  |
| context | mysql: JSON / postgres: JSONB | YES |  | JSON context (structured). |  |
| fingerprint | VARCHAR(64) | YES |  | Deduplication fingerprint. |  |
| occurrences | mysql: INT / postgres: INTEGER | NO | 1 | Aggregate count of occurrences. |  |
| user_id | BIGINT | YES |  | Related user (optional). |  |
| ip_hash | mysql: BINARY(32) / postgres: BYTEA | YES |  | Hashed IP. | `hmac`<br/>ctx: `db.hmac.system_errors.ip_hash`<br/>kv: `ip_hash_key_version` |
| ip_hash_key_version | VARCHAR(64) | YES |  | Key version for ip_hash. | key version for: `ip_hash` |
| user_agent | VARCHAR(1024) | YES |  | User agent string. |  |
| url | VARCHAR(2048) | YES |  | Request URL. |  |
| method | VARCHAR(10) | YES |  | HTTP method. |  |
| http_status | SMALLINT | YES |  | HTTP status code. |  |
| resolved | BOOLEAN | NO | mysql: 0 / postgres: FALSE | Resolution flag. |  |
| resolved_by | BIGINT | YES |  | Resolver user id (FK users.id), optional. |  |
| resolved_at | mysql: DATETIME(6) / postgres: TIMESTAMPTZ(6) | YES |  | Resolution timestamp (UTC). |  |
| created_at | mysql: DATETIME(6) / postgres: TIMESTAMPTZ(6) | NO | CURRENT_TIMESTAMP(6) | First occurrence (UTC). |  |
| last_seen | mysql: DATETIME(6) / postgres: TIMESTAMPTZ(6) | NO | CURRENT_TIMESTAMP(6) | Most recent occurrence (UTC). |  |
| ip_bin |  | YES |  | Binary IP (if captured). |  |
| ip_text |  | YES |  | Plaintext IP (if captured). |  |

## Engine Details

### mysql

Unique keys:
| Name | Columns |
| --- | --- |
| uq_err_fp | fingerprint |

Indexes:
| Name | Columns | SQL |
| --- | --- | --- |
| idx_err_ip | ip_hash | INDEX idx_err_ip (ip_hash) |
| idx_err_level | level | INDEX idx_err_level (level) |
| idx_err_resolved | resolved | INDEX idx_err_resolved (resolved) |
| idx_err_time | created_at | INDEX idx_err_time (created_at) |
| idx_err_user | user_id | INDEX idx_err_user (user_id) |
| idx_system_errors_last_seen | last_seen | CREATE INDEX idx_system_errors_last_seen ON system_errors (last_seen) |
| uq_err_fp | fingerprint | UNIQUE KEY uq_err_fp (fingerprint) |

Foreign keys:
| Name | Columns | References | Actions |
| --- | --- | --- | --- |
| fk_err_resolved_by | resolved_by | users(id) | ON DELETE SET |
| fk_err_user | user_id | users(id) | ON DELETE SET |

### postgres

Unique keys:
| Name | Columns |
| --- | --- |
| uq_err_fp | fingerprint |

Indexes:
| Name | Columns | SQL |
| --- | --- | --- |
| gin_system_errors_ctx | contextjsonb_path_ops | CREATE INDEX IF NOT EXISTS gin_system_errors_ctx    ON system_errors USING GIN (context jsonb_path_ops) |
| idx_err_ip | ip_hash | CREATE INDEX IF NOT EXISTS idx_err_ip ON system_errors (ip_hash) |
| idx_err_level | level | CREATE INDEX IF NOT EXISTS idx_err_level ON system_errors (level) |
| idx_err_resolved | resolved | CREATE INDEX IF NOT EXISTS idx_err_resolved ON system_errors (resolved) |
| idx_err_time | created_at | CREATE INDEX IF NOT EXISTS idx_err_time ON system_errors (created_at) |
| idx_err_user | user_id | CREATE INDEX IF NOT EXISTS idx_err_user ON system_errors (user_id) |
| idx_system_errors_last_seen | last_seen | CREATE INDEX IF NOT EXISTS idx_system_errors_last_seen ON system_errors (last_seen) |
| uq_err_fp | fingerprint | CONSTRAINT uq_err_fp UNIQUE (fingerprint) |

Foreign keys:
| Name | Columns | References | Actions |
| --- | --- | --- | --- |
| fk_err_resolved_by | resolved_by | users(id) | ON DELETE SET |
| fk_err_user | user_id | users(id) | ON DELETE SET |

## Engine differences

## Views
| View | Engine | Flags | File |
| --- | --- | --- | --- |
| vw_system_errors | mysql | algorithm=MERGE, security=INVOKER | [../schema/040_views.mysql.sql](../schema/040_views.mysql.sql) |
| vw_system_errors_daily | mysql | algorithm=TEMPTABLE, security=INVOKER | [../schema/040_views_joins.mysql.sql](../schema/040_views_joins.mysql.sql) |
| vw_system_errors_top_fingerprints | mysql | algorithm=TEMPTABLE, security=INVOKER | [../schema/040_views_joins.mysql.sql](../schema/040_views_joins.mysql.sql) |
| vw_system_errors | postgres |  | [../schema/040_views.postgres.sql](../schema/040_views.postgres.sql) |
| vw_system_errors_daily | postgres |  | [../schema/040_views_joins.postgres.sql](../schema/040_views_joins.postgres.sql) |
| vw_system_errors_top_fingerprints | postgres |  | [../schema/040_views_joins.postgres.sql](../schema/040_views_joins.postgres.sql) |
