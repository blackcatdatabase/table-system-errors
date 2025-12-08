# system_errors

Application error/event log with grouping and resolution.

## Columns
| Column | Type | Null | Default | Description |
| --- | --- | --- | --- | --- |
| context | JSONB | YES |  | JSON context (structured). |
| created_at | TIMESTAMPTZ(6) | NO | CURRENT_TIMESTAMP(6) | First occurrence (UTC). |
| exception_class | VARCHAR(255) | YES |  | Exception class name (if any). |
| file | VARCHAR(1024) | YES |  | Source file path. |
| fingerprint | VARCHAR(64) | YES |  | Deduplication fingerprint. |
| http_status | SMALLINT | YES |  | HTTP status code. |
| id | BIGINT | NO |  | Surrogate primary key. |
| ip_bin | BYTEA | YES |  | Binary IP (if captured). |
| ip_hash | BYTEA | YES |  | Hashed IP. |
| ip_hash_key_version | VARCHAR(64) | YES |  | Key version for ip_hash. |
| ip_text | VARCHAR(45) | YES |  | Plaintext IP (if captured). |
| last_seen | TIMESTAMPTZ(6) | NO | CURRENT_TIMESTAMP(6) | Most recent occurrence (UTC). |
| level | TEXT | NO |  | Severity level. (enum: notice, warning, error, critical) |
| line | INTEGER | YES |  | Source line number. |
| message | TEXT | NO |  | Error message. |
| method | VARCHAR(10) | YES |  | HTTP method. |
| occurrences | INTEGER | NO | 1 | Aggregate count of occurrences. |
| resolved | BOOLEAN | NO | FALSE | Resolution flag. |
| resolved_at | TIMESTAMPTZ(6) | YES |  | Resolution timestamp (UTC). |
| resolved_by | BIGINT | YES |  | Resolver user id (FK users.id), optional. |
| stack_trace | TEXT | YES |  | Long stack trace. |
| token | VARCHAR(255) | YES |  | Correlated token/id. |
| url | VARCHAR(2048) | YES |  | Request URL. |
| user_agent | VARCHAR(1024) | YES |  | User agent string. |
| user_id | BIGINT | YES |  | Related user (optional). |

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
| vw_system_errors | mysql | algorithm=MERGE, security=INVOKER | [packages\system-errors\schema\040_views.mysql.sql](https://github.com/blackcatacademy/blackcat-database/packages/system-errors/schema/040_views.mysql.sql) |
| vw_system_errors_daily | mysql | algorithm=TEMPTABLE, security=INVOKER | [packages\system-errors\schema\040_views_joins.mysql.sql](https://github.com/blackcatacademy/blackcat-database/packages/system-errors/schema/040_views_joins.mysql.sql) |
| vw_system_errors_top_fingerprints | mysql | algorithm=TEMPTABLE, security=INVOKER | [packages\system-errors\schema\040_views_joins.mysql.sql](https://github.com/blackcatacademy/blackcat-database/packages/system-errors/schema/040_views_joins.mysql.sql) |
| vw_system_errors | postgres |  | [packages\system-errors\schema\040_views.postgres.sql](https://github.com/blackcatacademy/blackcat-database/packages/system-errors/schema/040_views.postgres.sql) |
| vw_system_errors_daily | postgres |  | [packages\system-errors\schema\040_views_joins.postgres.sql](https://github.com/blackcatacademy/blackcat-database/packages/system-errors/schema/040_views_joins.postgres.sql) |
| vw_system_errors_top_fingerprints | postgres |  | [packages\system-errors\schema\040_views_joins.postgres.sql](https://github.com/blackcatacademy/blackcat-database/packages/system-errors/schema/040_views_joins.postgres.sql) |
