/*
 * Ce fichier permet de supprimer toutes les entrées de la table users, relatives aux tests du big Main.
 */

DELETE
FROM users
WHERE username LIKE 'user%' OR username LIKE 'admin%';

DELETE
FROM tokens
WHERE idToken = 1 OR idToken = 2;

DELETE
FROM servers
WHERE serverToken LIKE 'serv%';