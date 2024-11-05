# Atelier Python : Gestion de l'infrastructure de serveurs

Cet atelier a pour objectif de te familiariser avec :

- La gestion de listes et dictionnaires en Python pour organiser les informations de l'infrastructure.
- Les boucles et conditions pour automatiser la surveillance des serveurs.
- La création de fonctions pour simplifier la gestion et le suivi.

## Getting started

Avant de commencer, assure-toi d'avoir Python installé sur ta machine. Si tu rencontres des difficultés à mettre en place l'environnement nécessaire, n'hésite pas à demander de l'aide à ton formateur.

Voici quelques ressources pour t'aider à démarrer :

- [Documentation officielle de Python](https://docs.python.org/3/)
- [Tutoriel sur les structures de données Python](https://docs.python.org/3/tutorial/datastructures.html)

Une fois que tout est prêt, tu peux commencer l'atelier en suivant les étapes ci-dessous.

Bonne pratique !

---

## To-do

### **Étape 1 : Créer une Liste de Serveurs**

Cette étape te permettra de te familiariser avec les listes en Python et d'organiser une liste de serveurs.

- [ ] **1.1** Crée une liste de serveurs avec les noms `"Web01"`, `"DB01"`, `"Cache01"`.
  
  *Indication :* Crée une liste nommée `servers` qui contient ces noms de serveurs.

- [ ] **1.2** Ajoute un nouveau serveur `"Cache02"` à la liste.

  *Indice :* Utilise la méthode `.append()` pour ajouter le serveur.

- [ ] **1.3** Fusionne une nouvelle liste de serveurs `["Web02", "DB02"]` à la liste existante `servers`.

  *Indice :* Utilise l'opérateur `+=` pour ajouter cette nouvelle liste de serveurs.

### **Étape 2 : Suivi de la Charge des Serveurs avec des dictionnaires**

Pour cette étape, tu vas créer un dictionnaire pour surveiller la charge en pourcentage de chaque serveur.

- [ ] **2.1** Crée un dictionnaire `servers_load` associant une harge initiale (en %) poucr chaque serveur. Par exemple : `"Web01": 45`, `"DB01": 60`, `"Cache01": 20`.

  *Indication :* Associe une charge de départ à chaque serveur dans `servers_load`.

- [ ] **2.2** Ajoute une entrée pour `"Cache02"` avec une charge de 50.

  *Indice :* Utilise la syntaxe `dictionary[key] = value`.

- [ ] **2.3** Modifie la charge de `"Web01"` pour qu'elle soit 70.

  *Piste :* Mets à jour l'entrée dans le dictionnaire avec une nouvelle valeur.

### **Étape 3 : Automatiser la Surveillance avec des Boucles**

Dans cette étape, tu vas utiliser des boucles et des conditions pour surveiller automatiquement la charge des serveurs.

- [ ] **3.1** Parcours le dictionnaire `servers_load` et affiche une alerte pour chaque serveur ayant une charge supérieure à 80%.

  *Indication :* Utilise une boucle `for` et une condition `if` pour vérifier chaque charge.

### **Étape 4 : Gestion Dynamique avec des Fonctions**

Les fonctions permettent de structurer ton code et de le rendre réutilisable. Dans cette étape, tu vas créer des fonctions pour gérer et surveiller les serveurs.

- [ ] **4.1** Écris une fonction `add_server(dictionary, server_name, initial_load)` qui ajoute un serveur avec sa charge à un dictionnaire.

  *Indication :* Cette fonction doit recevoir trois paramètres et mettre à jour le dictionnaire `servers_load`.

- [ ] **4.2** Écris une fonction `check_load(dictionary, seuil)` qui parcourt `servers_load` et affiche une alerte pour chaque serveur ayant une charge supérieure au seuil donné.

  *Question d'orientation :* Comment fais-tu pour passer `dictionary.items()` en paramètre dans une fonction ?

- [ ] **4.3** Écris une fonction `load_average(dictionary)` qui retourne la charge moyenne de tous les serveurs.

  *Piste :* Utilise `sum()` pour additionner les valeurs et `len()` pour calculer la moyenne.

### **Étape 5 : Optimiser et Étendre le Suivi avec des Conditions et Boucles Avancées**

Dans cette étape, tu vas approfondir les fonctions pour une gestion avancée des charges, en utilisant des conditions et `match` pour les utilisateurs de Python 3.10+.

- [ ] **5.1** Écris une fonction `average_alert(dictionary, average_threshold)` qui compare la charge moyenne au seuil de charge et affiche un message d'alerte si nécessaire.

  *Indication :* Utilise la fonction `load_average()` de l'étape précédente et compare le résultat au `seuil_moyenne`.

- [ ] **5.2** Crée une fonction `overload_management(server, load)` utilisant `match` (ou `if` pour les versions plus anciennes de Python) pour gérer les niveaux d'alerte suivants :
    - Charge > 90 : affiche une alerte critique.
    - Charge entre 80 et 90 : affiche un message de surveillance.
    - Charge entre 50 et 80 : indique une charge modérée.
    - Charge < 50 : indique une charge normale.

  *Indice :* Utilise `match` pour structurer les différents niveaux de charge ou `if...elif...else` si `match` n'est pas disponible.