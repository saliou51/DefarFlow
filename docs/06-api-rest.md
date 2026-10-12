# DefarFlow v0.1 - Contrats API REST

## Objectif

Ce document definit les endpoints principaux du backend Django REST Framework.
Il servira de reference avant l'implementation.

## Conventions

- Prefixe API: `/api/v1`
- Format: JSON
- Authentification: token ou session, a confirmer pendant l'implementation
- Les exemples utilisent des UUID fictifs

## Authentification

### POST /api/v1/auth/login/

Connecte un utilisateur.

Requete:

```json
{
  "email": "gestionnaire@example.com",
  "password": "motdepasse"
}
```

Reponse `200`:

```json
{
  "token": "jwt-ou-session-token",
  "user": {
    "id": "11111111-1111-1111-1111-111111111111",
    "full_name": "Gestionnaire Demo",
    "email": "gestionnaire@example.com",
    "role": "GESTIONNAIRE"
  }
}
```

### POST /api/v1/auth/logout/

Deconnecte l'utilisateur courant.

## Organisations

### GET /api/v1/organization/

Retourne l'organisation de l'utilisateur connecte.

Reponse `200`:

```json
{
  "id": "22222222-2222-2222-2222-222222222222",
  "name": "Organisation Demo",
  "address": "Adresse demo",
  "plan": "starter"
}
```

## Utilisateurs

### GET /api/v1/users/

Liste les utilisateurs de l'organisation.

Roles autorises:

- `GESTIONNAIRE`

Parametres optionnels:

- `role`
- `is_active`

### POST /api/v1/users/

Cree un utilisateur dans l'organisation.

Roles autorises:

- `GESTIONNAIRE`

Requete:

```json
{
  "full_name": "Technicien Demo",
  "email": "technicien@example.com",
  "role": "TECHNICIEN",
  "password": "motdepasse"
}
```

## Batiments et locaux

### GET /api/v1/buildings/

Liste les batiments de l'organisation.

### POST /api/v1/buildings/

Cree un batiment.

Roles autorises:

- `GESTIONNAIRE`

### GET /api/v1/rooms/

Liste les locaux.

Parametres optionnels:

- `building_id`

### POST /api/v1/rooms/

Cree un local.

Roles autorises:

- `GESTIONNAIRE`

## Demandes de maintenance

### GET /api/v1/maintenance-requests/

Liste les demandes visibles par l'utilisateur courant.

Regles:

- `EMPLOYE`: voit ses propres demandes
- `TECHNICIEN`: voit les demandes qui lui sont assignees
- `GESTIONNAIRE`: voit toutes les demandes de son organisation

Parametres optionnels:

- `status`
- `priority`
- `assigned_to_id`
- `created_by_id`
- `room_id`

### POST /api/v1/maintenance-requests/

Cree une demande de maintenance.

Roles autorises:

- `EMPLOYE`
- `GESTIONNAIRE`

Requete:

```json
{
  "room_id": "33333333-3333-3333-3333-333333333333",
  "title": "Climatisation en panne",
  "description": "Le climatiseur ne produit plus d'air froid.",
  "priority": "HAUTE"
}
```

Reponse `201`:

```json
{
  "id": "44444444-4444-4444-4444-444444444444",
  "title": "Climatisation en panne",
  "priority": "HAUTE",
  "status": "NOUVELLE"
}
```

### GET /api/v1/maintenance-requests/{id}/

Retourne le detail d'une demande visible par l'utilisateur courant.

### PATCH /api/v1/maintenance-requests/{id}/priority/

Modifie la priorite.

Roles autorises:

- `GESTIONNAIRE`

Requete:

```json
{
  "priority": "URGENTE"
}
```

### PATCH /api/v1/maintenance-requests/{id}/assign/

Assigne une demande a un technicien.

Roles autorises:

- `GESTIONNAIRE`

Requete:

```json
{
  "technician_id": "55555555-5555-5555-5555-555555555555"
}
```

Effet:

- `assigned_to_id` est mis a jour
- `status` passe a `ASSIGNEE`

### PATCH /api/v1/maintenance-requests/{id}/close/

Ferme une demande terminee.

Roles autorises:

- `GESTIONNAIRE`

Effet:

- `status` passe a `FERMEE`
- `closed_at` est rempli

## Interventions

### POST /api/v1/maintenance-requests/{id}/interventions/start/

Demarre l'intervention liee a une demande.

Roles autorises:

- `TECHNICIEN`

Effet:

- cree l'intervention si elle n'existe pas
- renseigne `started_at`
- met la demande au statut `EN_COURS`

### PATCH /api/v1/interventions/{id}/complete/

Termine une intervention.

Roles autorises:

- `TECHNICIEN`

Requete:

```json
{
  "comment": "Filtre nettoye et climatisation testee.",
  "cost": "15000.00"
}
```

Effet:

- renseigne `comment`, `cost`, `ended_at`
- met la demande au statut `TERMINEE`

## Pieces jointes

### POST /api/v1/maintenance-requests/{id}/attachments/

Ajoute une photo ou un fichier a une demande.

Roles autorises:

- utilisateur autorise a voir la demande

Format:

- `multipart/form-data`

## Dashboard

### GET /api/v1/dashboard/summary/

Retourne les indicateurs principaux.

Roles autorises:

- `GESTIONNAIRE`

Reponse `200`:

```json
{
  "open_requests": 27,
  "urgent_requests": 4,
  "completed_this_month": 63,
  "average_resolution_hours": 9.7,
  "by_status": {
    "NOUVELLE": 5,
    "ASSIGNEE": 8,
    "EN_COURS": 14,
    "TERMINEE": 3,
    "FERMEE": 63
  }
}
```

