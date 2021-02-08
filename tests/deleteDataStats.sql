/*
 * Ce fichier permet de supprimer toutes les entrées de la table stats et users, relatives aux tests de l'API.
 */

-- Test (si on supprime bien seulement les stats): insert into users values (147,'test','pwd','mail@mail.fr','U');
delete
from users
where username like 'stats%';
-- delete from users where idUser = 147;