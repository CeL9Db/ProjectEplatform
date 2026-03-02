# Project Eplatform

Project Eplatform is a comprehensive online game sales platform that allows publishers and sellers to list games of all genres (action, RPG, strategy, puzzle, etc.) and enables customers to purchase digital keys/access. The platform aims to provide a fast, secure and user-friendly purchasing experience with advanced search, a complete client area and automated delivery of purchase codes by email.

## Résumé (en français)
Project Eplatform est une plateforme de vente de jeux vidéo en ligne qui accueille tous types de jeux. Les utilisateurs peuvent parcourir un catalogue varié, effectuer des recherches avancées, acheter des clés numériques et retrouver leurs achats dans une page client dédiée. La prochaine mise à jour ajoutera l'intégration PayPal pour le paiement et l'envoi automatisé du code du jeu par email dès que le paiement est confirmé.

## Objectifs principaux
- Proposer un catalogue riche et diversifié de jeux numériques.
- Offrir un parcours d'achat sécurisé et fluide (intégration PayPal prévue).
- Fournir une barre de recherche robuste et avancée pour des recherches complexes.
- Finaliser et améliorer la page client (profil, historique, accès aux codes, support).
- Automatiser l'envoi des codes de jeu par email après confirmation du paiement.

## Fonctionnalités clés
- Catalogue de produits détaillé (description, images, catégories, tags, plateforme, prix).
- Panier et processus de checkout.
- Gestion des comptes utilisateurs (inscription, authentification, profil).
- Interface d'administration pour la gestion des produits et des codes.
- Barre de recherche avancée (suggestions, fuzzy search, filtres, opérateurs).
- Intégration PayPal (à venir) pour le paiement.
- Envoi automatique de codes de jeu par email après paiement confirmé.
- Page client complète (tableau de bord, historique, accès aux codes, support).

## Recherche avancée
La barre de recherche est pensée pour être rapide, tolérante aux fautes et capable de requêtes complexes :
- Autocomplétion et suggestions en temps réel.
- Fuzzy matching (tolérance aux fautes), correction automatique.
- Filtres (genre, plateforme, prix, date de sortie, éditeur, note, langue, PEGI, etc.).
- Opérateurs AND / OR / NOT et recherche par champ (ex: title:"Dark Quest" AND price:<20).
- Tri et facettes pour affiner les résultats.

## Page client
La page client doit offrir :
- Un tableau de bord avec résumé des achats.
- Profil utilisateur et préférences.
- Historique des commandes et statut (pending/paid/code_sent).
- Accès sécurisé aux codes de jeu achetés et instructions d'activation.
- Possibilité de ré-envoyer un code par email (avec contrôles anti-abus).
- Support et FAQ.

## Paiement & livraison de code (workflow)
1. Le client effectue un paiement via PayPal (sandbox en dev).
2. L'ordre est créé en statut "pending".
3. PayPal appelle un webhook sur notre serveur après confirmation.
4. Le webhook vérifie la validité et la signature, puis marque la commande comme "paid".
5. Un code de jeu disponible (GameCode) est réservé/assigné à la commande.
6. Un email transactionnel contenant le code est envoyé au client.
7. Toutes les étapes sont enregistrées dans des logs/audits et un système de retry gère les erreurs d'envoi d'email.

## Emails transactionnels
- Utiliser un provider (SendGrid, Mailgun, Amazon SES, Postmark) pour garantir la délivrabilité.
- Envoi asynchrone via une file de tâches (RabbitMQ/Kafka/Redis queue).
- Template HTML + texte avec instructions et support.

## Modèle de données (extrait)
- users (id, email, password_hash, role, created_at)
- products (id, title, description, price, platform, genre, tags)
- game_codes (id, product_id, code, status, assigned_to_order_id, assigned_to_user_id, created_at, assigned_at)
- orders (id, user_id, total, currency, status, paypal_order_id, created_at, updated_at)
- order_items (id, order_id, product_id, price, quantity)
- emails (id, order_id, to, subject, body, status, sent_at, retries)

## Sécurité & conformité
- Toujours utiliser HTTPS/TLS.
- Validation côté serveur des inputs et protection CSRF/XSS/SQL injection.
- Ne pas stocker d'informations sensibles inutilement.
- Respect RGPD (suppression/droit d'accès) si applicable.

## Technologies et langages utilisés (inférés du dépôt)
Le dépôt contient principalement :
- Java (backend majoritaire)
- CSS (frontend styling)
- JavaScript (frontend interactions)
- Dockerfile (containerisation)

Remarque : je peux analyser les fichiers du dépôt pour lister précisément où chaque technologie est utilisée (par ex. `pom.xml`, dossiers `backend/` et `frontend/`, `Dockerfile`, scripts JS), mais il me faut la permission ou l'accès API si tu veux un mapping fichier-par-fonction exacte.

## Structure suggérée du projet
- /backend - code Java (Spring Boot probable)
- /frontend - code web (HTML/CSS/JS ou framework JS)
- /docs - documentation
- Dockerfile - build image
- README.md - ce fichier

## Installation (général)
1. Cloner le repo
   ```bash
   git clone https://github.com/CeL9Db/ProjectEplatform.git
   cd ProjectEplatform
   ```
2. Backend (Java + Maven)
   ```bash
   mvn clean install
   mvn spring-boot:run
   ```
3. Frontend
   ```bash
   cd frontend
   npm install
   npm start
   ```
4. Docker
   ```bash
   docker build -t project-eplatform .
   docker run -p 8080:8080 project-eplatform
   ```

## Contribution
Contributions bienvenues. Merci de suivre les bonnes pratiques : créer une issue, une branche dédiée, tests et PR avec description claire.

## Licence
Ajouter une LICENSE (MIT recommandée si tu veux permissivité).

## Contact
Pour toute question : ouvrir une issue ou me contacter via le profil GitHub.
