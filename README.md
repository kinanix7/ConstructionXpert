# ConstructionXpert Services 🚧🚀✨

## Description ✨🚀🚧
ConstructionXpert Services est une application web de gestion de projets de construction. Elle permet aux utilisateurs de créer, gérer et visualiser les projets de construction, les tâches associées et les ressources nécessaires. Cette solution offre une interface conviviale pour visualiser, mettre à jour et supprimer des projets tout en assurant une gestion efficace des ressources.

## Fonctionnalités 🚀✨🚧

### Gestion des Projets
- Création d'un nouveau projet avec nom, description, date de début, date de fin et budget.
- Affichage de la liste des projets existants avec leurs détails.
- Mise à jour des détails d'un projet existant.
- Suppression d'un projet.

### Gestion des Tâches
- Création de nouvelles tâches pour un projet avec description, date de début, date de fin et ressources nécessaires.
- Affichage de la liste des tâches associées à un projet.
- Mise à jour des détails d'une tâche.
- Suppression d'une tâche.

### Gestion des Ressources
- Ajout de nouvelles ressources avec nom, type, quantité et informations sur le fournisseur.
- Affichage de la liste des ressources disponibles.
- Mise à jour des détails d'une ressource.
- Suppression d'une ressource.
- Mise à jour automatique de la quantité après assignation à une tâche.

### Fonctionnalités Supplémentaires
- Connexion et déconnexion de l'administrateur.
- Sécurisation des pages accessibles uniquement après connexion.
- Gestion des fournisseurs.

## Conception 🚧✨🚀

### Diagrammes UML
- **Diagramme de Classes**
- <img src="uml/1.png" alt="Class Diagram" width="500">

- **Diagramme de Cas d'Utilisation**
- <img src="uml/2.png" alt="Class Diagram" width="500">

- **Diagramme de Séquence**
- <img src="uml/3.png" alt="Class Diagram" width="500">

## Technologies et Outils Utilisés 🚀🚧✨
- **Langage de Programmation** : Java
- **Framework Web** : Java EE (Servlets, JSP)
- **Base de Données** : MySQL/PostgreSQL
- **JDBC API** : Pour la communication entre l'application et la base de données
- **Serveur d'Application** : Apache Tomcat
- **Frontend** : HTML, CSS (Bootstrap/Tailwind), JavaScript
- **Maquette** : Figma/Adobe XD
- **Gestion de Versions** : Git

## Modalités Pédagogiques ✨🚧🚀
- **Travail** : Individuel
- **Durée de Travail** : 5 jours
- **Date de Lancement** : 17/03/2025 à 09:00
- **Date Limite de Soumission** : 21/03/2025 avant 16h00

## Comment Utiliser l'Application 🚧🚀✨
1. Connectez-vous en tant qu'administrateur pour accéder aux fonctionnalités.
2. Créez un nouveau projet en fournissant tous les détails nécessaires.
3. Ajoutez des tâches associées avec leurs dates et ressources.
4. Gérez les ressources en les ajoutant, modifiant ou supprimant selon les besoins.
5. Consultez et mettez à jour les détails de vos projets, tâches et ressources.
6. Déconnectez-vous une fois le travail terminé pour sécuriser vos données.

