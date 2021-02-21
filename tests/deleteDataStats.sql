/*
 * Ce fichier permet de supprimer toutes les entrées de la table stats et users, relatives aux tests de l'API.
 */

-- Test (si on supprime bien seulement les stats): INSERT INTO users VALUES (147,'test','pwd','mail@mail.fr','U');
DELETE
FROM users
WHERE username LIKE 'stats%';
-- DELETE FROM users WHERE idUser = 147;