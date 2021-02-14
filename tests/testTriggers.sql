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



