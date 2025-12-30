# 🎮 Lanzz Store - Plateforme E-commerce de Jeux Vidéo

**Lanzz Store** est une application web Full Stack dynamique développée en **Java avec Spring Boot**. Ce projet simule un magasin de jeux vidéo en ligne, permettant aux utilisateurs de consulter un catalogue, de rechercher des jeux, de s'inscrire et de se connecter de manière sécurisée.

Ce projet a été réalisé dans le cadre de ma formation universitaire (L3 Informatique) pour mettre en pratique l'architecture **MVC**, la sécurité web et la gestion de base de données.

---

## 🚀 Fonctionnalités Clés

* **Authentification & Sécurité :**
    * Inscription et Connexion utilisateurs.
    * Hachage des mots de passe avec **BCrypt** (Spring Security).
    * Gestion de session utilisateur (`HttpSession`).
* **Catalogue Dynamique :**
    * Affichage des jeux depuis la base de données.
    * Page de détails pour chaque jeu.
* **Recherche & Filtres :**
    * Système de recherche par nom et par prix.
* **Interface Utilisateur (UI/UX) :**
    * Design moderne "Dark Mode" orienté gaming.
    * Animations CSS (Scroll Reveal, effets au survol).
    * Validation de formulaires côté client (JavaScript).
    * Header "Sticky" et navigation fluide.

---

## 🛠️ Stack Technique

### Backend
* Langage : Java 17+
* Framework : Spring Boot 3
* Architecture : Spring MVC (Model-View-Controller)
* ORM / Data : Spring Data JPA, Hibernate
* Sécurité : Spring Security (PasswordEncoder)

### Frontend
* Vues : JSP (JavaServer Pages)
* Logique Vue : JSTL (Jakarta Standard Tag Library)
* Style : CSS3 (Flexbox, Grid, Animations personnalisées)
* Scripting : JavaScript (Vanilla)

### Base de Données & Outils
* SGBD : PostgreSQL
* Build Tool : Maven
* IDE : Eclipse

---

## 📸 Aperçu du Projet

### Page d'Accueil
> Une interface immersive présentant les jeux populaires et les promotions.
[Page principale screenshots](https://imgur.com/a/7jPdei4)

### Page de Connexion & Inscription
> Formulaires sécurisés avec validation des entrées.
![Login Screenshots](https://imgur.com/a/r4cW2Mr)

### Page de produit
> Présentation détaillée d'un jeu sélectionné : synopsis, prix et options d'achat dans une interface immersive.
![Page produit screenshots]((https://imgur.com/a/15Lnfbu))
---

## ⚙️ Installation et Lancement

Pour lancer ce projet localement sur votre machine :

1.  **Cloner le dépôt :**
    ```bash
    git clone [https://github.com/CeL9Db/ProjectEplatform.git](https://github.com/CeL9Db/ProjectEplatform.git)
    cd ProjectEplatform
    ```

2.  **Configuration de la Base de Données :**
    * Créez une base de données.
    * Mettez à jour le fichier `src/main/resources/application.properties` avec vos identifiants :
    ```properties
    spring.datasource.url=jdbc:mysql://localhost:3306/lanzz_store_db
    spring.datasource.username=votre_username
    spring.datasource.password=votre_password
    spring.jpa.hibernate.ddl-auto=update
    ```

3.  **Lancer l'application :**
    * Via votre environnement de travail : Exécutez la classe `LanzzStoreApplication.java`.

4.  **Accéder au site :**
    Ouvrez votre navigateur sur `http://localhost:'port défini dans les properties'`

---

## 📂 Structure du Projet

```text
src/main/java/com/lanzzStore
├── config/          # Configuration (SecurityConfig)
├── controller/      # Contrôleurs Web (navigation, login/inscription)
├── model/           # Entités JPA (Client, Jeu, Commentaire, Createur, Fournisseur, Type produit, User session, Visuel)
└── interfaces/      # Interfaces d'accès aux données (JPA Repository)

src/main/webapp/WEB-INF
├── style/           # Fichiers CSS
├── icons/           # Images et icônes
└── *.jsp            # Vues JSP (header, footer, login, index...)
