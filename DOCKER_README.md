### 1. Cloner et accéder au projet
```bash
git clone <repository>
cd ProjectEplatform
```

### 2. lancer l'appli
```powershell
docker-compose up --build
```

### 3. dans le navigateur
```
http://localhost:8080
```

### info utile
- La base de données se crée automatiquement
- Les tables se créent via Hibernate
- Créez un compte via **Register**

### enregistrement d'un nouveau compte
**Page**: http://localhost:8080/registerPage
- Email, pseudo, mot de passe
- Le mot de passe est automatiquement chiffré

### se connecter
**Page**: http://localhost:8080/loginPage
- Email et mot de passe

### pgAdmin4 (données pour se connecter)
```
Host:     localhost
Port:     5432
User:     postgres
Password: 1234
Database: register
```

## commandes utiles

| Commande | Action |
|----------|--------|
| `docker-compose up --build` | démarrer l'appli |
| `docker-compose down` | arrêter l'appli |
| `docker-compose down -v` | réinitialiser |
| `docker-compose restart app` | redémarrer seulement l'appli |
| `docker-compose logs app` | logs |