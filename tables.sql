CREATE TABLE IF NOT EXISTS users
(
    idUser INTEGER,
    username VARCHAR(40) NOT NULL,
    pwd      VARCHAR(80) NOT NULL,
    email    VARCHAR(50) NOT NULL,
    role     CHAR(1) DEFAULT 'U' NOT NULL,
    CONSTRAINT PK_users PRIMARY KEY (idUser),
    CONSTRAINT UC_users_username UNIQUE (username),
    CONSTRAINT UC_users_email UNIQUE (email),
    CONSTRAINT CK_users_username CHECK (username REGEXP '^[a-zA-Z]$'),
    CONSTRAINT CK_users_email CHECK (email REGEXP '^%@%.%$'),
    CONSTRAINT CK_users_role CHECK (role IN ('A', 'U'))
);

CREATE TABLE IF NOT EXISTS servers
(
    idServer INTEGER,
    serverName  VARCHAR(40) NOT NULL,
    serverToken VARCHAR(150) NOT NULL,
    CONSTRAINT PK_servers PRIMARY KEY (idServer),
    CONSTRAINT UC_servers_serverName UNIQUE (serverName),
    CONSTRAINT UC_servers_serverToken UNIQUE (serverToken)
);

CREATE TABLE IF NOT EXISTS tokens
(
    idToken     INTEGER,
    idUser      INTEGER NOT NULL,
    strToken       VARCHAR(80) NOT NULL,
    expirationDate DATE NOT NULL,
    CONSTRAINT PK_tokens PRIMARY KEY (idToken),
    CONSTRAINT FK_tokens FOREIGN KEY (idUser) REFERENCES users (idUser) ON DELETE CASCADE,
    CONSTRAINT UC_tokens_strToken UNIQUE (strToken)
);

CREATE TABLE IF NOT EXISTS bans
(
    idUser INTEGER,
    banEnd DATE,
    CONSTRAINT PK_bans PRIMARY KEY (idUser, banEnd),
    CONSTRAINT FK_bans FOREIGN KEY (idUser) REFERENCES users (idUser) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS stats
(
    idUser INTEGER,
    nbPoints INTEGER NOT NULL,
        CONSTRAINT CK_stats_nbPoints 
        CHECK (nbPoints >= 0,
    nbKills INTEGER NOT NULL, 
        CONSTRAINT CK_stats_nbKills 
        CHECK (nbKills >= 0 or nbKills IS NULL),
    nbAsteroids INTEGER NOT NULL,
        CONSTRAINT CK_stats_nbAsteroids 
        CHECK (nbAsteroids >= 0 or nbAsteroids IS NULL), 
    nbDeaths INTEGER NOT NULL, 
        CONSTRAINT CK_stats_nbDeaths 
        CHECK (nbDeaths >= 0 or nbDeaths IS NULL),
    nbPowerUps INTEGER NOT NULL, 
        CONSTRAINT CK_stats_nbPowerUps 
        CHECK (nbPowerUps >= 0 or nbPowerUps IS NULL),
    nbGames INTEGER NOT NULL, 
        CONSTRAINT CK_stats_nbGames 
        CHECK (nbGames >= 0),
    nbWins INTEGER NOT NULL,
        CONSTRAINT CK_stats_nbWins 
        CHECK (nbWins >= 0),
    maxKills INTEGER NOT NULL, 
        CONSTRAINT CK_stats_maxKills 
        CHECK (maxKills >= 0),
    maxPoints INTEGER NOT NULL, 
        CONSTRAINT CK_stats_maxPoints 
        CHECK (maxPoints >= 0),
    maxPowerUps INTEGER NOT NULL, 
        CONSTRAINT CK_stats_maxPowerUps 
        CHECK (maxPowerUps >= 0),
    maxDeaths INTEGER NOT NULL, 
        CONSTRAINT CK_stats_maxDeaths CHECK (maxDeaths >= 0 or maxDeaths IS NULL),
    CONSTRAINT PK_stats PRIMARY KEY (idUser),
    CONSTRAINT FK_stats FOREIGN KEY (idUser) REFERENCES users (idUser) ON DELETE CASCADE    
);
