# ADR-001 - Backend Framework

## Status

Accepted

## Context

The backend must expose a JSON API, enforce role-based access, and support a
relational data model. The first version should be fast to build and easy to
test.

## Decision

Use Django with Django REST Framework.

## Consequences

- Django provides authentication, ORM, migrations, admin, and testing support.
- Django REST Framework provides serializers, viewsets, permissions, and API
  testing utilities.
- The project should avoid custom framework code until the product needs it.