## Livrables 🚀✨🚧
- Lien de la planification des tâches (Trello, etc.).
- Support de présentation.
- Lien de la maquette Figma.
- Lien vers le repository GitHub contenant :
  - **README** (description de l'application).
  - **Diagrammes UML** (Classes, Cas d'Utilisation, Séquence).
  - **Code source complet** avec tous les fichiers nécessaires.

## Critères de Performance ✨🚧🚀
- Fonctionnalités complètes et fonctionnelles conformes aux spécifications.
- Interface utilisateur conviviale et responsive.
- Code bien structuré suivant l'architecture MVC et les bonnes pratiques.
- Respect des délais de livraison.


---

## 🏢 Base de Données

### 📊 **Création de la Base de Données**
```sql
-- Création de la base de données
CREATE DATABASE construction_expert;
USE construction_expert;
```

---

### 📋 **Schéma des Tables**

```sql
-- Table Administrateur
CREATE TABLE administrateur (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom_utilisateur VARCHAR(50) NOT NULL UNIQUE,
    mot_de_passe VARCHAR(255) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    date_creation TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table Fournisseur
CREATE TABLE fournisseur (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    contact VARCHAR(100),
    email VARCHAR(100),
    telephone VARCHAR(20),
    adresse TEXT,
    date_creation TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table Projet
CREATE TABLE projet (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    description TEXT,
    date_debut DATE NOT NULL,
    date_fin DATE NOT NULL,
    budget DECIMAL(15, 2) NOT NULL,
    statut ENUM('En attente', 'En cours', 'Terminé', 'Annulé') DEFAULT 'En attente',
    date_creation TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    administrateur_id INT,
    FOREIGN KEY (administrateur_id) REFERENCES administrateur(id)
);

-- Table Tache
CREATE TABLE tache (
    id INT AUTO_INCREMENT PRIMARY KEY,
    description TEXT NOT NULL,
    date_debut DATE NOT NULL,
    date_fin DATE NOT NULL,
    statut ENUM('À faire', 'En cours', 'Terminée') DEFAULT 'À faire',
    projet_id INT NOT NULL,
    date_creation TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (projet_id) REFERENCES projet(id) ON DELETE CASCADE
);

-- Table Ressource
CREATE TABLE ressource (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    type VARCHAR(50) NOT NULL,
    quantite INT NOT NULL,
    unite VARCHAR(20),
    description TEXT,
    fournisseur_id INT,
    date_creation TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (fournisseur_id) REFERENCES fournisseur(id)
);

-- Table de jointure RessourceTache
CREATE TABLE ressource_tache (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tache_id INT NOT NULL,
    ressource_id INT NOT NULL,
    quantite_utilisee INT NOT NULL,
    date_assignation TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (tache_id) REFERENCES tache(id) ON DELETE CASCADE,
    FOREIGN KEY (ressource_id) REFERENCES ressource(id) ON DELETE CASCADE,
    CONSTRAINT unique_ressource_tache UNIQUE (tache_id, ressource_id)
);
```

---

### 🔍 **Données de Test**

```sql
-- Insertion d'un administrateur par défaut
INSERT INTO administrateur (nom_utilisateur, mot_de_passe, email) 
VALUES ('admin', 'admin123', 'admin@constructionexpert.com');

-- Fournisseurs de test
INSERT INTO fournisseur (nom, contact, email, telephone, adresse) VALUES
('Matériaux Construction SA', 'Jean Dupont', 'contact@materiaux-construction.com', '0123456789', '123 Rue des Bâtisseurs, 75001 Paris'),
('Outillage Pro', 'Marie Martin', 'info@outillage-pro.com', '0987654321', '456 Avenue des Outils, 75002 Paris'),
('Bois et Structures', 'Pierre Leroy', 'service@bois-structures.com', '0123987456', '789 Boulevard du Bois, 75003 Paris');

-- Ressources de test
INSERT INTO ressource (nom, type, quantite, unite, description, fournisseur_id) VALUES
('Ciment', 'Matériau', 1000, 'kg', 'Ciment Portland standard', 1),
('Sable', 'Matériau', 5000, 'kg', 'Sable fin pour construction', 1),
('Marteau', 'Outil', 50, 'pièce', 'Marteau de charpentier', 2),
('Bois de charpente', 'Matériau', 200, 'm³', 'Bois traité pour charpente', 3),
('Perceuse', 'Outil', 20, 'pièce', 'Perceuse électrique 18V', 2);
```

---


✅ **N'oubliez pas de pousser vos modifications :**  
```bash
git add README.md
git commit -m "Ajout du script de base de données"
git push origin main
```

---

👉 Si vous avez besoin d'ajustements spécifiques, dites-moi ! 🚀
