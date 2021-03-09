/*
 * Ce fichier permet de supprimer toutes les entrées de la table users, relatives aux tests de l'API.
 */

DELETE
FROM users
WHERE username LIKE 'user%' OR username LIKE 'admin%';
