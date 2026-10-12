# DefarFlow v0.1 - Functional Scope

## Product Positioning

DefarFlow centralizes maintenance requests for organizations that currently rely
on calls, messaging apps, spreadsheets, or paper forms to track issues.

The product is intentionally narrow in v0.1: request intake, assignment,
intervention tracking, and closure.

## Target Users

DefarFlow is designed for organizations with shared spaces, equipment, or
facilities to maintain:

- residential buildings
- restaurants and shops
- clinics and offices
- schools
- small administrations
- companies with managed premises

## Problem

Maintenance work is often difficult to track when requests are spread across
informal channels. Common failures:

- requests are forgotten
- priorities are unclear
- technicians receive incomplete information
- managers lack visibility
- intervention history is hard to retrieve

## v0.1 Goal

The first release is successful when an organization can create, assign, process,
and close a maintenance request without using an external tracking process.

## Roles

UML source: [docs/uml/use-cases.puml](uml/use-cases.puml)

### Employee

Creates maintenance requests and follows their progress.

Responsibilities:

- create a request
- select a location
- provide title, description, priority, and optional photo
- view own requests
- track request status

### Manager

Coordinates maintenance work for the organization.

Responsibilities:

- view all requests
- filter requests
- update priority
- assign a technician
- close completed requests
- review basic dashboard metrics

### Technician

Handles assigned work.

Responsibilities:

- view assigned requests
- start an intervention
- add a work comment
- complete an intervention
- enter an optional cost

## Request Statuses

UML source: [docs/uml/request-state-diagram.puml](uml/request-state-diagram.puml)

Allowed statuses:

1. `NOUVELLE`
2. `ASSIGNEE`
3. `EN_COURS`
4. `TERMINEE`
5. `FERMEE`

Rules:

- a new request starts as `NOUVELLE`
- assigning a technician moves it to `ASSIGNEE`
- a technician can move an assigned request to `EN_COURS`
- a technician can complete an intervention and move the request to `TERMINEE`
- only a manager can close a request

## Priorities

Allowed priorities:

- `BASSE`
- `NORMALE`
- `HAUTE`
- `URGENTE`

Managers can update the priority after creation.

## Main Data

UML source: [docs/uml/domain-class-diagram.puml](uml/domain-class-diagram.puml)

Core entities:

- organization
- user
- building
- room
- maintenance request
- intervention
- attachment

## Out Of Scope For v0.1

- billing
- native mobile app
- AI classification
- preventive maintenance
- advanced PDF exports
- SMS notifications
- full multilingual UI
- equipment inventory
- realtime chat

## Acceptance Criteria

The v0.1 scope is complete when:

- an employee can create a request
- a manager can assign it
- a technician can process it
- the request can reach `FERMEE`
- the organization can retrieve the request history

