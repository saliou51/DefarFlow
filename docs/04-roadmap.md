# DefarFlow - Roadmap initiale

## Phase 1 - Conception v0.1

- cahier des charges fonctionnel
- cas d'utilisation
- modele de domaine
- schema de base de donnees
- liste des endpoints API
- maquettes simples des ecrans
- matrice de permissions

Diagrammes UML de reference:

- [Architecture](uml/architecture.puml)
- [Cas d'utilisation](uml/use-cases.puml)
- [Diagramme de classes](uml/domain-class-diagram.puml)
- [Diagramme de conception des services](uml/service-class-diagram.puml)
- [Cycle de vie d'une demande](uml/request-state-diagram.puml)
- [Sequence de traitement d'une demande](uml/request-sequence.puml)

## Phase 2 - Backend Django

- creer le projet Django
- configurer Django REST Framework
- configurer PostgreSQL
- creer le modele utilisateur
- creer organisations, batiments et locaux
- creer demandes et interventions
- ajouter permissions par role
- ajouter tests backend

## Phase 3 - Frontend React

- creer le projet React
- pages de connexion
- layout principal
- liste des demandes
- detail demande
- formulaire de creation
- vues gestionnaire
- vues technicien
- dashboard simple

## Phase 4 - Produit testable

- upload de photos
- filtres
- responsive mobile
- QR code par local
- notifications email simples
- deploiement de test

## Phase 5 - Validation terrain

- trouver une premiere organisation pilote
- observer leur processus actuel
- faire tester gratuitement pendant un mois
- noter les blocages reels
- ameliorer uniquement ce qui aide l'usage reel

## Phase 6 - Monétisation

- definir les limites des plans
- ajouter Stripe
- creer une page de facturation
- tester un prix Starter / Pro / Business

