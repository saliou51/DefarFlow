# ADR-003 - Identifiers

## Status

Accepted

## Context

The API will expose resource identifiers to the frontend. Sequential integer IDs
are easy to guess and can leak information about record volume.

## Decision

Use UUIDs for public resource identifiers.

## Consequences

- API URLs are less predictable.
- Test fixtures require explicit UUID values or helper factories.
- Database indexes should be defined for frequently queried foreign keys.

