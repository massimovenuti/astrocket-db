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
            SELECT 'Test username null : OK' as '';
        END;

        insert into users (idUser, username, pwd, email, role)
        values (1, NULL, 'pwd', 'email@email.email', 'U');
        delete from users where idUser=1;
END;
//


/* username not unique */
DELIMITER //
CREATE OR REPLACE PROCEDURE test_notunique_username()
BEGIN

        DECLARE CONTINUE HANDLER 
                FOR 1062
        BEGIN
            SELECT 'Test username not unique : OK' as '';
        END;

        insert into users (idUser, username, pwd, email, role)
        values (1, 'username', 'pwd', 'email@email.email1', 'U');
        insert into users (idUser, username, pwd, email, role)
        values (2, 'username', 'pwd', 'email@email.email2', 'U');
        delete
        from users
        where username = 'username';
END;
//


/* username starts with number */
/*
DELIMITER //
CREATE OR REPLACE PROCEDURE test_startnumber_username()
BEGIN
        DECLARE CONTINUE HANDLER 
                FOR 
        BEGIN
            SELECT 'Test username start with number : OK' as '';
        END;

        insert into users (idUser, username, pwd, email, role)
        values (1, '1username', 'pwd', 'email@email.email', 'U');
END;
//
*/


/* pwd NULL */
DELIMITER //
CREATE OR REPLACE PROCEDURE test_null_pwd()
BEGIN
        DECLARE CONTINUE HANDLER 
                FOR 1048
        BEGIN
            SELECT 'Test pwd null : OK' as '';
        END;

        insert into users (idUser, username, pwd, email, role)
        values (1, 'username', NULL, 'email@email.email', 'U');
END;
//


/* email NULL */
DELIMITER //
CREATE OR REPLACE PROCEDURE test_null_email()
BEGIN
        DECLARE CONTINUE HANDLER 
                FOR 1048
        BEGIN
            SELECT 'Test email null : OK' as '';
        END;

        insert into users (idUser, username, pwd, email, role)
        values (1, 'username', 'pwd', NULL, 'U');
END;
//


/* email not unique */
DELIMITER //
CREATE OR REPLACE PROCEDURE test_notunique_email()
BEGIN
        DECLARE CONTINUE HANDLER 
                FOR 1062
        BEGIN
            SELECT 'Test email not unique : OK' as '';
        END;

        insert into users (idUser, username, pwd, email, role)
        values (1, 'username1', 'pwd', 'email@email.email', 'U');
        insert into users (idUser, username, pwd, email, role)
        values (1, 'username2', 'pwd', 'email@email.email', 'U');
        delete
        from users
        where username = 'username1';
END;
//


/* email not like ‘%@%.%’ */
/*
DELIMITER //
CREATE OR REPLACE PROCEDURE test_notlike_email()
BEGIN
        DECLARE CONTINUE HANDLER 
                FOR 
        BEGIN
            SELECT 'Test email regex : OK';
        END;

        insert into users (idUser, username, pwd, email, role)
        values (1, 'username', 'pwd', 'email', 'U');
END;
//
*/


/* role NULL */
DELIMITER //
CREATE OR REPLACE PROCEDURE test_null_role()
BEGIN

        DECLARE CONTINUE HANDLER 
                FOR 1048
        BEGIN
            SELECT 'Test role null : OK' as '';
        END;

        insert into users (idUser, username, pwd, email, role)
        values (1, 'username', 'pwd', 'email@email.email', NULL);
END;
//

/***
 Servers
 ***/

/* serverToken NULL */
DELIMITER //
CREATE OR REPLACE PROCEDURE test_null_serverToken()
BEGIN

        DECLARE CONTINUE HANDLER 
                FOR 1048
        BEGIN
            SELECT 'Test serverToken null : OK' as '';
        END;

        INSERT INTO servers (idServer, serverName, serverToken)
        VALUES (0, 'serverName', NULL);
END;
//



/* serverToken not unique */
DELIMITER //
CREATE OR REPLACE PROCEDURE test_notunique_serverToken()
BEGIN
        DECLARE CONTINUE HANDLER 
                FOR 1062
        BEGIN
            SELECT 'Test serverToken not unique : OK' as '';
        END;

        INSERT INTO servers (idServer, serverName, serverToken)
        VALUES (0, 'serverName1', 'serverToken');
        INSERT INTO servers (idServer, serverName, serverToken)
        VALUES (1, 'serverName2', 'serverToken');
        DELETE
        FROM servers
        WHERE idServer = 0;
