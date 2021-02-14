/***
 Users
 ***/

/* username NULL */
DELIMITER //
CREATE OR REPLACE PROCEDURE test_null_username(OUT string VARCHAR(128))
BEGIN
        DECLARE EXIT HANDLER 
                FOR 1048
        BEGIN
            SET string := 'Test username null : OK';
        END;

        insert into users (idUser, username, pwd, email, role)
        values (1, NULL, 'pwd', 'email@email.email', 'U');

        SET string := 'Test username null : FAIL';
END;
//


/* username not unique */
DELIMITER //
CREATE OR REPLACE PROCEDURE test_notunique_username(OUT string VARCHAR(128))
BEGIN

        DECLARE EXIT HANDLER 
                FOR 1062
        BEGIN
            SET string := 'Test username not unique : OK';
        END;
        

        insert into users (idUser, username, pwd, email, role)
        values (1, 'username', 'pwd', 'email@email.email1', 'U');
        insert into users (idUser, username, pwd, email, role)
        values (2, 'username', 'pwd', 'email@email.email2', 'U');

        SET string := 'Test username not unique : FAIL';
END;
//


/* username starts with number */
/*
DELIMITER //
CREATE OR REPLACE PROCEDURE test_startnumber_username(OUT string VARCHAR(128))
BEGIN
        DECLARE EXIT HANDLER 
                FOR 
        BEGIN
            SET string := 'Test username start with number : OK';
        END;

        insert into users (idUser, username, pwd, email, role)
        values (1, '1username', 'pwd', 'email@email.email', 'U');
END;
//
*/


/* pwd NULL */
DELIMITER //
CREATE OR REPLACE PROCEDURE test_null_pwd(OUT string VARCHAR(128))
BEGIN
        DECLARE EXIT HANDLER 
                FOR 1048
        BEGIN
            SET string := 'Test pwd null : OK';
        END;

        insert into users (idUser, username, pwd, email, role)
        values (1, 'username', NULL, 'email@email.email', 'U');
        SET string := 'Test username not unique : FAIL';
END;
//


/* email NULL */
DELIMITER //
CREATE OR REPLACE PROCEDURE test_null_email(OUT string VARCHAR(128))
BEGIN
        DECLARE EXIT HANDLER 
                FOR 1048
        BEGIN
            SET string := 'Test email null : OK';
        END;

        insert into users (idUser, username, pwd, email, role)
        values (1, 'username', 'pwd', NULL, 'U');
        SET string := 'Test email null : FAIL';
END;
//


/* email not unique */
DELIMITER //
CREATE OR REPLACE PROCEDURE test_notunique_email(OUT string VARCHAR(128))
BEGIN
        DECLARE EXIT HANDLER 
                FOR 1062
        BEGIN
            SET string := 'Test email not unique : OK';
        END;

        insert into users (idUser, username, pwd, email, role)
        values (1, 'username1', 'pwd', 'email@email.email', 'U');
        insert into users (idUser, username, pwd, email, role)
        values (1, 'username2', 'pwd', 'email@email.email', 'U');
        delete
        from users
        where username = 'username1';
        SET string := 'Test email not unique : FAIL';
END;
//


/* email not like ‘%@%.%’ */
/*
DELIMITER //
CREATE OR REPLACE PROCEDURE test_notlike_email(OUT string VARCHAR(128))
BEGIN
        DECLARE EXIT HANDLER 
                FOR 
        BEGIN
            SET string := 'Test email regex : OK';
        END;

        insert into users (idUser, username, pwd, email, role)
        values (1, 'username', 'pwd', 'email', 'U');
END;
//
*/


/* role NULL */
DELIMITER //
CREATE OR REPLACE PROCEDURE test_null_role(OUT string VARCHAR(128))
BEGIN

        DECLARE EXIT HANDLER 
                FOR 1048
        BEGIN
            SET string := 'Test role null : OK';
        END;

        insert into users (idUser, username, pwd, email, role)
        values (1, 'username', 'pwd', 'email@email.email', NULL);
        SET string := 'Test role null : FAIL';
