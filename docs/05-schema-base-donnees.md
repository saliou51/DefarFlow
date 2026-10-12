# DefarFlow v0.1 - Schema de base de donnees

## Scope

Reference schema for the Django models and PostgreSQL migrations.

## Conventions

- Resource identifiers use `UUID`.
- Dates use `timestamp with time zone`.
- Table names use English.
- User-facing labels can be localized independently from database names.
- Main tables include `created_at` and `updated_at`.

## Tables

### organizations

| Colonne | Type | Contraintes |
| --- | --- | --- |
| id | uuid | primary key |
| name | varchar(150) | not null |
| address | varchar(255) | nullable |
| plan | varchar(50) | not null, default `starter` |
| created_at | timestamptz | not null |
| updated_at | timestamptz | not null |

### users

| Colonne | Type | Contraintes |
| --- | --- | --- |
| id | uuid | primary key |
| organization_id | uuid | foreign key vers `organizations.id` |
| full_name | varchar(150) | not null |
| email | varchar(254) | unique, not null |
| password | varchar(128) | not null |
| role | varchar(30) | not null |
| is_active | boolean | not null, default true |
| created_at | timestamptz | not null |
| updated_at | timestamptz | not null |

Roles autorises:

- `EMPLOYE`
- `GESTIONNAIRE`
- `TECHNICIEN`

### buildings

| Colonne | Type | Contraintes |
| --- | --- | --- |
| id | uuid | primary key |
| organization_id | uuid | foreign key vers `organizations.id` |
| name | varchar(150) | not null |
| address | varchar(255) | nullable |
| created_at | timestamptz | not null |
| updated_at | timestamptz | not null |

### rooms

| Colonne | Type | Contraintes |
| --- | --- | --- |
| id | uuid | primary key |
| building_id | uuid | foreign key vers `buildings.id` |
| name | varchar(150) | not null |
| floor | varchar(50) | nullable |
| description | text | nullable |
| created_at | timestamptz | not null |
| updated_at | timestamptz | not null |

### maintenance_requests

| Colonne | Type | Contraintes |
| --- | --- | --- |
| id | uuid | primary key |
| organization_id | uuid | foreign key vers `organizations.id` |
| room_id | uuid | foreign key vers `rooms.id` |
| created_by_id | uuid | foreign key vers `users.id` |
| assigned_to_id | uuid | foreign key vers `users.id`, nullable |
| title | varchar(180) | not null |
| description | text | not null |
| priority | varchar(30) | not null |
| status | varchar(30) | not null |
| closed_at | timestamptz | nullable |
| created_at | timestamptz | not null |
| updated_at | timestamptz | not null |

Priorites autorisees:

- `BASSE`
- `NORMALE`
- `HAUTE`
- `URGENTE`

Statuts autorises:

- `NOUVELLE`
- `ASSIGNEE`
- `EN_COURS`
- `TERMINEE`
- `FERMEE`

### interventions

| Colonne | Type | Contraintes |
| --- | --- | --- |
| id | uuid | primary key |
| maintenance_request_id | uuid | foreign key vers `maintenance_requests.id`, unique |
| technician_id | uuid | foreign key vers `users.id` |
| comment | text | nullable |
| started_at | timestamptz | nullable |
| ended_at | timestamptz | nullable |
| cost | numeric(10, 2) | nullable |
| created_at | timestamptz | not null |
| updated_at | timestamptz | not null |

### attachments

| Colonne | Type | Contraintes |
| --- | --- | --- |
| id | uuid | primary key |
| maintenance_request_id | uuid | foreign key vers `maintenance_requests.id` |
| uploaded_by_id | uuid | foreign key vers `users.id` |
| file | varchar(500) | not null |
| file_type | varchar(100) | nullable |
| created_at | timestamptz | not null |
| updated_at | timestamptz | not null |

## Index recommandes

- `users.organization_id`
- `users.email`
- `buildings.organization_id`
- `rooms.building_id`
- `maintenance_requests.organization_id`
- `maintenance_requests.room_id`
- `maintenance_requests.created_by_id`
- `maintenance_requests.assigned_to_id`
- `maintenance_requests.status`
- `maintenance_requests.priority`
- `interventions.technician_id`
- `attachments.maintenance_request_id`

## Regles de coherence

- Un utilisateur appartient a une organisation.
- Un batiment appartient a une organisation.
- Un local appartient a un batiment.
- Une demande appartient a une organisation et a un local.
- `assigned_to_id` doit pointer vers un utilisateur avec le role `TECHNICIEN`.
- Une intervention appartient a une seule demande.
- Une demande fermee doit avoir `closed_at`.
- Une demande au statut `FERMEE` ne doit plus etre modifiee, sauf par action
  administrative future.

