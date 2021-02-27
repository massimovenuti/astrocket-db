DROP PROCEDURE IF EXISTS test_null_username;
DROP PROCEDURE IF EXISTS test_notunique_username;
DROP PROCEDURE IF EXISTS test_startnumber_username;
DROP PROCEDURE IF EXISTS test_null_pwd;
DROP PROCEDURE IF EXISTS test_null_email;
DROP PROCEDURE IF EXISTS test_notunique_email;
DROP PROCEDURE IF EXISTS test_notlike_email;
DROP PROCEDURE IF EXISTS test_null_role;
DROP PROCEDURE IF EXISTS test_notin_role;

DROP PROCEDURE IF EXISTS test_null_serverName;
DROP PROCEDURE IF EXISTS test_notunique_serverName;
DROP PROCEDURE IF EXISTS test_null_serverToken;
DROP PROCEDURE IF EXISTS test_notunique_serverToken;

DROP PROCEDURE IF EXISTS test_null_idUser;
DROP PROCEDURE IF EXISTS test_null_idToken;
DROP PROCEDURE IF EXISTS test_notunique_strToken;
DROP PROCEDURE IF EXISTS test_null_expirationDate;
DROP PROCEDURE IF EXISTS test_null_strToken;

DROP PROCEDURE IF EXISTS test_null_idUserStats;
DROP PROCEDURE IF EXISTS test_null_nbKills;
DROP PROCEDURE IF EXISTS test_null_nbGames;
DROP PROCEDURE IF EXISTS test_null_nbAsteroids;
DROP PROCEDURE IF EXISTS test_null_nbDeaths;
DROP PROCEDURE IF EXISTS test_null_nbPoints;
DROP PROCEDURE IF EXISTS test_null_nbPowersUps;
DROP PROCEDURE IF EXISTS test_null_nbWins;
DROP PROCEDURE IF EXISTS test_null_maxDeaths;
DROP PROCEDURE IF EXISTS test_null_maxKills;
DROP PROCEDURE IF EXISTS test_null_maxPowersUp;
DROP PROCEDURE IF EXISTS test_null_maxPoints;
DROP PROCEDURE IF EXISTS test_greater0_nbKills;
DROP PROCEDURE IF EXISTS test_greater0_nbGames;
DROP PROCEDURE IF EXISTS test_greater0_nbAsteroids;
DROP PROCEDURE IF EXISTS test_greater0_nbDeaths;
DROP PROCEDURE IF EXISTS test_greater0_nbPoints;
DROP PROCEDURE IF EXISTS test_greater0_nbPowersUps;
DROP PROCEDURE IF EXISTS test_greater0_nbWins;
DROP PROCEDURE IF EXISTS test_greater0_maxDeaths;
DROP PROCEDURE IF EXISTS test_greater0_maxKills;
DROP PROCEDURE IF EXISTS test_greater0_maxPowersUp;
DROP PROCEDURE IF EXISTS test_greater0_maxPoints;

DROP PROCEDURE IF EXISTS test_null_idUserBan;
DROP PROCEDURE IF EXISTS test_null_banEnd;

DROP PROCEDURE IF EXISTS test_clean_tables;

DROP PROCEDURE IF EXISTS test_trigger_newUser;
DROP PROCEDURE IF EXISTS test_trigger_dateToken;
DROP PROCEDURE IF EXISTS test_trigger_dateBan_insert;
DROP PROCEDURE IF EXISTS test_trigger_dateBan_update;
DROP PROCEDURE IF EXISTS test_trigger_stats_update;
DROP PROCEDURE IF EXISTS test_trigger_newBan;