END;
//

/***
 Servers
 ***/

/* serverToken NULL */
DELIMITER //
CREATE OR REPLACE PROCEDURE test_null_serverToken(OUT string VARCHAR(128))
BEGIN

        DECLARE EXIT HANDLER 
                FOR 1048
        BEGIN
            SET string := 'Test serverToken null : OK';
        END;

        INSERT INTO servers (idServer, serverName, serverToken)
        VALUES (0, 'serverName', NULL);
        SET string := 'Test serverToken null : FAIL';
END;
//



/* serverToken not unique */
DELIMITER //
CREATE OR REPLACE PROCEDURE test_notunique_serverToken(OUT string VARCHAR(128))
BEGIN
        DECLARE EXIT HANDLER 
                FOR 1062
        BEGIN
            SET string := 'Test serverToken not unique : OK';
        END;

        INSERT INTO servers (idServer, serverName, serverToken)
        VALUES (0, 'serverName1', 'serverToken');
        INSERT INTO servers (idServer, serverName, serverToken)
        VALUES (1, 'serverName2', 'serverToken');
        DELETE
        FROM servers
        WHERE idServer = 0;
        SET string := 'Test serverToken not unique : FAIL';
END;
//


/* serverName NULL */
DELIMITER //
CREATE OR REPLACE PROCEDURE test_null_serverName(OUT string VARCHAR(128))
BEGIN

        DECLARE EXIT HANDLER 
                FOR 1048
        BEGIN
            SET string := 'Test serverName null : OK';
        END;

        INSERT INTO servers (idServer, serverName, serverToken)
        VALUES (0, NULL, 'serverToken');
        SET string := 'Test serverName null : FAIL';
END;
//


/* serverName not unique */
DELIMITER //
CREATE OR REPLACE PROCEDURE test_notunique_serverName(OUT string VARCHAR(128))
BEGIN
        DECLARE EXIT HANDLER 
                FOR 1062
        BEGIN
            SET string := 'Test serverName not unique : OK';
        END;

        INSERT INTO servers (idServer, serverName, serverToken)
        VALUES (0, 'serverName', 'serverToken1');
        INSERT INTO servers (idServer, serverName, serverToken)
        VALUES (1, 'serverName', 'serverToken2');
        DELETE
        FROM servers
        WHERE idServer = 0;
        SET string := 'Test serverName not unique : FAIL';
END;
//



/***
 Tokens
 ***/

/* idToken NULL */
DELIMITER //
CREATE OR REPLACE PROCEDURE test_null_idToken(OUT string VARCHAR(128))
BEGIN

        DECLARE EXIT HANDLER 
                FOR 1048
        BEGIN
            SET string := 'Test idToken null : OK';
        END;

        insert into tokens (idToken, idUser, strToken, expirationDate)
        values (NULL, 1, 'eyJuYW1lIjoiV2lraXBlZGlhIiwiaWF0IjoxNTI1Nzc3OTM4fQ', "2022-02-06");
        SET string := 'Test idToken null : FAIL';
END;
//


/* idUser NULL */
DELIMITER //
CREATE OR REPLACE PROCEDURE test_null_idUser(OUT string VARCHAR(128))
BEGIN

        DECLARE EXIT HANDLER 
                FOR 1048
        BEGIN
            SET string := 'Test idUser null : OK';
        END;

        insert into tokens (idToken, idUser, strToken, expirationDate)
        values (1, NULL, 'fyJuYW1lIjoiV2lraXBlZGlhIiwiaWF0IjoxNTI1Nzc3OTM4fQ', "2022-02-06");
        SET string := 'Test idUser null : FAIL';
END;
//


/* strToken not unique */
DELIMITER //
CREATE OR REPLACE PROCEDURE test_notunique_strToken(OUT string VARCHAR(128))
BEGIN
        DECLARE EXIT HANDLER 
                FOR 1062
        BEGIN
            SET string := 'Test strToken not unique : OK';
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
        SET string := 'Test strToken not unique : FAIL';
