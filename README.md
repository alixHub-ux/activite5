# 📝 Activité 5 — Application Flutter de Gestion des Rédacteurs

Ce projet Flutter a pour objectif de créer une **application mobile simple** permettant de gérer des rédacteurs (ajout, affichage, modification et suppression) en utilisant une **base de données locale SQLite** avec le package `sqflite`.

---

## 🚀 Fonctionnalités principales

L’application permet de :

- ➕ **Ajouter un rédacteur** avec son nom, prénom et adresse e-mail  
- 🧾 **Afficher la liste** des rédacteurs enregistrés  
- ✏️ **Modifier** les informations d’un rédacteur à partir d’une boîte de dialogue  
- ❌ **Supprimer** un rédacteur avec une boîte de confirmation  
- 💾 **Persister les données** localement grâce à SQLite (les données restent même après la fermeture de l’application)

---

## 🏗️ Structure du projet
activite5/
├── lib/
│ ├── main.dart # Point d’entrée principal
│ ├── modele/
│ │ └── redacteur.dart # Modèle de données (classe Redacteur)
│ └── database/
│ └── database_manager.dart # Gestion de la base SQLite (CRUD)
├── pubspec.yaml # Dépendances du projet
└── README.md # Documentation du projet

---

## ⚙️ Dépendances utilisées

Les principales dépendances sont :
```yaml
dependencies:
  flutter:
    sdk: flutter
  sqflite: ^2.3.0
  path: ^1.8.3


Pour les installer : flutter pub get

Instructions d’exécution
1️⃣ Cloner le projet
git clone https://github.com/<ton-nom-utilisateur>/activite5.git
cd activite5

2️⃣ Installer les dépendances
flutter pub get

3️⃣ Lancer l’application
flutter run
💡 Assure-toi d’avoir un émulateur ou un appareil connecté.


📚 Points techniques clés

Base de données locale : SQLite (grâce à sqflite)

Architecture MVC simple :
Modèle : Redacteur
Contrôleur/Service : DatabaseManager
Vue : RedacteurInterface (interface utilisateur)
Gestion d’état : setState() pour rafraîchir la liste après chaque opération
