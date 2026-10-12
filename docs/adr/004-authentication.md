# ADR-004 - Authentication Direction

## Status

Proposed

## Context

The first version is a web application with a React frontend and a Django API.
The authentication approach must work locally, in production, and in tests.

## Decision

Start with a simple authenticated API using either Django sessions or token-based
auth. Final selection will be made during backend setup after evaluating the
deployment target and frontend routing needs.

## Consequences

- API contracts currently describe the login response without committing to a
  final token format.
- Permission logic must live on the backend regardless of frontend behavior.
- This ADR should be updated before the first production deployment.