END;
//


/* serverName NULL */
DELIMITER //
CREATE OR REPLACE PROCEDURE test_null_serverName()
BEGIN

        DECLARE CONTINUE HANDLER 
                FOR 1048
        BEGIN
            SELECT 'Test serverName null : OK' as '';
        END;

        INSERT INTO servers (idServer, serverName, serverToken)
        VALUES (0, NULL, 'serverToken');
END;
//


/* serverName not unique */
DELIMITER //
CREATE OR REPLACE PROCEDURE test_notunique_serverName()
BEGIN
        DECLARE CONTINUE HANDLER 
                FOR 1062
        BEGIN
            SELECT 'Test serverName not unique : OK' as '';
        END;

        INSERT INTO servers (idServer, serverName, serverToken)
        VALUES (0, 'serverName', 'serverToken1');
        INSERT INTO servers (idServer, serverName, serverToken)
        VALUES (1, 'serverName', 'serverToken2');
        DELETE
        FROM servers
        WHERE idServer = 0;
END;
//



/***
 Tokens
 ***/

/* idToken NULL */
DELIMITER //
CREATE OR REPLACE PROCEDURE test_null_idToken()
BEGIN

        DECLARE CONTINUE HANDLER 
                FOR 1048
        BEGIN
            SELECT 'Test idToken null : OK' as '';
        END;

        insert into tokens (idToken, idUser, strToken, expirationDate)
        values (NULL, 1, 'eyJuYW1lIjoiV2lraXBlZGlhIiwiaWF0IjoxNTI1Nzc3OTM4fQ', "2022-02-06");
END;
//


/* idUser NULL */
DELIMITER //
CREATE OR REPLACE PROCEDURE test_null_idUser()
BEGIN

        DECLARE CONTINUE HANDLER 
                FOR 1048
        BEGIN
            SELECT 'Test idUser null : OK' as '';
        END;

        insert into tokens (idToken, idUser, strToken, expirationDate)
        values (1, NULL, 'fyJuYW1lIjoiV2lraXBlZGlhIiwiaWF0IjoxNTI1Nzc3OTM4fQ', "2022-02-06");
END;
//


/* strToken not unique */
DELIMITER //
CREATE OR REPLACE PROCEDURE test_notunique_strToken()
BEGIN
        DECLARE CONTINUE HANDLER 
                FOR 1062
        BEGIN
            SELECT 'Test strToken not unique : OK' as '';
        END;

        insert into tokens (idToken, idUser, strToken, expirationDate)
        values (1, (select idUser from users where username = 'test'),
                'gyJuYW1lIjoiV2lraXBlZGlhIiwiaWF0IjoxNTI1Nzc3OTM4fQ', "2022-02-06");
        insert into tokens (idToken, idUser, strToken, expirationDate)
        values (2, (select idUser from users where username = 'test'),
                'gyJuYW1lIjoiV2lraXBlZGlhIiwiaWF0IjoxNTI1Nzc3OTM4fQ', "2022-02-06");
        delete
        from tokens
        where idToken = 1;
END;
//


/* expirationDate NULL */
DELIMITER //
CREATE OR REPLACE PROCEDURE test_null_expirationDate()
BEGIN

        DECLARE CONTINUE HANDLER 
                FOR 1048
        BEGIN
            SELECT 'Test expirationDate null : OK' as '';
        END;

        insert into tokens (idToken, idUser, strToken, expirationDate)
        values (1, (select idUser from users where username = 'test'),
                'gyJuYW1lIjoiV2lraXBlZGlhIiwiaWF0IjoxNTI1Nzc3OTM4fQ', NULL);
END;
//


/* strToken NULL */
DELIMITER //
CREATE OR REPLACE PROCEDURE test_null_strToken()
BEGIN

        DECLARE CONTINUE HANDLER 
                FOR 1048
        BEGIN
            SELECT 'Test strToken null : OK' as '';
        END;

        insert into tokens (idToken, idUser, strToken, expirationDate)
        values (1, (select idUser from users where username = 'test'), NULL, "2022-02-06");
END;
//

/***
 Bans
 ***/

/*** Utilisateur de test ***/
insert into users (idUser, username, pwd, email, role)
values (1, 'test', 'pwd', 'email@email.email', 'U');

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
values (1, 'test', 'pwd', 'email@email.email', 'U');

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




