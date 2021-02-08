DELIMITER //
CREATE OR REPLACE trigger i_bans
    AFTER INSERT
    ON bans
    FOR EACH ROW
    CALL p_check_ban_end(NEW.banEnd);
//
DELIMITER

DELIMITER //
CREATE OR REPLACE trigger u_bans
    AFTER UPDATE
    ON bans
    FOR EACH ROW
    CALL p_check_ban_end(NEW.banEnd);
//
DELIMITER

DELIMITER //
CREATE OR REPLACE TRIGGER i_tokens
    AFTER INSERT
    ON tokens
    FOR EACH ROW
BEGIN
    IF NEW.expirationDate < NOW() THEN
        SIGNAL SQLSTATE '45001' SET MESSAGE_TEXT = 'Expiration date is not valid';
    END IF;
END;
//
DELIMITER

DELIMITER //
CREATE OR REPLACE trigger i_users
    AFTER INSERT
    ON users
    FOR EACH ROW
BEGIN
    INSERT INTO stats (idUser) VALUES (NEW.idUser);
END;
//
DELIMITER
