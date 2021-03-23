/*
 * Ce fichier permet de réaliser différentes insertions, en vue du futur test du big Main
*/

/* Insertion d'utilisateurs */
INSERT INTO users (idUser, username, pwd, email, role)
VALUES (1, 'user1', 'pwd', 'email@email.email', 'U');

INSERT INTO users (idUser, username, pwd, email, role)
VALUES (2, 'admin1', 'pwd', 'email2@email.email', 'U');

/* Insertion de tokens */
INSERT INTO tokens (idToken, idUser, strToken, expirationDate)
VALUES (1, 1, "user1", "2022-02-06");

INSERT INTO tokens (idToken, idUser, strToken, expirationDate)
VALUES (2, 6, "admin1", "2022-02-06");

/* Insertion d'un serveur */
INSERT INTO servers (idServer, serverName, serverToken)
VALUES (1, "Orion", "servOrion");

INSERT INTO servers (idServer, serverName, serverToken)
VALUES (2, "Andromède", "servAndromède");

INSERT INTO servers (idServer, serverName, serverToken)
VALUES (3, "Pégase", "servPégase");