# DefarFlow v0.1 - Backlog

## Conventions

- `P0`: required for the first usable backend.
- `P1`: required for a pilot.
- `P2`: useful after the core workflow is stable.

## Backend

| ID | Priority | Item | Acceptance Criteria |
| --- | --- | --- | --- |
| DF-001 | P0 | Initialize Django project | Project runs locally with settings split for development. |
| DF-002 | P0 | Add Django REST Framework | API routes can return a health response. |
| DF-003 | P0 | Configure PostgreSQL | Application connects through environment variables. |
| DF-004 | P0 | Create custom user model | User has organization, full name, email, role, and active status. |
| DF-005 | P0 | Implement organizations | Managers and users are scoped to one organization. |
| DF-006 | P0 | Implement buildings and rooms | Managers can create buildings and rooms. |
| DF-007 | P0 | Implement maintenance requests | Employees and managers can create requests. |
| DF-008 | P0 | Implement request assignment | Managers can assign a request to a technician. |
| DF-009 | P0 | Implement interventions | Technicians can start and complete assigned work. |
| DF-010 | P0 | Enforce role permissions | API blocks unauthorized role actions. |
| DF-011 | P1 | Add attachments | Users can attach a photo to an accessible request. |
| DF-012 | P1 | Add dashboard summary | Managers can see counts by status and priority. |

## Frontend

| ID | Priority | Item | Acceptance Criteria |
| --- | --- | --- | --- |
| DF-101 | P0 | Initialize React app | App runs locally and calls the API health endpoint. |
| DF-102 | P0 | Add login screen | User can sign in and persist the session/token. |
| DF-103 | P0 | Add request list | List respects the current user's role. |
| DF-104 | P0 | Add request detail | User can inspect status, priority, location, and intervention data. |
| DF-105 | P0 | Add request creation form | Employee or manager can create a request. |
| DF-106 | P1 | Add manager actions | Manager can update priority, assign, and close. |
| DF-107 | P1 | Add technician actions | Technician can start and complete interventions. |
| DF-108 | P1 | Add dashboard | Manager sees MVP metrics. |

## Quality

| ID | Priority | Item | Acceptance Criteria |
| --- | --- | --- | --- |
| DF-201 | P0 | Add backend tests | Request lifecycle tests pass. |
| DF-202 | P0 | Add permission tests | Each role is tested against allowed and forbidden actions. |
| DF-203 | P1 | Add API documentation | API examples match implemented serializers. |
| DF-204 | P1 | Add seed data | Demo organization can be loaded locally. |

