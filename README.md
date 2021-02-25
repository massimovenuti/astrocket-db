# AWBDD

## Déploiement

Afin de déployer la base de données, en ligne de commande, via `mariadb` :
Ouvrez un terminal dans le répertoire contenant les fichiers sql

```
[sudo] mariadb
CREATE DATABASE AWBDD
USE AWBDD
source deploy.sql
```

## Tests

Pour tester le déploiement de votre base de données :
Ouvrez un terminal dans le répertoire contenant les fichiers sql

```
[sudo] mariadb
USE AWBDD
source deployTest.sql
```