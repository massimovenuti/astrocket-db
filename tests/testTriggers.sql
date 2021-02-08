/***
 Une insertion dans la table users doit créer une entrée dans la table stats avec le même idUser et les autres champs
 initialisés à 0.
 ***/

/* Utilisateur de test */
insert into users (idUser, username, pwd, email, role)
values (1, 'username', 'pwd', 'email@email.email', 'U');

select *
from stats
where idUser = 1;

/* Suppression utilisateur de test */
DELETE
FROM users
WHERE idUser = 1;


/***
 La date d'expiration d'un token doit être valide
 ***/

/* Utilisateur de test */
insert into users (idUser, username, pwd, email, role)
values (1, 'username', 'pwd', 'email@email.email', 'U');

insert into tokens (idToken, idUser, strToken, expirationDate)
values (1, 1, 'hyJuYW1lIjoiV2lraXBlZGlhIiwiaWF0IjoxNTI1Nzc3OTM4fQ', SUBDATE(NOW(), INTERVAL 1 DAY));

/* Suppression utilisateur de test */
DELETE
FROM users
WHERE idUser = 1;


/***
 La date de fin de ban doit être valide : INSERT
 ***/

/* Utilisateur de test */
insert into users (idUser, username, pwd, email, role)
values (1, 'username', 'pwd', 'email@email.email', 'U');

insert into bans (idUser, banEnd)
values (1, SUBDATE(NOW(), INTERVAL 1 DAY));

/* Suppression utilisateur de test */
DELETE
FROM users
WHERE idUser = 1;


/***
 La date de fin de ban doit être valide : UPDATE
 ***/

/* Utilisateur de test */
insert into users (idUser, username, pwd, email, role)
values (1, 'username', 'pwd', 'email@email.email', 'U');

/* Ban de test */
insert into bans (idUser, banEnd)
values (1, ADDDATE(NOW(), INTERVAL 1 DAY));

UPDATE bans
SET banEnd = SUBDATE(NOW(), INTERVAL 2 DAY)
WHERE idUser = 1;

/* Suppression ban de test */
DELETE
FROM bans
where idUser = 1;

/*** Suppression utilisateur de test ***/
DELETE
FROM users
WHERE idUser = 1;