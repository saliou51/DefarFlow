# DefarFlow v0.1 - Cas d'utilisation

## Acteurs

- Employe
- Gestionnaire
- Technicien

## Diagramme textuel

```text
                         DefarFlow
                             |
        +--------------------+--------------------+
        |                    |                    |
     Employe            Gestionnaire          Technicien
        |                    |                    |
        |                    |                    |
  Creer demande       Voir demandes        Voir taches assignees
  Ajouter photo       Filtrer demandes     Demarrer intervention
  Voir mes demandes   Modifier priorite    Ajouter commentaire
  Voir statut         Assigner technicien  Terminer intervention
                       Fermer demande
                       Voir dashboard
```

## UC-01 - Connexion

Acteurs: Employe, Gestionnaire, Technicien

Scenario principal:

1. L'utilisateur saisit son email et son mot de passe.
2. Le systeme verifie les identifiants.
3. Le systeme ouvre une session.
4. L'utilisateur est redirige vers son tableau de bord.

Exceptions:

- email inconnu
- mot de passe incorrect
- compte desactive

## UC-02 - Creer une demande

Acteur principal: Employe

Scenario principal:

1. L'employe ouvre le formulaire de demande.
2. Il choisit le batiment et le local.
3. Il saisit un titre et une description.
4. Il choisit une priorite.
5. Il ajoute une photo optionnelle.
6. Il valide la demande.
7. Le systeme cree une demande au statut `Nouvelle`.

Resultat:

- la demande est visible par le gestionnaire
- l'employe peut suivre son avancement

## UC-03 - Assigner une demande

Acteur principal: Gestionnaire

Scenario principal:

1. Le gestionnaire consulte la liste des demandes.
2. Il ouvre une demande au statut `Nouvelle`.
3. Il choisit un technicien.
4. Le systeme assigne la demande.
5. Le statut passe a `Assignee`.

Resultat:

- le technicien voit la demande dans sa liste

## UC-04 - Demarrer une intervention

Acteur principal: Technicien

Scenario principal:

1. Le technicien ouvre une demande assignee.
2. Il clique sur demarrer.
3. Le systeme cree ou met a jour l'intervention.
4. Le statut de la demande passe a `En cours`.

## UC-05 - Terminer une intervention

Acteur principal: Technicien

Scenario principal:

1. Le technicien ouvre une demande en cours.
2. Il ajoute un commentaire.
3. Il renseigne un cout optionnel.
4. Il marque l'intervention comme terminee.
5. Le statut passe a `Terminee`.

## UC-06 - Fermer une demande

Acteur principal: Gestionnaire

Scenario principal:

1. Le gestionnaire consulte une demande terminee.
2. Il verifie les informations.
3. Il ferme la demande.
4. Le statut passe a `Fermee`.

## UC-07 - Consulter le dashboard

Acteur principal: Gestionnaire

Indicateurs du MVP:

- nombre de demandes ouvertes
- nombre de demandes urgentes
- nombre de demandes terminees ce mois
- temps moyen de resolution
- demandes par priorite
- demandes par statut

