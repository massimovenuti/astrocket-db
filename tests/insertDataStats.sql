/*
 * Ce fichier permet de réaliser différentes insertions, en vue du futur test de l'API de Statistiques
*/

/* Insertion d'utilisateurs */
insert into users (idUser, username, pwd, email, role)
values (1, 'stats1', 'pwd', 'email@email.email', 'U');

insert into users (idUser, username, pwd, email, role)
values (2, 'stats2', 'pwd', 'email2@email.email', 'U');

insert into users (idUser, username, pwd, email, role)
values (3, 'stats3', 'pwd', 'email3@email.email', 'U');

insert into users (idUser, username, pwd, email, role)
values (4, 'stats4', 'pwd', 'email4@email.email', 'U');

insert into users (idUser, username, pwd, email, role)
values (5, 'stats5', 'pwd', 'email5@email.email', 'U');

insert into users (idUser, username, pwd, email, role)
values (6, 'stats6', 'pwd', 'email6@email.email', 'U');

insert into users (idUser, username, pwd, email, role)
values (7, 'stats7', 'pwd', 'email7@email.email', 'U');

insert into users (idUser, username, pwd, email, role)
values (8, 'stats8', 'pwd', 'email8@email.email', 'U');

insert into users (idUser, username, pwd, email, role)
values (9, 'stats9', 'pwd', 'email9@email.email', 'U');

insert into users (idUser, username, pwd, email, role)
values (10, 'stats10', 'pwd', 'email10@email.email', 'U');

/* Insertion de statistiques pour chaque utilisateur */

-- User : stats1
update stats
SET nbPoints = 10000, 
    nbKills = 100,
    nbAsteroids =  1000, 
    nbDeaths = 100, 
    nbPowerUps = 10, 
    nbGames = 100,
    nbWins = 10,
    maxKills = 10, 
    maxPoints = 1000,
    maxPowerUps =  1, 
    maxDeaths = 10
WHERE idUser = 1;

-- User : stats2
update stats
SET nbPoints = 20000, 
    nbKills = 200,
    nbAsteroids =  2000, 
    nbDeaths = 200, 
    nbPowerUps = 20, 
    nbGames = 200,
    nbWins = 20,
    maxKills = 20, 
    maxPoints = 2000,
    maxPowerUps =  2, 
    maxDeaths = 20
WHERE idUser = 2;

-- User : stats3
update stats
SET nbPoints = 30000, 
    nbKills = 300,
    nbAsteroids =  3000, 
    nbDeaths = 300, 
    nbPowerUps = 30, 
    nbGames = 300,
    nbWins = 30,
    maxKills = 30, 
    maxPoints = 3000,
    maxPowerUps =  3, 
    maxDeaths = 30
WHERE idUser = 3;

-- User : stats4
update stats
SET nbPoints = 40000, 
    nbKills = 400,
    nbAsteroids =  4000, 
    nbDeaths = 400, 
    nbPowerUps = 40, 
    nbGames = 400,
    nbWins = 40,
    maxKills = 40, 
    maxPoints = 4000,
    maxPowerUps =  4, 
    maxDeaths = 40
WHERE idUser = 4;

-- User : stats5
update stats
SET nbPoints = 50000, 
    nbKills = 500,
    nbAsteroids =  5000, 
    nbDeaths = 500, 
    nbPowerUps = 50, 
    nbGames = 500,
    nbWins = 50,
    maxKills = 50, 
    maxPoints = 5000,
    maxPowerUps =  5, 
    maxDeaths = 50
WHERE idUser = 5;

-- User : stats6
update stats
SET nbPoints = 60000, 
    nbKills = 600,
    nbAsteroids =  6000, 
    nbDeaths = 600, 
    nbPowerUps = 60, 
    nbGames = 600,
    nbWins = 60,
    maxKills = 60, 
    maxPoints = 6000,
    maxPowerUps =  6, 
    maxDeaths = 60
WHERE idUser = 6;

-- User : stats7
update stats
SET nbPoints = 70000, 
    nbKills = 700,
    nbAsteroids =  7000, 
    nbDeaths = 700, 
    nbPowerUps = 70, 
    nbGames = 700,
    nbWins = 70,
    maxKills = 70, 
    maxPoints = 7000,
    maxPowerUps =  7, 
    maxDeaths = 70
WHERE idUser = 7;

-- User : stats8
update stats
SET nbPoints = 80000, 
    nbKills = 800,
    nbAsteroids =  8000, 
    nbDeaths = 800, 
    nbPowerUps = 80, 
    nbGames = 800,
    nbWins = 80,
    maxKills = 80, 
    maxPoints = 8000,
    maxPowerUps =  8, 
    maxDeaths = 80
WHERE idUser = 8;

-- User : stats9
update stats
SET nbPoints = 90000, 
    nbKills = 900,
    nbAsteroids =  9000, 
    nbDeaths = 900, 
    nbPowerUps = 90, 
    nbGames = 900,
    nbWins = 90,
    maxKills = 90, 
    maxPoints = 9000,
    maxPowerUps =  9, 
    maxDeaths = 90
WHERE idUser = 9;

-- User : stats10
update stats
SET nbPoints = 100000, 
    nbKills = 1000,
    nbAsteroids =  10000, 
    nbDeaths = 1000, 
    nbPowerUps = 100, 
    nbGames = 1000,
    nbWins = 100,
    maxKills = 100, 
    maxPoints = 10000,
    maxPowerUps =  10, 
    maxDeaths = 100
WHERE idUser = 10;