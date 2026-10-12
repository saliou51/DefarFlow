# DefarFlow - Roadmap

## Phase 0 - Product Definition

Status: in progress

- functional scope
- use cases
- domain model
- database schema
- API contracts
- permissions matrix
- architecture decisions
- initial backlog

Reference diagrams:

- [Architecture](uml/architecture.puml)
- [Use cases](uml/use-cases.puml)
- [Domain class diagram](uml/domain-class-diagram.puml)
- [Service design diagram](uml/service-class-diagram.puml)
- [Request state diagram](uml/request-state-diagram.puml)
- [Request processing sequence](uml/request-sequence.puml)

## Phase 1 - Backend Foundation

- initialize Django project
- configure Django REST Framework
- configure environment settings
- add PostgreSQL support
- implement custom user model
- implement organizations
- implement buildings and rooms
- add model tests

## Phase 2 - Maintenance Workflow

- implement maintenance request model
- implement intervention model
- implement attachment model
- implement role-based permissions
- implement request assignment
- implement intervention start and completion
- add API tests for the request lifecycle

## Phase 3 - Frontend MVP

- initialize React app
- add authentication screens
- add main application layout
- add request list
- add request detail page
- add request creation form
- add manager actions
- add technician workflow
- add dashboard summary

## Phase 4 - Pilot Readiness

- improve mobile layout
- add request filters
- add photo upload
- add email notifications
- add QR code entry point for rooms
- deploy a test environment

## Phase 5 - Pilot Validation

- onboard one pilot organization
- observe the existing maintenance process
- collect usage feedback
- fix workflow blockers
- defer features that are not required for daily use

## Later

- billing
- preventive maintenance
- exports
- equipment inventory
- advanced reporting

