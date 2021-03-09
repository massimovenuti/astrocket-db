/*
 * Ce fichier permet de supprimer toutes les entrées de la table stats et users, relatives aux tests de l'API.
 */

DELETE
FROM users
WHERE username LIKE 'stats%';