# AWBDD

## Déploiement

Afin de déployer la base de données, en ligne de commande, via `mariadb` :
Ouvrez un terminal à la racine du dépôt

```
[sudo] mariadb
CREATE DATABASE AWBDD
USE AWBDD
source deploy.sql
```

## Tests

### Tests généraux

Pour tester le déploiement de votre base de données :
Ouvrez un terminal dans le répertoire `tests`

```
[sudo] mariadb
USE AWBDD
source deployTest.sql
```


### Test des APIs

Pour insérer des données pour tester l'API d'authentification :
Ouvrez un terminal dans le répertoire `tests`

```
[sudo] mariadb
USE AWBDD
source insertDataUsers.sql
```

Pour insérer des données pour tester l'API de statistiques :
Ouvrez un terminal dans le répertoire `tests`

```
[sudo] mariadb
USE AWBDD
source insertDataStats.sql
```

Pour supprimer les données de test de l'API d'authentification :
Ouvrez un terminal dans le répertoire `tests`

```
[sudo] mariadb
USE AWBDD
source dropDataUsers.sql
```

Pour insérer des données pour tester l'API de statistiques :
Ouvrez un terminal dans le répertoire `tests`

```
[sudo] mariadb
USE AWBDD
source dropDataStats.sql
```
