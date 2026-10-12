# ADR-002 - Database

## Status

Accepted

## Context

The product stores organizations, users, locations, requests, interventions, and
attachments. These records have clear relationships and need transactional
updates.

## Decision

Use PostgreSQL as the primary database.

## Consequences

- Foreign keys and indexes can enforce most structural constraints.
- The schema remains compatible with Django migrations.
- SQLite may be used only for quick local experiments, not as the reference
  database.

