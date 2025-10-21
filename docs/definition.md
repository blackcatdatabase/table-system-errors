<!-- Auto-generated from schema-map.psd1 @ 1e83bb6 (2025-10-21T10:18:36+02:00) -->
# Definition – system_errors

Application error/event log with grouping and resolution.

## Columns
| Column | Type | Null | Default | Description | Notes |
|-------:|:-----|:----:|:--------|:------------|:------|
| id | BIGINT UNSIGNED | — | — | Surrogate primary key. |  |
| level | ENUM('notice','warning','error','critical') | NO | — | Severity level. | enum: notice, warning, error, critical |
| message | TEXT | NO | — | Error message. |  |
| exception_class | VARCHAR(255) | YES | — | Exception class name (if any). |  |
| file | VARCHAR(1024) | YES | — | Source file path. |  |
| line | INT UNSIGNED | YES | — | Source line number. |  |
| stack_trace | MEDIUMTEXT | YES | — | Long stack trace. |  |
| token | VARCHAR(255) | YES | — | Correlated token/id. |  |
| context | JSON | YES | — | JSON context (structured). |  |
| fingerprint | VARCHAR(64) | YES | — | Deduplication fingerprint. |  |
| occurrences | INT UNSIGNED | NO | 1 | Aggregate count of occurrences. |  |
| user_id | BIGINT UNSIGNED | YES | — | Related user (optional). |  |
| ip_hash | BINARY(32) | YES | — | Hashed IP. | PII: hashed |
| ip_hash_key_version | VARCHAR(64) | YES | — | Key version for ip_hash. |  |
| ip_text | VARCHAR(45) | YES | — | Plaintext IP (if captured). | PII: plain |
| ip_bin | VARBINARY(16) | YES | — | Binary IP (if captured). |  |
| user_agent | VARCHAR(1024) | YES | — | User agent string. |  |
| url | VARCHAR(2048) | YES | — | Request URL. |  |
| method | VARCHAR(10) | YES | — | HTTP method. |  |
| http_status | SMALLINT UNSIGNED | YES | — | HTTP status code. |  |
| resolved | BOOLEAN | NO | 0 | Resolution flag. |  |
| resolved_by | BIGINT UNSIGNED | YES | — | Resolver user id (FK users.id), optional. |  |
| resolved_at | DATETIME(6) | YES | — | Resolution timestamp (UTC). |  |
| created_at | DATETIME(6) | NO | CURRENT_TIMESTAMP(6) | First occurrence (UTC). |  |
| last_seen | DATETIME(6) | NO | CURRENT_TIMESTAMP(6) | Most recent occurrence (UTC). |  |
