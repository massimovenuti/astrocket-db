/***
 Users
 ***/

/* username NULL */
DELIMITER //
CREATE OR REPLACE PROCEDURE test_null_username()
BEGIN
        DECLARE CONTINUE HANDLER 
                FOR 1048
        BEGIN
            SELECT 'Test username null : OK';
        END;

        insert into users (idUser, username, pwd, email, role)
        values (NEXTVAL(s_users), NULL, 'pwd', 'email@email.email', 'U');
END;
//
DELIMITER

/* username not unique */
DELIMITER //
CREATE OR REPLACE PROCEDURE test_notunique_username()
BEGIN

        DECLARE CONTINUE HANDLER 
                FOR 1169
        BEGIN
            SELECT 'Test username not unique : OK';
        END;

        insert into users (idUser, username, pwd, email, role)
        values (NEXTVAL(s_users), 'username', 'pwd', 'email@email.email1', 'U');
        insert into users (idUser, username, pwd, email, role)
        values (NEXTVAL(s_users), 'username', 'pwd', 'email@email.email2', 'U');
        delete
        from users
        where username = 'username';
END;
//
DELIMITER

/* username starts with number */
DELIMITER //
CREATE OR REPLACE PROCEDURE test_startnumber_username()
BEGIN
        DECLARE CONTINUE HANDLER 
                FOR 
        BEGIN
            SELECT 'Test username start with number : OK';
        END;

        insert into users (idUser, username, pwd, email, role)
        values (NEXTVAL(s_users), '1username', 'pwd', 'email@email.email', 'U');
END;
//
DELIMITER

/* pwd NULL */
DELIMITER //
CREATE OR REPLACE PROCEDURE test_null_pwd()
BEGIN
        DECLARE CONTINUE HANDLER 
                FOR 1048
        BEGIN
            SELECT 'Test pwd null : OK';
        END;

        insert into users (idUser, username, pwd, email, role)
        values (NEXTVAL(s_users), 'username', NULL, 'email@email.email', 'U');
END;
//
DELIMITER

/* email NULL */
DELIMITER //
CREATE OR REPLACE PROCEDURE test_null_email()
BEGIN
        DECLARE CONTINUE HANDLER 
                FOR 1048
        BEGIN
            SELECT 'Test email null : OK';
        END;

        insert into users (idUser, username, pwd, email, role)
        values (NEXTVAL(s_users), 'username', 'pwd', NULL, 'U');
END;
//
DELIMITER

/* email not unique */
DELIMITER //
CREATE OR REPLACE PROCEDURE test_notunique_email()
BEGIN
        DECLARE CONTINUE HANDLER 
                FOR 1169
        BEGIN
            SELECT 'Test email not unique : OK';
        END;

        insert into users (idUser, username, pwd, email, role)
        values (NEXTVAL(s_users), 'username1', 'pwd', 'email@email.email', 'U');
        insert into users (idUser, username, pwd, email, role)
        values (NEXTVAL(s_users), 'username2', 'pwd', 'email@email.email', 'U');
        delete
        from users
        where username = 'username1';
END;
//
DELIMITER

/* email not like ‘%@%.%’ */
DELIMITER //
CREATE OR REPLACE PROCEDURE test_notlike_email()
BEGIN
        DECLARE CONTINUE HANDLER 
                FOR 
        BEGIN
            SELECT 'Test email regex : OK';
        END;

        insert into users (idUser, username, pwd, email, role)
        values (NEXTVAL(s_users), 'username', 'pwd', 'email', 'U');
END;
//
DELIMITER

/* role NULL */
DELIMITER //
CREATE OR REPLACE PROCEDURE test_null_role()
BEGIN

        DECLARE CONTINUE HANDLER 
                FOR 1048
        BEGIN
            SELECT 'Test role null : OK';
        END;

        insert into users (idUser, username, pwd, email, role)
        values (NEXTVAL(s_users), 'username', 'pwd', 'email@email.email', NULL);
END;
//
DELIMITER


/***
 Servers
 ***/

/* serverToken NULL */
INSERT INTO servers (idServer, serverName, serverToken)
VALUES (0, 'serverName', NULL);

/* serverToken not unique */
INSERT INTO servers (idServer, serverName, serverToken)
VALUES (0, 'serverName1', 'serverToken');
INSERT INTO servers (idServer, serverName, serverToken)
VALUES (1, 'serverName2', 'serverToken');
DELETE
FROM servers
WHERE idServer = 0;

/* serverName NULL */
INSERT INTO servers (idServer, serverName, serverToken)
VALUES (0, NULL, 'serverToken');

/* serverName not unique */
INSERT INTO servers (idServer, serverName, serverToken)
VALUES (0, 'serverName', 'serverToken1');
INSERT INTO servers (idServer, serverName, serverToken)
VALUES (1, 'serverName', 'serverToken2');
DELETE
FROM servers
WHERE idServer = 0;


/***
 Tokens
 ***/

/* idToken NULL */
insert into users (idUser, username, pwd, email, role)
values (NEXTVAL(s_users), 'test', 'pwd', 'email@email.email', 'U');
insert into tokens (idToken, idUser, strToken, expirationDate)
values (NULL, 1, 'eyJuYW1lIjoiV2lraXBlZGlhIiwiaWF0IjoxNTI1Nzc3OTM4fQ', "2022-02-06");
delete
from users
where username = 'test';

