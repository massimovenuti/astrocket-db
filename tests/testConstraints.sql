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

        INSERT INTO users (idUser, username, pwd, email, role)
        VALUES (1, NULL, 'pwd', 'email@email.email', 'U');

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
            ROLLBACK;
        END;

        START TRANSACTION;

        INSERT INTO users (idUser, username, pwd, email, role)
        VALUES (1, 'username', 'pwd', 'email@email.email1', 'U');
        INSERT INTO users (idUser, username, pwd, email, role)
        VALUES (2, 'username', 'pwd', 'email@email.email2', 'U');

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

        INSERT INTO users (idUser, username, pwd, email, role)
        VALUES (1, '1username', 'pwd', 'email@email.email', 'U');
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

        START TRANSACTION;
        INSERT INTO users (idUser, username, pwd, email, role)
        VALUES (1, 'username', NULL, 'email@email.email', 'U');  
        SET string := 'Test username not unique : FAIL';
        ROLLBACK;


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

        INSERT INTO users (idUser, username, pwd, email, role)
        VALUES (1, 'username', 'pwd', NULL, 'U');
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
            ROLLBACK;
        END;

        START TRANSACTION;
        INSERT INTO users (idUser, username, pwd, email, role)
        VALUES (1, 'username1', 'pwd', 'email@email.email', 'U');
        INSERT INTO users (idUser, username, pwd, email, role)
        VALUES (1, 'username2', 'pwd', 'email@email.email', 'U');
        
        SET string := 'Test email not unique : FAIL';
        ROLLBACK;
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

        INSERT INTO users (idUser, username, pwd, email, role)
        VALUES (1, 'username', 'pwd', 'email', 'U');
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

        INSERT INTO users (idUser, username, pwd, email, role)
        VALUES (1, 'username', 'pwd', 'email@email.email', NULL);
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

        START TRANSACTION;
        INSERT INTO servers (idServer, serverName, serverToken)
        VALUES (0, 'serverName1', 'serverToken');
        INSERT INTO servers (idServer, serverName, serverToken)
        VALUES (1, 'serverName2', 'serverToken');
        SET string := 'Test serverToken not unique : FAIL';
        ROLLBACK;
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
            ROLLBACK;
        END;

        START TRANSACTION;
        INSERT INTO servers (idServer, serverName, serverToken)
        VALUES (0, 'serverName', 'serverToken1');
        INSERT INTO servers (idServer, serverName, serverToken)
        VALUES (1, 'serverName', 'serverToken2');
        DELETE FROM servers WHERE idServer = 0;
        SET string := 'Test serverName not unique : FAIL';
        ROLLBACK;
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
            ROLLBACK;
        END;

        START TRANSACTION;
        INSERT INTO users (idUser, username, pwd, email, role)
        VALUES (1, 'test', 'pwd', 'email@email.email', 'U');

        INSERT INTO tokens (idToken, idUser, strToken, expirationDate)
        VALUES (NULL, 1, 'eyJuYW1lIjoiV2lraXBlZGlhIiwiaWF0IjoxNTI1Nzc3OTM4fQ', "2022-02-06");
        SET string := 'Test idToken null : FAIL';
        ROLLBACK;
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

        INSERT INTO tokens (idToken, idUser, strToken, expirationDate)
        VALUES (1, NULL, 'fyJuYW1lIjoiV2lraXBlZGlhIiwiaWF0IjoxNTI1Nzc3OTM4fQ', "2022-02-06");
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
            ROLLBACK;
        END;

        START TRANSACTION;
        INSERT INTO users (idUser, username, pwd, email, role)
        VALUES (1, 'test', 'pwd', 'email@email.email', 'U');

        INSERT INTO tokens (idToken, idUser, strToken, expirationDate)
        VALUES (1, 1, 'gyJuYW1lIjoiV2lraXBlZGlhIiwiaWF0IjoxNTI1Nzc3OTM4fQ', "2022-02-06");
        INSERT INTO tokens (idToken, idUser, strToken, expirationDate)
        VALUES (2, 1, 'gyJuYW1lIjoiV2lraXBlZGlhIiwiaWF0IjoxNTI1Nzc3OTM4fQ', "2022-02-06");
        SET string := 'Test strToken not unique : FAIL';
        ROLLBACK;
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
            ROLLBACK;
        END;

        START TRANSACTION;
        INSERT INTO users (idUser, username, pwd, email, role)
        VALUES (1, 'test', 'pwd', 'email@email.email', 'U');

        INSERT INTO tokens (idToken, idUser, strToken, expirationDate)
        VALUES (1, 1, 'gyJuYW1lIjoiV2lraXBlZGlhIiwiaWF0IjoxNTI1Nzc3OTM4fQ', NULL);
        SET string := 'Test expirationDate null : FAIL';
        ROLLBACK;
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
            ROLLBACK;
        END;

        START TRANSACTION;
        INSERT INTO users (idUser, username, pwd, email, role)
        VALUES (1, 'test', 'pwd', 'email@email.email', 'U');

        INSERT INTO tokens (idToken, idUser, strToken, expirationDate)
        VALUES (1, 1, NULL, "2022-02-06");
        SET string := 'Test strToken null : FAIL';
        ROLLBACK;
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

        INSERT INTO bans (idUser, banEnd)
        VALUES (NULL, "2022-02-06");
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
            ROLLBACK;
        END;

        START TRANSACTION;
        INSERT INTO users (idUser, username, pwd, email, role)
        VALUES (1, 'test', 'pwd', 'email@email.email', 'U');

        INSERT INTO bans (idUser, banEnd)
        VALUES (1, NULL);
        SET string := 'Test banEnd null : FAIL';
        ROLLBACK;
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

        INSERT INTO stats
        VALUES (NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
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
            ROLLBACK;
        END;

        START TRANSACTION;
        INSERT INTO users (idUser, username, pwd, email, role)
        VALUES (1, 'test', 'pwd', 'email@email.email', 'U');

        UPDATE stats
        SET nbPoints = -1, 
            nbKills = 0,
            nbAsteroids =  0, 
            nbDeaths = 0, 
            nbPowerUps = 0, 
            nbGames = 0,
            nbWins = 0,
            maxKills = 0, 
            maxPoints = 0,
            maxPowerUps = 0, 
            maxDeaths = 0
        WHERE idUser = 1;

        SET string := 'Test nbPoints >= 0 : FAIL';
        ROLLBACK;

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
            ROLLBACK;
        END;

        START TRANSACTION;
        INSERT INTO users (idUser, username, pwd, email, role)
        VALUES (1, 'test', 'pwd', 'email@email.email', 'U');

        UPDATE stats
        SET nbPoints = 0, 
            nbKills = -1,
            nbAsteroids =  0, 
            nbDeaths = 0, 
            nbPowerUps = 0, 
            nbGames = 0,
            nbWins = 0,
            maxKills = 0, 
            maxPoints = 0,
            maxPowerUps = 0, 
            maxDeaths = 0
        WHERE idUser = 1;

        SET string := 'Test nbKills >= 0 : FAIL';
        ROLLBACK;
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
            ROLLBACK;
        END;

        START TRANSACTION;
        INSERT INTO users (idUser, username, pwd, email, role)
        VALUES (1, 'test', 'pwd', 'email@email.email', 'U');

        UPDATE stats
        SET nbPoints = 0, 
            nbKills = 0,
            nbAsteroids = -1, 
            nbDeaths = 0, 
            nbPowerUps = 0, 
            nbGames = 0,
            nbWins = 0,
            maxKills = 0, 
            maxPoints = 0,
            maxPowerUps = 0, 
            maxDeaths = 0
        WHERE idUser = 1;

        SET string := 'Test nbAsteroids >= 0 : FAIL';
        ROLLBACK;
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
            ROLLBACK;
        END;

        START TRANSACTION;
        INSERT INTO users (idUser, username, pwd, email, role)
        VALUES (1, 'test', 'pwd', 'email@email.email', 'U');

        UPDATE stats
        SET nbPoints = 0, 
            nbKills = 0,
            nbAsteroids = 0, 
            nbDeaths = -1, 
            nbPowerUps = 0, 
            nbGames = 0,
            nbWins = 0,
            maxKills = 0, 
            maxPoints = 0,
            maxPowerUps = 0, 
            maxDeaths = 0
        WHERE idUser = 1;

        SET string := 'Test nbDeaths >= 0 : FAIL';
        ROLLBACK;
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
            ROLLBACK;
        END;

        START TRANSACTION;
        INSERT INTO users (idUser, username, pwd, email, role)
        VALUES (1, 'test', 'pwd', 'email@email.email', 'U');

        UPDATE stats
        SET nbPoints = 0, 
            nbKills = 0,
            nbAsteroids = 0, 
            nbDeaths = 0, 
            nbPowerUps = -1, 
            nbGames = 0,
            nbWins = 0,
            maxKills = 0, 
            maxPoints = 0,
            maxPowerUps = 0, 
            maxDeaths = 0
        WHERE idUser = 1;

        SET string := 'Test nbPowersUps >= 0 : FAIL';
        ROLLBACK;
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
            ROLLBACK;
        END;

        START TRANSACTION;
        INSERT INTO users (idUser, username, pwd, email, role)
        VALUES (1, 'test', 'pwd', 'email@email.email', 'U');

        UPDATE stats
        SET nbPoints = 0, 
            nbKills = 0,
            nbAsteroids = 0, 
            nbDeaths = 0, 
            nbPowerUps = 0, 
            nbGames = -1,
            nbWins = 0,
            maxKills = 0, 
            maxPoints = 0,
            maxPowerUps = 0, 
            maxDeaths = 0
        WHERE idUser = 1;

        SET string := 'Test nbGames >= 0 : FAIL';
        ROLLBACK;
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
            ROLLBACK;
        END;

        START TRANSACTION;
        INSERT INTO users (idUser, username, pwd, email, role)
        VALUES (1, 'test', 'pwd', 'email@email.email', 'U');
        UPDATE stats
        SET nbPoints = 0, 
            nbKills = 0,
            nbAsteroids = 0, 
            nbDeaths = 0, 
            nbPowerUps = 0, 
            nbGames = 0,
            nbWins = -1,
            maxKills = 0, 
            maxPoints = 0,
            maxPowerUps = 0, 
            maxDeaths = 0
        WHERE idUser = 1;

        SET string := 'Test nbWins >= 0 : FAIL';
        ROLLBACK;
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
            ROLLBACK;
        END;

        START TRANSACTION;
        INSERT INTO users (idUser, username, pwd, email, role)
        VALUES (1, 'test', 'pwd', 'email@email.email', 'U');

        UPDATE stats
        SET nbPoints = 0, 
            nbKills = 0,
            nbAsteroids = 0, 
            nbDeaths = 0, 
            nbPowerUps = 0, 
            nbGames = 0,
            nbWins = 0,
            maxKills = -1, 
            maxPoints = 0,
            maxPowerUps = 0, 
            maxDeaths = 0
        WHERE idUser = 1;

        SET string := 'Test maxKills >= 0 : FAIL';
        ROLLBACK;
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
            ROLLBACK;
        END;

        START TRANSACTION;
        INSERT INTO users (idUser, username, pwd, email, role)
        VALUES (1, 'test', 'pwd', 'email@email.email', 'U');

        UPDATE stats
        SET nbPoints = 0, 
            nbKills = 0,
            nbAsteroids = 0, 
            nbDeaths = 0, 
            nbPowerUps = 0, 
            nbGames = 0,
            nbWins = 0,
            maxKills = 0, 
            maxPoints = -1,
            maxPowerUps = 0, 
            maxDeaths = 0
        WHERE idUser = 1;

        SET string := 'Test maxPoints >= 0 : FAIL';
        ROLLBACK;
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
            ROLLBACK;
        END;

        START TRANSACTION;
        INSERT INTO users (idUser, username, pwd, email, role)
        VALUES (1, 'test', 'pwd', 'email@email.email', 'U');

        UPDATE stats
        SET nbPoints = 0, 
            nbKills = 0,
            nbAsteroids = 0, 
            nbDeaths = 0, 
            nbPowerUps = 0, 
            nbGames = 0,
            nbWins = 0,
            maxKills = 0, 
            maxPoints = 0,
            maxPowerUps = -1, 
            maxDeaths = 0
        WHERE idUser = 1;

        SET string := 'Test maxPowersUps >= 0 : FAIL';
        ROLLBACK;
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
            ROLLBACK;
        END;

        START TRANSACTION;
        INSERT INTO users (idUser, username, pwd, email, role)
        VALUES (1, 'test', 'pwd', 'email@email.email', 'U');

        UPDATE stats
        SET nbPoints = 0, 
            nbKills = 0,
            nbAsteroids = 0, 
            nbDeaths = 0, 
            nbPowerUps = 0, 
            nbGames = 0,
            nbWins = 0,
            maxKills = 0, 
            maxPoints = 0,
            maxPowerUps = 0, 
            maxDeaths = -1
        WHERE idUser = 1;

        SET string := 'Test maxDeaths >= 0 : FAIL';
        ROLLBACK;
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
            ROLLBACK;
        END;

        START TRANSACTION;
        INSERT INTO users (idUser, username, pwd, email, role)
        VALUES (1, 'test', 'pwd', 'email@email.email', 'U');

        UPDATE stats
        SET nbPoints = NULL, 
            nbKills = 0,
            nbAsteroids = 0, 
            nbDeaths = 0, 
            nbPowerUps = 0, 
            nbGames = 0,
            nbWins = 0,
            maxKills = 0, 
            maxPoints = 0,
            maxPowerUps = 0, 
            maxDeaths = 0
        WHERE idUser = 1;

        SET string := 'Test nbPoints null : FAIL';
        ROLLBACK;
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
            ROLLBACK;
        END;

        START TRANSACTION;
        INSERT INTO users (idUser, username, pwd, email, role)
        VALUES (1, 'test', 'pwd', 'email@email.email', 'U');

        UPDATE stats
        SET nbPoints = 0, 
            nbKills = NULL,
            nbAsteroids = 0, 
            nbDeaths = 0, 
            nbPowerUps = 0, 
            nbGames = 0,
            nbWins = 0,
            maxKills = 0, 
            maxPoints = 0,
            maxPowerUps = 0, 
            maxDeaths = 0
        WHERE idUser = 1;

        SET string := 'Test nbKills null : FAIL';
        ROLLBACK;
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
            ROLLBACK;
        END;

        START TRANSACTION;
        INSERT INTO users (idUser, username, pwd, email, role)
        VALUES (1, 'test', 'pwd', 'email@email.email', 'U');

        UPDATE stats
        SET nbPoints = 0, 
            nbKills = 0,
            nbAsteroids = NULL, 
            nbDeaths = 0, 
            nbPowerUps = 0, 
            nbGames = 0,
            nbWins = 0,
            maxKills = 0, 
            maxPoints = 0,
            maxPowerUps = 0, 
            maxDeaths = 0
        WHERE idUser = 1;

        SET string := 'Test nbAsteroids null : FAIL';
        ROLLBACK;
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
            ROLLBACK;
        END;

        START TRANSACTION;
        INSERT INTO users (idUser, username, pwd, email, role)
        VALUES (1, 'test', 'pwd', 'email@email.email', 'U');

        UPDATE stats
        SET nbPoints = 0, 
            nbKills = 0,
            nbAsteroids = 0, 
            nbDeaths = NULL, 
            nbPowerUps = 0, 
            nbGames = 0,
            nbWins = 0,
            maxKills = 0, 
            maxPoints = 0,
            maxPowerUps = 0, 
            maxDeaths = 0
        WHERE idUser = 1;

        SET string := 'Test nbDeaths null : FAIL';
        ROLLBACK;
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
            ROLLBACK;
        END;

        START TRANSACTION;
        INSERT INTO users (idUser, username, pwd, email, role)
        VALUES (1, 'test', 'pwd', 'email@email.email', 'U');

        UPDATE stats
        SET nbPoints = 0, 
            nbKills = 0,
            nbAsteroids = 0, 
            nbDeaths = 0, 
            nbPowerUps = NULL, 
            nbGames = 0,
            nbWins = 0,
            maxKills = 0, 
            maxPoints = 0,
            maxPowerUps = 0, 
            maxDeaths = 0
        WHERE idUser = 1;

        SET string := 'Test nbPowersUps null : FAIL';
        ROLLBACK;
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
            ROLLBACK;
        END;

        START TRANSACTION;
        INSERT INTO users (idUser, username, pwd, email, role)
        VALUES (1, 'test', 'pwd', 'email@email.email', 'U');

        UPDATE stats
        SET nbPoints = 0, 
            nbKills = 0,
            nbAsteroids = 0, 
            nbDeaths = 0, 
            nbPowerUps = 0, 
            nbGames = NULL,
            nbWins = 0,
            maxKills = 0, 
            maxPoints = 0,
            maxPowerUps = 0, 
            maxDeaths = 0
        WHERE idUser = 1;

        SET string := 'Test nbGames null : FAIL';
        ROLLBACK;
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
            ROLLBACK;
        END;

        START TRANSACTION;
        INSERT INTO users (idUser, username, pwd, email, role)
        VALUES (1, 'test', 'pwd', 'email@email.email', 'U');

        UPDATE stats
        SET nbPoints = 0, 
            nbKills = 0,
            nbAsteroids = 0, 
            nbDeaths = 0, 
            nbPowerUps = 0, 
            nbGames = 0,
            nbWins = NULL,
            maxKills = 0, 
            maxPoints = 0,
            maxPowerUps = 0, 
            maxDeaths = 0
        WHERE idUser = 1;

        SET string := 'Test nbWins null : FAIL';
        ROLLBACK;
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
            ROLLBACK;
        END;

        START TRANSACTION;
        INSERT INTO users (idUser, username, pwd, email, role)
        VALUES (1, 'test', 'pwd', 'email@email.email', 'U');

        UPDATE stats
        SET nbPoints = 0, 
            nbKills = 0,
            nbAsteroids = 0, 
            nbDeaths = 0, 
            nbPowerUps = 0, 
            nbGames = 0,
            nbWins = 0,
            maxKills = NULL, 
            maxPoints = 0,
            maxPowerUps = 0, 
            maxDeaths = 0
        WHERE idUser = 1;

        SET string := 'Test maxKills null : FAIL';
        ROLLBACK;
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
            ROLLBACK;
        END;

        START TRANSACTION;
        INSERT INTO users (idUser, username, pwd, email, role)
        VALUES (1, 'test', 'pwd', 'email@email.email', 'U');

        UPDATE stats
        SET nbPoints = 0, 
            nbKills = 0,
            nbAsteroids = 0, 
            nbDeaths = 0, 
            nbPowerUps = 0, 
            nbGames = 0,
            nbWins = 0,
            maxKills = 0, 
            maxPoints = NULL,
            maxPowerUps = 0, 
            maxDeaths = 0
        WHERE idUser = 1;

        SET string := 'Test maxPoints null : FAIL';
        ROLLBACK;
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
            ROLLBACK;
        END;

        START TRANSACTION;
        INSERT INTO users (idUser, username, pwd, email, role)
        VALUES (1, 'test', 'pwd', 'email@email.email', 'U');

        UPDATE stats
        SET nbPoints = 0, 
            nbKills = 0,
            nbAsteroids = 0, 
            nbDeaths = 0, 
            nbPowerUps = 0, 
            nbGames = 0,
            nbWins = 0,
            maxKills = 0, 
            maxPoints = 0,
            maxPowerUps = NULL, 
            maxDeaths = 0
        WHERE idUser = 1;

        SET string := 'Test maxPowersUps null : FAIL';
        ROLLBACK;
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
            ROLLBACK;
        END;

        START TRANSACTION;
        INSERT INTO users (idUser, username, pwd, email, role)
        VALUES (1, 'test', 'pwd', 'email@email.email', 'U');

        UPDATE stats
        SET nbPoints = 0, 
            nbKills = 0,
            nbAsteroids = 0, 
            nbDeaths = 0, 
            nbPowerUps = 0, 
            nbGames = 0,
            nbWins = 0,
            maxKills = 0, 
            maxPoints = 0,
            maxPowerUps = 0, 
            maxDeaths = NULL
        WHERE idUser = 1;

        SET string := 'Test maxDeaths null : FAIL';
        ROLLBACK;
END;
//





