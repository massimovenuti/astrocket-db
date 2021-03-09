/***
 Une insertion dans la table users doit créer une entrée dans la table stats avec le même idUser et les autres champs
 initialisés à 0.
 ***/

DELIMITER //
CREATE OR REPLACE PROCEDURE test_trigger_newUser()
BEGIN
    START TRANSACTION;

    INSERT INTO users (idUser, username, pwd, email, role)
    VALUES (1, 'test', 'pwd', 'email@email.em', 'U');

    SELECT IF((SELECT COUNT(*) FROM stats WHERE idUser = 1), 'Test insert new Stats: OK',
              'Test insert new Stats : FAIL');
    ROLLBACK;
END;
//


/***
 La date d'expiration d'un token doit être valide
 ***/

DELIMITER //
CREATE OR REPLACE PROCEDURE test_trigger_dateToken(string VARCHAR(128))
BEGIN
    DECLARE EXIT HANDLER
        FOR 1644
        BEGIN
            SET string := 'Test date invalide : OK';
            ROLLBACK;
        END;

    START TRANSACTION;

    INSERT INTO users (idUser, username, pwd, email, role)
    VALUES (1, 'test', 'pwd', 'email@email.em', 'U');

    INSERT INTO tokens (idToken, idUser, strToken, expirationDate)
    VALUES (1, 1, 'hyJuYW1lIjoiV2lraXBlZGlhIiwiaWF0IjoxNTI1Nzc3OTM4fQ', (SELECT SUBDATE(NOW(), INTERVAL 1 DAY)));

    SET string := 'Test date invalide : FAIL';
    ROLLBACK;
END;
//

/***
 La date de fin de ban doit être valide : INSERT
 ***/

DELIMITER //
CREATE OR REPLACE PROCEDURE test_trigger_dateBan_insert(string VARCHAR(128))
BEGIN
    DECLARE EXIT HANDLER
        FOR 1644
        BEGIN
            SET string := 'Test date invalide (insert): OK';
            ROLLBACK;
        END;

    START TRANSACTION;

    INSERT INTO users (idUser, username, pwd, email, role)
    VALUES (1, 'test', 'pwd', 'email@email.em', 'U');

    INSERT INTO bans (idUser, banEnd)
    VALUES (1, SUBDATE(NOW(), INTERVAL 1 DAY));

    SET string := 'Test date invalide (insert): FAIL';
    ROLLBACK;
END;
//


/***
 La date de fin de ban doit être valide : UPDATE
 ***/

DELIMITER //
CREATE OR REPLACE PROCEDURE test_trigger_dateBan_update(string VARCHAR(128))
BEGIN
    DECLARE EXIT HANDLER
        FOR 1644
        BEGIN
            SET string := 'Test date invalide (update): OK';
            ROLLBACK;
        END;

    START TRANSACTION;

    INSERT INTO users (idUser, username, pwd, email, role)
    VALUES (1, 'test', 'pwd', 'email@email.em', 'U');

    INSERT INTO bans (idUser, banEnd)
    VALUES (1, ADDDATE(NOW(), INTERVAL 1 DAY));

    UPDATE bans
    SET banEnd = SUBDATE(NOW(), INTERVAL 2 DAY)
    WHERE idUser = 1;

    SET string := 'Test date invalide (update): FAIL';
    ROLLBACK;
END;
//

/***
 La modification des statistiques doit cumuler les statistiques envoyées aux statistiques actuelles
 ***/

DELIMITER //
CREATE OR REPLACE PROCEDURE test_trigger_stats_update()
BEGIN
    START TRANSACTION;

    INSERT INTO users (idUser, username, pwd, email, role)
    VALUES (1, 'test', 'pwd', 'email@email.em', 'U');

    UPDATE stats
    SET nbPoints    = 10000,
        nbKills     = 100,
        nbAsteroids = 1000,
        nbDeaths    = 100,
        nbPowerUps  = 10,
        nbGames     = 1,
        nbWins      = 10,
        maxKills    = 10,
        maxPoints   = 1000,
        maxPowerUps = 1,
        maxDeaths   = 10
    WHERE idUser = 1;

    SELECT IF((SELECT nbPoints FROM stats WHERE idUser = 1) != 10000, 'Update nbPoints : FAIL', 'Update nbPoints : OK');
    SELECT IF((SELECT nbKills FROM stats WHERE idUser = 1) != 100, 'Update nbKills : FAIL', 'Update nbKills : OK');
    SELECT IF((SELECT nbDeaths FROM stats WHERE idUser = 1) != 100, 'Update nbDeaths : FAIL', 'Update nbDeaths : OK');
    SELECT IF((SELECT nbAsteroids FROM stats WHERE idUser = 1) != 1000, 'Update nbAsteroids : FAIL',
              'Update nbAsteroids : OK');
    SELECT IF((SELECT nbGames FROM stats WHERE idUser = 1) != 1, 'Update nbGames : FAIL', 'Update nbGames : OK');
    SELECT IF((SELECT nbPowerUps FROM stats WHERE idUser = 1) != 10, 'Update nbPowerUps : FAIL',
              'Update nbPowerUps : OK');
    SELECT IF((SELECT nbWins FROM stats WHERE idUser = 1) != 10, 'Update nbWins : FAIL', 'Update nbWins : OK');
    SELECT IF((SELECT maxKills FROM stats WHERE idUser = 1) != 10, 'Update maxKills : FAIL', 'Update maxKills : OK');
    SELECT IF((SELECT maxPoints FROM stats WHERE idUser = 1) != 1000, 'Update maxPoints : FAIL',
              'Update maxPoints : OK');
    SELECT IF((SELECT maxPowerUps FROM stats WHERE idUser = 1) != 1, 'Update maxPowerUps : FAIL',
              'Update maxPowerUps : OK');
    SELECT IF((SELECT maxDeaths FROM stats WHERE idUser = 1) != 10, 'Update maxDeaths : FAIL', 'Update maxDeaths : OK');
    ROLLBACK;
END;
//

/***
 Une insertion dans la table ban doit supprimer tout les tokens de l'utilisateur
 ***/

DELIMITER //
CREATE OR REPLACE PROCEDURE test_trigger_newBan()
BEGIN
    START TRANSACTION;

    INSERT INTO users (idUser, username, pwd, email, role)
    VALUES (1, 'test', 'pwd', 'email@email.em', 'U');

    INSERT INTO bans (idUser, banEnd)
    VALUES (1, ADDDATE(NOW(), INTERVAL 1 DAY));

    SELECT IF((SELECT COUNT(*) FROM tokens WHERE idUser = 1), 'Test insert Bans: FAIL', 'Test insert Bans : OK');
    ROLLBACK;
END;
//


