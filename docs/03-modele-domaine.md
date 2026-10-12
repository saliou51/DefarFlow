# DefarFlow v0.1 - Modele de domaine

## Entites principales

```text
Organisation
  1 --- * Utilisateur
  1 --- * Batiment
  1 --- * DemandeMaintenance

Batiment
  1 --- * Local

Local
  1 --- * DemandeMaintenance

Utilisateur
  role: EMPLOYE | GESTIONNAIRE | TECHNICIEN

DemandeMaintenance
  * --- 1 Organisation
  * --- 1 Local
  * --- 1 Utilisateur (cree_par)
  * --- 0..1 Utilisateur (assignee_a)
  1 --- * PieceJointe
  1 --- 0..1 Intervention

Intervention
  * --- 1 DemandeMaintenance
  * --- 1 Utilisateur (technicien)
```

## Choix de conception pour le MVP

Pour le backend Django, on utilisera probablement un seul modele `User` avec un
champ `role`, plutot que trois tables separees `Employe`, `Gestionnaire` et
`Technicien`.

Raison:

- plus simple a implementer
- plus naturel avec Django
- plus facile pour l'authentification
- suffisant pour la v0.1

Les concepts `Employe`, `Gestionnaire` et `Technicien` resteront des roles
metier. On pourra les representer dans les services, permissions et interfaces.

## Enums

### Role utilisateur

```text
EMPLOYE
GESTIONNAIRE
TECHNICIEN
```

### Statut demande

```text
NOUVELLE
ASSIGNEE
EN_COURS
TERMINEE
FERMEE
```

### Priorite demande

```text
BASSE
NORMALE
HAUTE
URGENTE
```

## Regles metier initiales

- Un utilisateur appartient a une seule organisation dans la v0.1.
- Une demande appartient toujours a une organisation.
- Une demande doit etre liee a un local.
- Une demande peut exister sans technicien assigne.
- Une demande fermee ne peut plus etre modifiee par un employe ou un technicien.
- Un technicien ne voit que les demandes qui lui sont assignees.
- Un employe ne voit que les demandes qu'il a creees.
- Un gestionnaire voit toutes les demandes de son organisation.