END;
//


/* expirationDate NULL */
DELIMITER //
CREATE OR REPLACE PROCEDURE test_null_expirationDate(OUT string VARCHAR(128))
BEGIN

        DECLARE EXIT HANDLER 
                FOR 1048
        BEGIN
            SET string := 'Test expirationDate null : OK';
        END;

        insert into tokens (idToken, idUser, strToken, expirationDate)
        values (1, (select idUser from users where username = 'test'),
                'gyJuYW1lIjoiV2lraXBlZGlhIiwiaWF0IjoxNTI1Nzc3OTM4fQ', NULL);
        SET string := 'Test expirationDate null : FAIL';
END;
//


/* strToken NULL */
DELIMITER //
CREATE OR REPLACE PROCEDURE test_null_strToken(OUT string VARCHAR(128))
BEGIN

        DECLARE EXIT HANDLER 
                FOR 1048
        BEGIN
            SET string := 'Test strToken null : OK';
        END;

        insert into tokens (idToken, idUser, strToken, expirationDate)
        values (1, (select idUser from users where username = 'test'), NULL, "2022-02-06");
        SET string := 'Test strToken null : FAIL';
END;
//

/***
 Bans
 ***/

/* idUser NULL */
DELIMITER //
CREATE OR REPLACE PROCEDURE test_null_idUserBan(OUT string VARCHAR(128))
BEGIN

        DECLARE EXIT HANDLER 
                FOR 1048
        BEGIN
            SET string := 'Test idUser null : OK';
        END;

        insert into bans (idUser, banEnd)
        values (NULL, "2022-02-06");
        SET string := 'Test idUser null : FAIL';
END;
//


/* banEnd NULL */
DELIMITER //
CREATE OR REPLACE PROCEDURE test_null_banEnd(OUT string VARCHAR(128))
BEGIN

        DECLARE EXIT HANDLER 
                FOR 1048
        BEGIN
            SET string := 'Test banEnd null : OK';
        END;

        insert into bans (idUser, banEnd)
        values ((select idUser from users where username = 'test'), NULL);
        SET string := 'Test banEnd null : FAIL';
END;
//

/***
  Stats
 ***/

