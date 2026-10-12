# DefarFlow

DefarFlow est une application web SaaS de gestion des demandes de maintenance et
des interventions, pensee d'abord pour les petites et moyennes organisations.

## Objectif

Permettre a une organisation de:

- signaler un probleme de maintenance
- assigner une demande a un technicien
- suivre le statut
- documenter l'intervention
- conserver un historique exploitable

## Documentation

- [Cahier des charges v0.1](docs/01-cahier-des-charges.md)
- [Cas d'utilisation](docs/02-cas-utilisation.md)
- [Modele de domaine](docs/03-modele-domaine.md)
- [Roadmap](docs/04-roadmap.md)
- [Schema de base de donnees](docs/05-schema-base-donnees.md)
- [Contrats API REST](docs/06-api-rest.md)
- [Matrice de permissions](docs/07-permissions.md)

## Diagrammes UML

Les diagrammes sont ecrits en PlantUML dans [docs/uml](docs/uml).

- [Architecture](docs/uml/architecture.puml)
- [Cas d'utilisation](docs/uml/use-cases.puml)
- [Diagramme de classes](docs/uml/domain-class-diagram.puml)
- [Diagramme de conception des services](docs/uml/service-class-diagram.puml)
- [Cycle de vie d'une demande](docs/uml/request-state-diagram.puml)
- [Sequence de traitement d'une demande](docs/uml/request-sequence.puml)

Rendus SVG:

- [Architecture](docs/uml/rendered/architecture.svg)
- [Cas d'utilisation](docs/uml/rendered/use-cases.svg)
- [Diagramme de classes](docs/uml/rendered/domain-class-diagram.svg)
- [Diagramme de conception des services](docs/uml/rendered/service-class-diagram.svg)
- [Cycle de vie d'une demande](docs/uml/rendered/request-state-diagram.svg)
- [Sequence de traitement d'une demande](docs/uml/rendered/request-sequence.svg)

Pour generer et verifier les diagrammes:

```bash
npm run uml:check
```

## Stack prevue

- Backend: Django + Django REST Framework
- Frontend: React
- Base de donnees: PostgreSQL
- Authentification: JWT ou session selon l'implementation retenue
- Deploiement: a definir

