DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS tokens;
DROP TABLE IF EXISTS bans;
DROP TABLE IF EXISTS stats;

CREATE SEQUENCE IF NOT EXISTS s_user;
CREATE SEQUENCE IF NOT EXISTS s_token;

CREATE TABLE IF NOT EXISTS users (
    idUser INTEGER,
    username VARCHAR(40),
    pwd VARCHAR(80),
    email VARCHAR(50),
    role CHAR(1) DEFAULT 'U',
    CONSTRAINT PK_users PRIMARY KEY (idUser),
    CONSTRAINT UC_users_username UNIQUE (username),
    CONSTRAINT UC_users_email UNIQUE (email),
    CONSTRAINT CK_users_username CHECK (username REGEXP '^[a-zA-Z]'), /* à vérifier */
    CONSTRAINT CK_users_email CHECK (email LIKE '%@%.%'),
    CONSTRAINT CK_users_role CHECK (role IN ('A', 'U')),
    CONSTRAINT NN_users_username CHECK (username IS NOT NULL),
    CONSTRAINT NN_users_pwd CHECK (pwd IS NOT NULL),
    CONSTRAINT NN_users_email CHECK (email IS NOT NULL),
    CONSTRAINT NN_users_role CHECK (role IS NOT NULL)
);

CREATE TABLE IF NOT EXISTS tokens (
    idToken INTEGER,
    idUser INTEGER,
    strToken VARCHAR(80),
    expirationDate DATE,
    CONSTRAINT PK_tokens PRIMARY KEY (idToken),
    CONSTRAINT FK_tokens FOREIGN KEY (idUser) REFERENCES users (idUser) ON DELETE CASCADE,
    CONSTRAINT UC_tokens_strToken UNIQUE (strToken),
    CONSTRAINT CK_tokens_expirationDate CHECK (expirationDate > SYSDATE()),
    CONSTRAINT NN_tokens_strToken CHECK (strToken IS NOT NULL),
    CONSTRAINT NN_tokens_expirationDate CHECK (expirationDate IS NOT NULL)
);

CREATE TABLE IF NOT EXISTS bans (
    idUser INTEGER,
    banEnd DATE,
    CONSTRAINT PK_bans PRIMARY KEY (idUser, banEnd),
    CONSTRAINT FK_bans FOREIGN KEY (idUser) REFERENCES users (idUser) ON DELETE CASCADE,
    CONSTRAINT CK_bans_banEnd CHECK (banEnd > SYSDATE())
);

CREATE TABLE IF NOT EXISTS stats
(
    idUser INTEGER,
    nbPoints INTEGER,
    nbKills INTEGER,
    nbAsteroids INTEGER,
    nbDeaths INTEGER,
    nbPowerUps INTEGER,
    nbGames INTEGER,
    nbWins INTEGER,
    maxKills INTEGER,
    maxPoints INTEGER,
    maxPowerUps INTEGER,
    maxDeaths INTEGER,
    CONSTRAINT PK_stats PRIMARY KEY (idUser),
    CONSTRAINT FK_stats FOREIGN KEY (idUser) REFERENCES users (idUser) ON DELETE CASCADE,
    CONSTRAINT CK_stats_nbPoints CHECK (nbPoints >= 0),
    CONSTRAINT CK_stats_nbKills CHECK (nbKills >= 0),
    CONSTRAINT CK_stats_nbAsteroids CHECK (nbAsteroids >= 0),
    CONSTRAINT CK_stats_nbDeaths CHECK (nbDeaths >= 0),
    CONSTRAINT CK_stats_nbPowerUps CHECK (nbPowerUps >= 0),
    CONSTRAINT CK_stats_nbGames CHECK (nbGames >= 0),
    CONSTRAINT CK_stats_nbWins CHECK (nbWins >= 0),
    CONSTRAINT CK_stats_maxKills CHECK (maxKills >= 0),
    CONSTRAINT CK_stats_maxPoints CHECK (maxPoints >= 0),
    CONSTRAINT CK_stats_maxPowerUps CHECK (maxPowerUps >= 0),
    CONSTRAINT CK_stats_maxDeaths CHECK (maxDeaths >= 0),
    CONSTRAINT NN_stats_nbPoints CHECK (nbPoints IS NOT NULL),
    CONSTRAINT NN_stats_nbKills CHECK (nbKills IS NOT NULL),
    CONSTRAINT NN_stats_nbAsteroids CHECK (nbAsteroids IS NOT NULL),
    CONSTRAINT NN_stats_nbDeaths CHECK (nbDeaths IS NOT NULL),
    CONSTRAINT NN_stats_nbPowerUps CHECK (nbPowerUps IS NOT NULL),
    CONSTRAINT NN_stats_nbGames CHECK (nbGames IS NOT NULL),
    CONSTRAINT NN_stats_nbWins CHECK (nbWins IS NOT NULL),
    CONSTRAINT NN_stats_maxKills CHECK (maxKills IS NOT NULL),
    CONSTRAINT NN_stats_maxPoints CHECK (maxPoints IS NOT NULL),
    CONSTRAINT NN_stats_maxPowerUps CHECK (maxPowerUps IS NOT NULL),
    CONSTRAINT NN_stats_maxDeaths CHECK (maxDeaths IS NOT NULL)
);

CREATE OR REPLACE PROCEDURE p_clean_tables()
    BEGIN
        DELETE FROM bans WHERE banEnd < SYSDATE();
        DELETE FROM tokens WHERE expirationDate < SYSDATE() + 1;
    END;

CREATE OR REPLACE EVENT e_clean_tables
    ON SCHEDULE EVERY 1 DAY
    DO
    CALL p_clean_tables();