/* idUser NULL */
insert into tokens (idToken, idUser, strToken, expirationDate)
values (NEXTVAL(s_tokens), NULL, 'fyJuYW1lIjoiV2lraXBlZGlhIiwiaWF0IjoxNTI1Nzc3OTM4fQ', "2022-02-06");

/*** INSERT pour tester les conditions suivantes ***/
insert into users (idUser, username, pwd, email, role)
values (NEXTVAL(s_users), 'test', 'pwd', 'email@email.email', 'U');

/* strToken not unique */
insert into tokens (idToken, idUser, strToken, expirationDate)
values (NEXTVAL(s_tokens), (select idUser from users where username = 'test'),
        'gyJuYW1lIjoiV2lraXBlZGlhIiwiaWF0IjoxNTI1Nzc3OTM4fQ', "2022-02-06");
insert into tokens (idToken, idUser, strToken, expirationDate)
values (NEXTVAL(s_tokens), (select idUser from users where username = 'test'),
        'gyJuYW1lIjoiV2lraXBlZGlhIiwiaWF0IjoxNTI1Nzc3OTM4fQ', "2022-02-06");
delete
from tokens
where strToken = 'gyJuYW1lIjoiV2lraXBlZGlhIiwiaWF0IjoxNTI1Nzc3OTM4fQ';

/* expirationDate NULL */
insert into tokens (idToken, idUser, strToken, expirationDate)
values (NEXTVAL(s_tokens), (select idUser from users where username = 'test'),
        'gyJuYW1lIjoiV2lraXBlZGlhIiwiaWF0IjoxNTI1Nzc3OTM4fQ', NULL);

/* strToken NULL */
insert into tokens (idToken, idUser, strToken, expirationDate)
values (NEXTVAL(s_tokens), (select idUser from users where username = 'test'), NULL, "2022-02-06");

/*** Suppression utilisateur de test ***/
delete
from users
where username = 'test';


/***
 Bans
 ***/

/*** Utilisateur de test ***/
insert into users (idUser, username, pwd, email, role)
values (NEXTVAL(s_users), 'test', 'pwd', 'email@email.email', 'U');

/* idUser NULL */
insert into bans (idUser, banEnd)
values (NULL, "2022-02-06");

/* banEnd NULL */
insert into bans (idUser, banEnd)
values ((select idUser from users where username = 'test'), NULL);

/*** Suppression utilisateur de test ***/
delete
from users
where username = 'test';


/***
  Stats
 ***/

/*** Utilisateur de test ***/
insert into users (idUser, username, pwd, email, role)
values (NEXTVAL(s_users), 'test', 'pwd', 'email@email.email', 'U');

/* idUser not null */
insert into stats
values (NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

/* nbPoints >= 0 */
insert into stats
values ((select idUser from users where username = 'test'), -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
/*** Le select permet de retrouver dynamiquement la valeur de l'utilisateur test, afin de ne pas avoir à changer manuellement cette valeur ***/

/* nbKills >= 0 */
insert into stats
values ((select idUser from users where username = 'test'), 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0);

/* nbAsteroids >= 0 */
insert into stats
values ((select idUser from users where username = 'test'), 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0);

/* nbDeaths >= 0 */
insert into stats
values ((select idUser from users where username = 'test'), 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0);

/* nbPowerUps >= 0 */
insert into stats
values ((select idUser from users where username = 'test'), 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0);

/* nbGames >= 0 */
insert into stats
values ((select idUser from users where username = 'test'), 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0);

/* nbWins >= 0 */
insert into stats
values ((select idUser from users where username = 'test'), 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0);

/* maxKills >= 0 */
insert into stats
values ((select idUser from users where username = 'test'), 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0);

/* maxPoints >= 0 */
insert into stats
values ((select idUser from users where username = 'test'), 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0);

/* maxPowersUps >= 0 */
insert into stats
values ((select idUser from users where username = 'test'), 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0);

/* maxDeaths >= 0 */
insert into stats
values ((select idUser from users where username = 'test'), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1);

/* nbPoints not NULL */
insert into stats
values ((select idUser from users where username = 'test'), NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

/* nbKills not NULL */
insert into stats
values ((select idUser from users where username = 'test'), 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0);

/* nbAsteroids not NULL */
insert into stats
values ((select idUser from users where username = 'test'), 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0);

/* nbDeaths not NULL */
insert into stats
values ((select idUser from users where username = 'test'), 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0);

/* nbPowerUps not NULL */
insert into stats
values ((select idUser from users where username = 'test'), 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0);

/* nbGames not NULL */
insert into stats
values ((select idUser from users where username = 'test'), 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0);

/* nbWins not NULL */
insert into stats
values ((select idUser from users where username = 'test'), 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0);

/* maxKills not NULL */
insert into stats
values ((select idUser from users where username = 'test'), 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0);

/* maxPoints not NULL */
insert into stats
values ((select idUser from users where username = 'test'), 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0);

/* maxPowersUps not NULL */
insert into stats
values ((select idUser from users where username = 'test'), 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0);

/* maxDeaths not NULL */
insert into stats
values ((select idUser from users where username = 'test'), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL);

/*** Suppression utilisateur de test ***/
delete
from users
where username = 'test';
