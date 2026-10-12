# DefarFlow

DefarFlow is a maintenance request management platform for organizations that
need a simple way to report issues, assign work, track progress, and keep an
intervention history.

The first release focuses on a small, usable workflow:

- create a maintenance request
- assign it to a technician
- track its status
- document the intervention
- close the request with a clear history

## Scope

Version `0.1` covers the operational core only. Billing, advanced analytics,
native mobile apps, preventive maintenance, and AI-assisted classification are
out of scope until the request workflow has been validated with real users.

## Documentation

- [Product brief](docs/00-product-brief.md)
- [Functional scope](docs/01-cahier-des-charges.md)
- [Use cases](docs/02-cas-utilisation.md)
- [Domain model](docs/03-modele-domaine.md)
- [Roadmap](docs/04-roadmap.md)
- [Database schema](docs/05-schema-base-donnees.md)
- [REST API](docs/06-api-rest.md)
- [Permissions](docs/07-permissions.md)
- [Backlog](docs/08-backlog.md)
- [Architecture decisions](docs/adr)

## UML

PlantUML sources are stored in [docs/uml](docs/uml).

- [Architecture](docs/uml/architecture.puml)
- [Use cases](docs/uml/use-cases.puml)
- [Domain class diagram](docs/uml/domain-class-diagram.puml)
- [Service design diagram](docs/uml/service-class-diagram.puml)
- [Request state diagram](docs/uml/request-state-diagram.puml)
- [Request processing sequence](docs/uml/request-sequence.puml)

Rendered SVG files are stored in [docs/uml/rendered](docs/uml/rendered).

To regenerate and validate the diagrams:

```bash
npm run uml:check
```

## Planned Stack

- Backend: Django, Django REST Framework
- Frontend: React
- Database: PostgreSQL
- Authentication: session or token-based auth, to be finalized during backend setup

