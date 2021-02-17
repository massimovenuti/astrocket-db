/***
 Une insertion dans la table users doit créer une entrée dans la table stats avec le même idUser et les autres champs
 initialisés à 0.
 ***/

DELIMITER //
CREATE OR REPLACE PROCEDURE test_trigger_newUser()
BEGIN
    SELECT IF ((SELECT COUNT(*) FROM stats WHERE idUser = 1),'Test insert new Stats: OK','Test insert new Stats : FAIL');
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
    END;

    insert into tokens (idToken, idUser, strToken, expirationDate)
    values (1, 1, 'hyJuYW1lIjoiV2lraXBlZGlhIiwiaWF0IjoxNTI1Nzc3OTM4fQ',(select SUBDATE(NOW(), INTERVAL 1 DAY)));
    SET string := 'Test date invalide : FAIL';
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
    END;
    insert into bans (idUser, banEnd)
    values (1, SUBDATE(NOW(), INTERVAL 1 DAY));
    SET string := 'Test date invalide (insert): FAIL';
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
    END;


    UPDATE bans
    SET banEnd = SUBDATE(NOW(), INTERVAL 2 DAY)
    WHERE idUser = 1;

    SET string := 'Test date invalide (update): FAIL';
END;
//

/***
 La modification des statistiques doit cumuler les statistiques envoyées aux statistiques actuelles
 ***/

DELIMITER //
CREATE OR REPLACE PROCEDURE test_trigger_stats_update()
BEGIN

    insert into users (idUser, username, pwd, email, role)
        values (1, 'test', 'pwd', 'email@email.email', 'U');

    update stats
    SET nbPoints = 10000, 
        nbKills = 100,
        nbAsteroids =  1000, 
        nbDeaths = 100, 
        nbPowerUps = 10, 
        nbGames = 1,
        nbWins = 10,
        maxKills = 10, 
        maxPoints = 1000,
        maxPowerUps =  1, 
        maxDeaths = 10
    WHERE idUser = 1;

    SELECT IF ((select nbPoints from stats where idUser = 1) != 10000, 'Update nbPoints : FAIL', 'Update nbPoints : OK');
    SELECT IF ((select nbKills from stats where idUser = 1) != 100, 'Update nbKills : FAIL', 'Update nbKills : OK');
    SELECT IF ((select nbDeaths from stats where idUser = 1) != 100, 'Update nbDeaths : FAIL', 'Update nbDeaths : OK');
    SELECT IF ((select nbAsteroids from stats where idUser = 1) != 1000, 'Update nbAsteroids : FAIL', 'Update nbAsteroids : OK');
    SELECT IF ((select nbGames from stats where idUser = 1) != 1, 'Update nbGames : FAIL', 'Update nbGames : OK');
    SELECT IF ((select nbPowerUps from stats where idUser = 1) != 10, 'Update nbPowerUps : FAIL', 'Update nbPowerUps : OK');
    SELECT IF ((select nbWins from stats where idUser = 1) != 10, 'Update nbWins : FAIL', 'Update nbWins : OK');
    SELECT IF ((select maxKills from stats where idUser = 1) != 10, 'Update maxKills : FAIL', 'Update maxKills : OK');
    SELECT IF ((select maxPoints from stats where idUser = 1) != 1000, 'Update maxPoints : FAIL', 'Update maxPoints : OK');
    SELECT IF ((select maxPowerUps from stats where idUser = 1) != 1, 'Update maxPowerUps : FAIL', 'Update maxPowerUps : OK');
    SELECT IF ((select maxDeaths from stats where idUser = 1) != 10, 'Update maxDeaths : FAIL', 'Update maxDeaths : OK');

    delete from users where idUser = 1;

END;
//



