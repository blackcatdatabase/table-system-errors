# 📦 System Errors

![SQL](https://img.shields.io/badge/SQL-MySQL%208.0%2B-4479A1?logo=mysql&logoColor=white) ![License](https://img.shields.io/badge/license-BlackCat%20Proprietary-red) ![Status](https://img.shields.io/badge/status-stable-informational) ![Generated](https://img.shields.io/badge/generated-from%20schema--map-blue)

<!-- Auto-generated from schema-map.psd1 @ 6cefe8e (2025-10-22T20:27:41+02:00) -->

> Schema package for table **system_errors** (repo: `system-errors`).

## Files
```
schema/
  001_table.sql
  020_indexes.sql
  030_foreign_keys.sql
```

## Quick apply
```bash
# Apply schema (Linux/macOS):
mysql -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASS" "$DB_NAME" < schema/001_table.sql
mysql -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASS" "$DB_NAME" < schema/020_indexes.sql
mysql -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASS" "$DB_NAME" < schema/030_foreign_keys.sql
```

```powershell
# Apply schema (Windows PowerShell):
mysql -h $env:DB_HOST -u $env:DB_USER -p$env:DB_PASS $env:DB_NAME < schema/001_table.sql
mysql -h $env:DB_HOST -u $env:DB_USER -p$env:DB_PASS $env:DB_NAME < schema/020_indexes.sql
mysql -h $env:DB_HOST -u $env:DB_USER -p$env:DB_PASS $env:DB_NAME < schema/030_foreign_keys.sql
```

## Docker quickstart
```bash
# Spin up a throwaway MySQL and apply just this package:
docker run --rm -e MYSQL_ROOT_PASSWORD=root -e MYSQL_DATABASE=app -p 3307:3306 -d mysql:8
sleep 15
mysql -h 127.0.0.1 -P 3307 -u root -proot app < schema/001_table.sql
mysql -h 127.0.0.1 -P 3307 -u root -proot app < schema/020_indexes.sql
mysql -h 127.0.0.1 -P 3307 -u root -proot app < schema/030_foreign_keys.sql
```

## Columns
| Column | Type | Null | Default | Extra |
|-------:|:-----|:----:|:--------|:------|
| id | BIGINT UNSIGNED | — | — | AUTO_INCREMENT, PK |
| level | ENUM('notice','warning','error','critical') | NO | — |  |
| message | TEXT | NO | — |  |
| exception_class | VARCHAR(255) | YES | — |  |
| file | VARCHAR(1024) | YES | — |  |
| line | INT UNSIGNED | YES | — |  |
| stack_trace | MEDIUMTEXT | YES | — |  |
| token | VARCHAR(255) | YES | — |  |
| context | JSON | YES | — |  |
| fingerprint | VARCHAR(64) | YES | — |  |
| occurrences | INT UNSIGNED | NO | 1 |  |
| user_id | BIGINT UNSIGNED | YES | — |  |
| ip_hash | BINARY(32) | YES | — |  |
| ip_hash_key_version | VARCHAR(64) | YES | — |  |
| ip_text | VARCHAR(45) | YES | — |  |
| ip_bin | VARBINARY(16) | YES | — |  |
| user_agent | VARCHAR(1024) | YES | — |  |
| url | VARCHAR(2048) | YES | — |  |
| method | VARCHAR(10) | YES | — |  |
| http_status | SMALLINT UNSIGNED | YES | — |  |
| resolved | BOOLEAN | NO | 0 |  |
| resolved_by | BIGINT UNSIGNED | YES | — |  |
| resolved_at | DATETIME(6) | YES | — |  |
| created_at | DATETIME(6) | NO | CURRENT_TIMESTAMP(6) |  |
| last_seen | DATETIME(6) | NO | CURRENT_TIMESTAMP(6) |  |

## Relationships
- FK → **users** via (resolved_by) (ON DELETE SET NULL).
- FK → **users** via (user_id) (ON DELETE SET NULL).

```mermaid
erDiagram
  SYSTEM_ERRORS {
    INT id PK
    ENUM level
    VARCHAR message
    VARCHAR exception_class
    VARCHAR file
    INT line
    VARCHAR stack_trace
    VARCHAR token
    JSON context
    VARCHAR fingerprint
    INT occurrences
    INT user_id
    BLOB ip_hash
    VARCHAR ip_hash_key_version
    VARCHAR ip_text
    BLOB ip_bin
    VARCHAR user_agent
    VARCHAR url
    VARCHAR method
    INT http_status
    BOOLEAN resolved
    INT resolved_by
    DATETIME resolved_at
    DATETIME created_at
    DATETIME last_seen
  }
  SYSTEM_ERRORS }o--|| USERS : "resolved_by"
  SYSTEM_ERRORS }o--|| USERS : "user_id"
```

## Indexes
- 1 deferred index statement(s) in schema/020_indexes.sql.

## Notes
- Generated from the umbrella repository **blackcat-database** using `scripts/schema-map.psd1`.
- To change the schema, update the map and re-run the generators.

## License
Distributed under the **BlackCat Store Proprietary License v1.0**. See `LICENSE`.
