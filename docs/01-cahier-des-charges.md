# DefarFlow v0.1 - Cahier des charges fonctionnel

## 1. Vision

DefarFlow est une application web SaaS de gestion des demandes de maintenance.
Elle permet a une organisation de centraliser les problemes signales, de les
assigner a des techniciens, de suivre leur progression et de conserver un
historique clair des interventions.

## 2. Cible

DefarFlow vise d'abord les petites et moyennes organisations au Senegal:

- residences et immeubles
- restaurants et commerces
- cliniques et cabinets medicaux
- ecoles et universites
- petites administrations
- entreprises avec locaux ou equipements a maintenir

## 3. Probleme a resoudre

Beaucoup d'organisations gerent encore les problemes de maintenance par appels,
WhatsApp, papier ou discussions informelles. Cela cree plusieurs difficultes:

- demandes oubliees
- absence de suivi clair
- priorites mal definies
- techniciens mal informes
- historique difficile a retrouver
- manque de statistiques pour les responsables

DefarFlow doit rendre ce processus simple, visible et mesurable.

## 4. Objectif du MVP

La version 0.1 doit repondre a une question simple:

> Une vraie organisation peut-elle utiliser DefarFlow pour creer, assigner,
> suivre et fermer une demande de maintenance?

Le MVP ne cherche pas encore a couvrir tous les besoins. Il doit etre assez
solide pour etre teste avec une premiere organisation.

## 5. Roles utilisateurs

### Employe

L'employe signale les problemes et suit l'avancement de ses demandes.

Fonctionnalites:

- se connecter
- creer une demande de maintenance
- ajouter une description
- choisir un lieu
- choisir une priorite initiale
- ajouter une photo
- consulter ses propres demandes
- voir le statut d'une demande

### Gestionnaire

Le gestionnaire organise le travail et supervise les demandes.

Fonctionnalites:

- se connecter
- voir toutes les demandes de son organisation
- filtrer les demandes
- consulter le detail d'une demande
- modifier la priorite
- assigner un technicien
- changer le statut
- fermer une demande
- consulter un tableau de bord simple

### Technicien

Le technicien traite les demandes qui lui sont assignees.

Fonctionnalites:

- se connecter
- voir ses demandes assignees
- demarrer une intervention
- ajouter un commentaire
- terminer une intervention
- indiquer un cout optionnel

## 6. Statuts d'une demande

Les demandes passent par les statuts suivants:

1. Nouvelle
2. Assignee
3. En cours
4. Terminee
5. Fermee

Regles principales:

- une demande creee commence au statut `Nouvelle`
- une demande assignee a un technicien passe a `Assignee`
- un technicien peut passer sa demande a `En cours`
- un technicien peut marquer l'intervention comme `Terminee`
- seul un gestionnaire peut fermer definitivement la demande

## 7. Priorites

Priorites disponibles pour le MVP:

- Basse
- Normale
- Haute
- Urgente

Le gestionnaire peut modifier la priorite apres creation.

## 8. Donnees principales

### Organisation

- nom
- adresse
- plan
- date de creation

### Utilisateur

- organisation
- nom
- email
- mot de passe
- role
- actif/inactif

### Batiment

- organisation
- nom
- adresse

### Local

- batiment
- nom
- etage
- description

### DemandeMaintenance

- organisation
- local
- creee par
- assignee a
- titre
- description
- priorite
- statut
- date de creation
- date de fermeture

### Intervention

- demande
- technicien
- commentaire
- date de debut
- date de fin
- cout

### PieceJointe

- demande
- fichier
- type
- date d'ajout

## 9. Fonctionnalites hors MVP

Ces fonctionnalites sont importantes, mais elles seront ajoutees plus tard:

- paiements Stripe
- application mobile native
- IA de classification
- maintenance preventive
- exports PDF avances
- SMS
- multi-langue complet
- inventaire d'equipements avance
- chat temps reel

## 10. Critere de succes v0.1

La v0.1 est reussie si:

- un employe peut creer une demande
- un gestionnaire peut la voir et l'assigner
- un technicien peut la traiter
- le statut peut progresser jusqu'a `Fermee`
- l'organisation peut retrouver l'historique des demandes

