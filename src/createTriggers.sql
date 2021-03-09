DELIMITER //
CREATE OR REPLACE trigger i_bans
    AFTER INSERT
    ON bans
    FOR EACH ROW
    IF NEW.banEnd < NOW() THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Ban end is not valid';
    END IF;
//


DELIMITER //
CREATE OR REPLACE trigger u_bans
    AFTER UPDATE
    ON bans
    FOR EACH ROW
    IF NEW.banEnd < NOW() THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Ban end is not valid';
    END IF;
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
    BEFORE UPDATE
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

    SET NEW.nbPoints = NEW.nbPoints + OLD.nbPoints; 
    SET NEW.nbKills = NEW.nbKills + OLD.nbKills;
    SET NEW.nbAsteroids = NEW.nbAsteroids + OLD.nbAsteroids; 
    SET NEW.nbDeaths = NEW.nbDeaths + OLD.nbDeaths;
    SET NEW.nbPowerUps = NEW.nbPowerUps + OLD.nbPowerUps; 
    SET NEW.nbGames =  OLD.nbGames + NEW.nbGames;
    SET NEW.nbWins = NEW.nbWins + OLD.nbWins; 
    SET NEW.maxKills = maxK; 
    SET NEW.maxPoints = maxP; 
    SET NEW.maxPowerUps = maxPU; 
    SET NEW.maxDeaths = maxD;
END;
//

DELIMITER //
CREATE OR REPLACE trigger i_bans
    AFTER INSERT
    ON bans
    FOR EACH ROW
BEGIN
    DELETE FROM tokens WHERE idUser = NEW.idUser;
END;
//



