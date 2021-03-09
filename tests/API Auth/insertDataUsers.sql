/*
 * Ce fichier permet de réaliser différentes insertions, en vue du futur test de l'API d'authentification
*/

/* Insertion d'utilisateurs */
INSERT INTO users (idUser, username, pwd, email, role)
VALUES (1, 'user1', 'pwd', 'email@email.email', 'U');

INSERT INTO users (idUser, username, pwd, email, role)
VALUES (2, 'user2', 'pwd', 'email2@email.email', 'U');

INSERT INTO users (idUser, username, pwd, email, role)
VALUES (3, 'user3', 'pwd', 'email3@email.email', 'U');

INSERT INTO users (idUser, username, pwd, email, role)
VALUES (4, 'user4', 'pwd', 'email4@email.email', 'U');

INSERT INTO users (idUser, username, pwd, email, role)
VALUES (5, 'user5', 'pwd', 'email5@email.email', 'U');

INSERT INTO users (idUser, username, pwd, email, role)
VALUES (6, 'admin1', 'pwd', 'email6@email.email', 'A');

INSERT INTO users (idUser, username, pwd, email, role)
VALUES (7, 'admin2', 'pwd', 'email7@email.email', 'A');

INSERT INTO users (idUser, username, pwd, email, role)
VALUES (8, 'admin3', 'pwd', 'email8@email.email', 'A');

/* Insertion de tokens */

INSERT INTO tokens (idToken, idUser, strToken, expirationDate)
VALUES (1, 1, "user1", "2022-02-06");

INSERT INTO tokens (idToken, idUser, strToken, expirationDate)
VALUES (2, 6, "admin1", "2022-02-06");