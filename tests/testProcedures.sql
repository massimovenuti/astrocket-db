/*
 Test p_clean_tables : supprime les lignes dont les date d'expiration de token et de fin de ban sont expirées
 Important : les triggers i_users et i_tokens NE doivent PAS exister
 */

/* Utilsateur de test */
INSERT INTO users (idUser, username, pwd, email)
VALUES (1, 'username', 'pwd', 'email@email.email');

INSERT INTO tokens (idToken, idUser, strToken, expirationDate)
VALUES (1, 1, 'strToken', SUBDATE(NOW(), INTERVAL 2 DAY));
INSERT INTO bans (idUser, banEnd)
VALUES (1, SUBDATE(NOW(), INTERVAL 2 DAY));

CALL p_clean_tables();

SELECT *
FROM bans
WHERE idUser = 1;
SELECT *
FROM tokens
WHERE idUser = 1;

/* Suppression utilisateur de test */
DELETE
FROM users
WHERE idUser = 1;