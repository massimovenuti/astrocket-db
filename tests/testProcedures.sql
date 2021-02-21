/*
 Test p_clean_tables : supprime les lignes dont les date d'expiration de token et de fin de ban sont expirées
 Important : les triggers i_users et i_tokens NE doivent PAS exister
 */

DELIMITER //
CREATE OR REPLACE PROCEDURE test_clean_tables()
BEGIN

    START TRANSACTION;
    INSERT INTO users (idUser, username, pwd, email)
    VALUES (1, 'username', 'pwd', 'email@email.email');

    INSERT INTO tokens (idToken, idUser, strToken, expirationDate)
    VALUES (1, 1, 'strToken', SUBDATE(NOW(), INTERVAL 2 DAY));
    INSERT INTO bans (idUser, banEnd)
    VALUES (1, SUBDATE(NOW(), INTERVAL 2 DAY));

    CALL p_clean_tables();

    SELECT IF ((SELECT COUNT(*) FROM bans WHERE idUser = 1),'Test clean tables bans : FAIL','Test clean tables bans: OK');
    SELECT IF ((SELECT COUNT(*)  FROM tokens WHERE idUser = 1),'Test clean tables tokens : FAIL','Test clean tables tokens: OK');
    ROLLBACK;

END;
//