/* idUser not null */
DELIMITER //
CREATE OR REPLACE PROCEDURE test_null_idUserStats(OUT string VARCHAR(128))
BEGIN

        DECLARE EXIT HANDLER 
                FOR 1048
        BEGIN
            SET string := 'Test idUser null : OK';
        END;

        insert into stats
        values (NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
        SET string := 'Test idUser null : FAIL';
END;
//


/* nbPoints >= 0 */
DELIMITER //
CREATE OR REPLACE PROCEDURE test_greater0_nbPoints(OUT string VARCHAR(128))
BEGIN

        DECLARE EXIT HANDLER 
                FOR 4022
        BEGIN
            SET string := 'Test nbPoints >= 0 : OK';
        END;

        insert into users (idUser, username, pwd, email, role)
        values (1, 'test', 'pwd', 'email@email.email', 'U');

        insert into stats
        values ((select idUser from users where username = 'test'), -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
        SET string := 'Test nbPoints >= 0 : FAIL';
END;
//

/* nbKills >= 0 */
DELIMITER //
CREATE OR REPLACE PROCEDURE test_greater0_nbKills(OUT string VARCHAR(128))
BEGIN

        DECLARE EXIT HANDLER 
                FOR 4022
        BEGIN
            SET string := 'Test nbKills >= 0 : OK';
        END;


        insert into users (idUser, username, pwd, email, role)
        values (1, 'test', 'pwd', 'email@email.email', 'U');
        insert into stats
        values ((select idUser from users where username = 'test'), 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0);
        SET string := 'Test nbKills >= 0 : FAIL';
END;
//


/* nbAsteroids >= 0 */
DELIMITER //
CREATE OR REPLACE PROCEDURE test_greater0_nbAsteroids(OUT string VARCHAR(128))
BEGIN

        DECLARE EXIT HANDLER 
                FOR 4022
        BEGIN
            SET string := 'Test nbAsteroids >= 0 : OK';
        END;

        insert into users (idUser, username, pwd, email, role)
        values (1, 'test', 'pwd', 'email@email.email', 'U');
        insert into stats
        values ((select idUser from users where username = 'test'), 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0);
        SET string := 'Test nbAsteroids >= 0 : FAIL';
END;
//


/* nbDeaths >= 0 */
DELIMITER //
CREATE OR REPLACE PROCEDURE test_greater0_nbDeaths(OUT string VARCHAR(128))
BEGIN

        DECLARE EXIT HANDLER 
                FOR 4022
        BEGIN
            SET string := 'Test nbDeaths >= 0 : OK';
        END;

        insert into users (idUser, username, pwd, email, role)
        values (1, 'test', 'pwd', 'email@email.email', 'U');
        insert into stats
        values ((select idUser from users where username = 'test'), 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0);
        SET string := 'Test nbDeaths >= 0 : FAIL';
END;
//


/* nbPowerUps >= 0 */
DELIMITER //
CREATE OR REPLACE PROCEDURE test_greater0_nbPowersUps(OUT string VARCHAR(128))
BEGIN

        DECLARE EXIT HANDLER 
                FOR 4022
        BEGIN
            SET string := 'Test nbPowersUps >= 0 : OK';
        END;

        insert into users (idUser, username, pwd, email, role)
        values (1, 'test', 'pwd', 'email@email.email', 'U');
        insert into stats
        values ((select idUser from users where username = 'test'), 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0);
        SET string := 'Test nbPowersUps >= 0 : FAIL';
END;
//


/* nbGames >= 0 */
DELIMITER //
CREATE OR REPLACE PROCEDURE test_greater0_nbGames(OUT string VARCHAR(128))
BEGIN

        DECLARE EXIT HANDLER 
                FOR 4022
        BEGIN
            SET string := 'Test nbGames >= 0 : OK';
        END;

        insert into users (idUser, username, pwd, email, role)
        values (1, 'test', 'pwd', 'email@email.email', 'U');
        insert into stats
        values ((select idUser from users where username = 'test'), 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0);
        SET string := 'Test nbGames >= 0 : FAIL';
END;
//


/* nbWins >= 0 */
DELIMITER //
CREATE OR REPLACE PROCEDURE test_greater0_nbWins(OUT string VARCHAR(128))
BEGIN

        DECLARE EXIT HANDLER 
                FOR 4022
        BEGIN
            SET string := 'Test nbWins >= 0 : OK';
        END;

        insert into users (idUser, username, pwd, email, role)
        values (1, 'test', 'pwd', 'email@email.email', 'U');
        insert into stats
        values ((select idUser from users where username = 'test'), 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0);
        SET string := 'Test nbWins >= 0 : FAIL';
END;
//


/* maxKills >= 0 */
DELIMITER //
CREATE OR REPLACE PROCEDURE test_greater0_maxKills(OUT string VARCHAR(128))
BEGIN

        DECLARE EXIT HANDLER 
                FOR 4022
        BEGIN
            SET string := 'Test maxKills >= 0 : OK';
        END;

        insert into users (idUser, username, pwd, email, role)
        values (1, 'test', 'pwd', 'email@email.email', 'U');
        insert into stats
        values ((select idUser from users where username = 'test'), 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0);
        SET string := 'Test maxKills >= 0 : FAIL';
END;
//

/* maxPoints >= 0 */
DELIMITER //
CREATE OR REPLACE PROCEDURE test_greater0_maxPoints(OUT string VARCHAR(128))
BEGIN

        DECLARE EXIT HANDLER 
                FOR 4022
        BEGIN
            SET string := 'Test maxPoints >= 0 : OK';
        END;

        insert into users (idUser, username, pwd, email, role)
        values (1, 'test', 'pwd', 'email@email.email', 'U');
        insert into stats
        values ((select idUser from users where username = 'test'), 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0);
        SET string := 'Test maxPoints >= 0 : FAIL';
END;
//


/* maxPowersUps >= 0 */
DELIMITER //
CREATE OR REPLACE PROCEDURE test_greater0_maxPowersUp(OUT string VARCHAR(128))
BEGIN

        DECLARE EXIT HANDLER 
                FOR 4022
        BEGIN
            SET string := 'Test maxPowersUps >= 0 : OK';
        END;

        insert into users (idUser, username, pwd, email, role)
        values (1, 'test', 'pwd', 'email@email.email', 'U');
        insert into stats
        values ((select idUser from users where username = 'test'), 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0);
        SET string := 'Test maxPowersUps >= 0 : FAIL';
END;
//


/* maxDeaths >= 0 */
DELIMITER //
CREATE OR REPLACE PROCEDURE test_greater0_maxDeaths(OUT string VARCHAR(128))
BEGIN

        DECLARE EXIT HANDLER 
                FOR 4022
        BEGIN
            SET string := 'Test maxDeaths >= 0 : OK';
        END;

        insert into users (idUser, username, pwd, email, role)
        values (1, 'test', 'pwd', 'email@email.email', 'U');
        insert into stats
        values ((select idUser from users where username = 'test'), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1);
        SET string := 'Test maxDeaths >= 0 : FAIL';
END;
//


/* nbPoints not NULL */
DELIMITER //
CREATE OR REPLACE PROCEDURE test_null_nbPoints(OUT string VARCHAR(128))
BEGIN

        DECLARE EXIT HANDLER 
                FOR 1048
        BEGIN
            SET string := 'Test nbPoints null : OK';
        END;

        insert into users (idUser, username, pwd, email, role)
        values (1, 'test', 'pwd', 'email@email.email', 'U');
        insert into stats
        values ((select idUser from users where username = 'test'), NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
        SET string := 'Test nbPoints null : FAIL';
END;
//


/* nbKills not NULL */
DELIMITER //
CREATE OR REPLACE PROCEDURE test_null_nbKills(OUT string VARCHAR(128))
BEGIN

        DECLARE EXIT HANDLER 
                FOR 1048
        BEGIN
            SET string := 'Test nbKills null : OK';
        END;

        insert into users (idUser, username, pwd, email, role)
        values (1, 'test', 'pwd', 'email@email.email', 'U');
        insert into stats
        values ((select idUser from users where username = 'test'), 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0);
        SET string := 'Test nbKills null : FAIL';
END;
//


/* nbAsteroids not NULL */
DELIMITER //
CREATE OR REPLACE PROCEDURE test_null_nbAsteroids(OUT string VARCHAR(128))
BEGIN

        DECLARE EXIT HANDLER 
                FOR 1048
        BEGIN
            SET string := 'Test nbAsteroids null : OK';
        END;

        insert into users (idUser, username, pwd, email, role)
        values (1, 'test', 'pwd', 'email@email.email', 'U');
        insert into stats
        values ((select idUser from users where username = 'test'), 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0);
        SET string := 'Test nbAsteroids null : FAIL';
END;
//

/* nbDeaths not NULL */
DELIMITER //
CREATE OR REPLACE PROCEDURE test_null_nbDeaths(OUT string VARCHAR(128))
BEGIN

        DECLARE EXIT HANDLER 
                FOR 1048
        BEGIN
            SET string := 'Test nbDeaths null : OK';
        END;

        insert into users (idUser, username, pwd, email, role)
        values (1, 'test', 'pwd', 'email@email.email', 'U');
        insert into stats
        values ((select idUser from users where username = 'test'), 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
        SET string := 'Test nbDeaths null : FAIL';
END;
//


/* nbPowerUps not NULL */
DELIMITER //
CREATE OR REPLACE PROCEDURE test_null_nbPowersUps(OUT string VARCHAR(128))
BEGIN

        DECLARE EXIT HANDLER 
                FOR 1048
        BEGIN
            SET string := 'Test nbPowersUps null : OK';
        END;

        insert into users (idUser, username, pwd, email, role)
        values (1, 'test', 'pwd', 'email@email.email', 'U');
        insert into stats
        values ((select idUser from users where username = 'test'), 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0);
        SET string := 'Test nbPowersUps null : FAIL';
END;
//


/* nbGames not NULL */
DELIMITER //
CREATE OR REPLACE PROCEDURE test_null_nbGames(OUT string VARCHAR(128))
BEGIN

        DECLARE EXIT HANDLER 
                FOR 1048
        BEGIN
            SET string := 'Test nbGames null : OK';
        END;

        insert into users (idUser, username, pwd, email, role)
        values (1, 'test', 'pwd', 'email@email.email', 'U');
        insert into stats
        values ((select idUser from users where username = 'test'), 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0);
        SET string := 'Test nbGames null : FAIL';
END;
//


/* nbWins not NULL */
DELIMITER //
CREATE OR REPLACE PROCEDURE test_null_nbWins(OUT string VARCHAR(128))
BEGIN

        DECLARE EXIT HANDLER 
                FOR 1048
        BEGIN
            SET string := 'Test nbWins null : OK';
        END;

        insert into users (idUser, username, pwd, email, role)
        values (1, 'test', 'pwd', 'email@email.email', 'U');
        insert into stats
        values ((select idUser from users where username = 'test'), 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0);
        SET string := 'Test nbWins null : FAIL';
END;
//


/* maxKills not NULL */
DELIMITER //
CREATE OR REPLACE PROCEDURE test_null_maxKills(OUT string VARCHAR(128))
BEGIN

        DECLARE EXIT HANDLER 
                FOR 1048
        BEGIN
            SET string := 'Test maxKills null : OK';
        END;

        insert into users (idUser, username, pwd, email, role)
        values (1, 'test', 'pwd', 'email@email.email', 'U');
        insert into stats
        values ((select idUser from users where username = 'test'), 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0);
        SET string := 'Test maxKills null : FAIL';
END;
//


/* maxPoints not NULL */
DELIMITER //
CREATE OR REPLACE PROCEDURE test_null_maxPoints(OUT string VARCHAR(128))
BEGIN

        DECLARE EXIT HANDLER 
                FOR 1048
        BEGIN
            SET string := 'Test maxPoints null : OK';
        END;

        insert into users (idUser, username, pwd, email, role)
        values (1, 'test', 'pwd', 'email@email.email', 'U');
        insert into stats
        values ((select idUser from users where username = 'test'), 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0);
        SET string := 'Test maxPoints null : FAIL';
END;
//


/* maxPowersUps not NULL */
DELIMITER //
CREATE OR REPLACE PROCEDURE test_null_maxPowersUp(OUT string VARCHAR(128))
BEGIN

        DECLARE EXIT HANDLER 
                FOR 1048
        BEGIN
            SET string := 'Test maxPowersUps null : OK';
        END;

        insert into users (idUser, username, pwd, email, role)
        values (1, 'test', 'pwd', 'email@email.email', 'U');
        insert into stats
        values ((select idUser from users where username = 'test'), 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0);
        SET string := 'Test maxPowersUps null : FAIL';
END;
//


/* maxDeaths not NULL */
DELIMITER //
CREATE OR REPLACE PROCEDURE test_null_maxDeaths(OUT string VARCHAR(128))
BEGIN

        DECLARE EXIT HANDLER 
                FOR 1048
        BEGIN
            SET string := 'Test maxDeaths null : OK';
        END;

        insert into users (idUser, username, pwd, email, role)
        values (1, 'test', 'pwd', 'email@email.email', 'U');
        insert into stats
        values ((select idUser from users where username = 'test'), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL);
        SET string := 'Test maxDeaths null : FAIL';
END;
//





