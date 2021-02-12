DELIMITER //
CREATE OR REPLACE PROCEDURE p_check_ban_end(v_ban_end DATE)
BEGIN
    IF v_ban_end < NOW() THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Ban end is not valid';
    END IF;
END;
//


DELIMITER //
CREATE OR REPLACE PROCEDURE p_clean_tables()
BEGIN
    DELETE FROM bans WHERE banEnd < NOW();
    DELETE FROM tokens WHERE expirationDate < DATE_SUB(NOW(), INTERVAL 1 DAY);
END;
//


CREATE OR
    REPLACE EVENT e_clean_tables
    ON SCHEDULE EVERY 1 DAY
    DO
    CALL p_clean_tables();