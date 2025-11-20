<!-- Auto-generated from schema-map-postgres.psd1 @ 62c9c93 (2025-11-20T21:38:11+01:00) -->
# Definition – system_errors

Application error/event log with grouping and resolution.

## Columns
| Column | Type | Null | Default | Description | Notes |
|-------:|:-----|:----:|:--------|:------------|:------|
| id | BIGINT | — | AS | Surrogate primary key. |  |
| level | TEXT | NO | — | Severity level. | enum: notice, warning, error, critical |
| message | TEXT | NO | — | Error message. |  |
| exception_class | VARCHAR(255) | YES | — | Exception class name (if any). |  |
| file | VARCHAR(1024) | YES | — | Source file path. |  |
| line | INTEGER | YES | — | Source line number. |  |
| stack_trace | TEXT | YES | — | Long stack trace. |  |
| token | VARCHAR(255) | YES | — | Correlated token/id. |  |
| context | JSONB | YES | — | JSON context (structured). |  |
| fingerprint | VARCHAR(64) | YES | — | Deduplication fingerprint. |  |
| occurrences | INTEGER | NO | 1 | Aggregate count of occurrences. |  |
| user_id | BIGINT | YES | — | Related user (optional). |  |
| ip_hash | BYTEA | YES | — | Hashed IP. | PII: hashed |
| ip_hash_key_version | VARCHAR(64) | YES | — | Key version for ip_hash. |  |
| ip_text | VARCHAR(45) | YES | — | Plaintext IP (if captured). | PII: plain |
| ip_bin | BYTEA | YES | — | Binary IP (if captured). |  |
| user_agent | VARCHAR(1024) | YES | — | User agent string. |  |
| url | VARCHAR(2048) | YES | — | Request URL. |  |
| method | VARCHAR(10) | YES | — | HTTP method. |  |
| http_status | SMALLINT | YES | — | HTTP status code. |  |
| resolved | BOOLEAN | NO | FALSE | Resolution flag. |  |
| resolved_by | BIGINT | YES | — | Resolver user id (FK users.id), optional. |  |
| resolved_at | TIMESTAMPTZ(6) | YES | — | Resolution timestamp (UTC). |  |
| created_at | TIMESTAMPTZ(6) | NO | CURRENT_TIMESTAMP(6) | First occurrence (UTC). |  |
| last_seen | TIMESTAMPTZ(6) | NO | CURRENT_TIMESTAMP(6) | Most recent occurrence (UTC). |  |