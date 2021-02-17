DELIMITER //
CREATE OR REPLACE trigger i_bans
    AFTER INSERT
    ON bans
    FOR EACH ROW
    CALL p_check_ban_end(NEW.banEnd);
//


DELIMITER //
CREATE OR REPLACE trigger u_bans
    AFTER UPDATE
    ON bans
    FOR EACH ROW
    CALL p_check_ban_end(NEW.banEnd);
//


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


DELIMITER //
CREATE OR REPLACE trigger i_users
    AFTER INSERT
    ON users
    FOR EACH ROW
BEGIN
    INSERT INTO stats (idUser) VALUES (NEW.idUser);
END;
//

DELIMITER //
CREATE OR REPLACE trigger u_stats
    AFTER UPDATE
    ON stats
    FOR EACH ROW
BEGIN 
    DECLARE maxK,maxD,maxP,maxPU INTEGER; 
    IF NEW.maxKills < OLD.maxKills THEN
        SET maxK = OLD.maxKills;
    ELSE
        SET maxK = NEW.maxKills;
    END IF;

    IF NEW.maxPoints < OLD.maxPoints THEN
        SET maxP = OLD.maxPoints;
    ELSE
        SET maxP = NEW.maxPoints;
    END IF;

    IF NEW.maxDeaths < OLD.maxDeaths THEN
        SET maxD = OLD.maxDeaths;
    ELSE
        SET maxD = NEW.maxDeaths;
    END IF;

    IF NEW.maxPowerUps < OLD.maxPowerUps THEN
        SET maxPU = OLD.maxPowerUps;
    ELSE
        SET maxPU = NEW.maxPowerUps;
    END IF;

    UPDATE stats 
    SET
        nbPoints = NEW.nbPoints + OLD.nbPoints, 
        nbKills = NEW.nbKills + OLD.nbKills, 
        nbAsteroids = NEW.nbAsteroids + OLD.nbAsteroids, 
        nbDeaths = NEW.nbDeaths + OLD.nbDeaths, 
        nbPowerUps = NEW.nbPowerUps + OLD.nbPowerUps, 
        nbGames =  OLD.nbGames + 1,
        nbWins = NEW.nbWins + OLD.nbWins, 
        maxKills = maxK, 
        maxPoints = maxP, 
        maxPowerUps = maxPU, 
        maxDeaths = maxD     
    WHERE (idUser = OLD.idUser);

END;
//

DELIMITER //
CREATE OR REPLACE trigger d_stats
    AFTER DELETE
    ON stats
    FOR EACH ROW
BEGIN
    INSERT INTO stats (idUser) VALUES (OLD.idUser);
END;
//


