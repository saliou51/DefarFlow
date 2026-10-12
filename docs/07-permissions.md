# DefarFlow v0.1 - Permissions

## Scope

Role-based access rules for the v0.1 workflow.

## Roles

- `EMPLOYE`: signale les problemes et suit ses demandes.
- `GESTIONNAIRE`: supervise les demandes, assigne les techniciens et ferme les
  demandes.
- `TECHNICIEN`: traite les demandes qui lui sont assignees.

## Matrice

| Action | Employe | Gestionnaire | Technicien |
| --- | --- | --- | --- |
| Se connecter | Oui | Oui | Oui |
| Voir son profil | Oui | Oui | Oui |
| Voir tous les utilisateurs | Non | Oui | Non |
| Creer un utilisateur | Non | Oui | Non |
| Voir les batiments | Oui | Oui | Oui |
| Creer un batiment | Non | Oui | Non |
| Voir les locaux | Oui | Oui | Oui |
| Creer un local | Non | Oui | Non |
| Creer une demande | Oui | Oui | Non |
| Voir ses demandes creees | Oui | Oui | Non |
| Voir toutes les demandes | Non | Oui | Non |
| Voir ses demandes assignees | Non | Oui | Oui |
| Modifier la priorite | Non | Oui | Non |
| Assigner un technicien | Non | Oui | Non |
| Demarrer une intervention | Non | Non | Oui |
| Terminer une intervention | Non | Non | Oui |
| Fermer une demande | Non | Oui | Non |
| Voir le dashboard | Non | Oui | Non |
| Ajouter une piece jointe | Oui | Oui | Oui |

## Regles detaillees

### Employe

L'employe peut:

- creer une demande pour son organisation
- voir les demandes qu'il a creees
- ajouter une piece jointe a ses demandes non fermees
- voir le statut de ses demandes

L'employe ne peut pas:

- voir toutes les demandes de l'organisation
- assigner un technicien
- modifier une priorite apres creation
- fermer une demande

### Gestionnaire

Le gestionnaire peut:

- creer une demande
- voir toutes les demandes de son organisation
- modifier la priorite
- assigner un technicien
- fermer une demande terminee
- gerer les utilisateurs
- gerer les batiments et locaux
- consulter le dashboard

Le gestionnaire ne traite pas directement les interventions dans le MVP, sauf si
son compte possede aussi un role de technicien dans une version future.

### Technicien

Le technicien peut:

- voir les demandes qui lui sont assignees
- demarrer une intervention
- ajouter un commentaire d'intervention
- terminer une intervention
- ajouter une piece jointe a une demande assignee non fermee

Le technicien ne peut pas:

- voir les demandes non assignees a lui
- assigner une demande a un autre technicien
- fermer definitivement une demande
- gerer les utilisateurs, batiments ou locaux

## Regles de securite

- Un utilisateur ne peut acceder qu'aux donnees de son organisation.
- Une demande fermee ne peut plus etre modifiee par un employe ou un technicien.
- Sensitive actions should be moved into an audit log after the first workflow
  is stable.
- Les endpoints doivent toujours verifier les permissions cote backend, meme si
  le frontend masque les boutons.

