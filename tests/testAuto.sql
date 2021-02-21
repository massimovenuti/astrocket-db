SELECT 'Test process' AS 'Starting';
SET autocommit = 0;
delete from users;
/*--------------------------------*/

SELECT 'Table users' AS 'Testing';

CALL test_null_username(@test);
SELECT @test AS 'Username null';

CALL test_notunique_username(@test);
SELECT @test AS 'Username not unique';
select * from users;

/*SELECT ' Username start with a number : ' AS '';
CALL test_startnumber_username();*/

CALL test_null_pwd(@test);
SELECT @test AS 'Password null';

CALL test_null_email(@test);
SELECT @test AS 'Email null';

CALL test_notunique_email(@test);
SELECT @test AS 'Email not unique';

/*SELECT ' Email regex : ' AS '';
CALL test_notlike_email();*/

CALL test_null_role(@test);
SELECT @test AS 'Role null';

/*--------------------------------*/

SELECT 'Table servers' AS 'Testing';

CALL test_null_serverName(@test);
SELECT @test AS 'ServerName null';

CALL test_notunique_serverName(@test);
SELECT @test AS 'ServerName not unique';

CALL test_null_serverToken(@test);
SELECT @test AS 'ServerToken null';

CALL test_notunique_serverToken(@test);
SELECT @test AS 'ServerToken not unique';

/*--------------------------------*/
SELECT 'Table tokens' AS 'Testing';

CALL test_null_idUser(@test);
SELECT @test AS 'idUser null';

CALL test_null_idToken(@test);
SELECT @test AS 'idToken null';

CALL test_notunique_strToken(@test);
SELECT @test AS 'strToken not unique';

CALL test_null_expirationDate(@test);
SELECT @test AS 'ExpirationDate null';

CALL test_null_strToken(@test);
SELECT @test AS 'strToken null';

/*--------------------------------*/

SELECT 'Table bans' AS 'Testing';

CALL test_null_idUserBan(@test);
SELECT @test AS 'idUser ban null';

CALL test_null_banEnd(@test);
SELECT @test AS 'banEnd null';


/*--------------------------------*/
SELECT 'Table stats' AS 'Testing';
/*
CALL test_null_idUserStats(@test);
SELECT @test AS 'idUser stats null';

CALL test_null_nbKills(@test);
SELECT @test AS 'nbKills null';

CALL test_null_nbGames(@test);
SELECT @test AS 'nbGames null';

CALL test_null_nbAsteroids(@test);
SELECT @test AS 'nbAsteroids null';
delete from stats where idUser = 1;

CALL test_null_nbPoints(@test);
SELECT @test AS 'nbPoints null';

CALL test_null_nbPowersUps(@test);
SELECT @test AS 'nbPowersUps null';

CALL test_null_nbWins(@test);
SELECT @test AS 'nbWins null';

CALL test_null_maxDeaths(@test);
SELECT @test AS 'maxDeaths null';

CALL test_null_maxKills(@test);
SELECT @test AS 'maxKills null';
delete from stats where idUser = 1;

CALL test_null_maxPowersUp(@test);
SELECT @test AS 'maxPowersUps null';

CALL test_null_maxPoints(@test);
SELECT @test AS 'maxPoints null';
delete from stats where idUser = 1;

CALL test_greater0_nbKills(@test);
SELECT @test AS 'nbKills greater0';

CALL test_greater0_nbGames(@test);
SELECT @test AS 'nbGames greater0';

CALL test_greater0_nbAsteroids(@test);
SELECT @test AS 'nbAsteroids greater0';

CALL test_greater0_nbPoints(@test);
SELECT @test AS 'nbPoints greater0';

CALL test_greater0_nbPowersUps(@test);
SELECT @test AS 'nbPowersUps greater0';

CALL test_greater0_nbWins(@test);
SELECT @test AS 'nbWins greater0';

CALL test_greater0_maxDeaths(@test);
SELECT @test AS 'maxDeaths greater0';

CALL test_greater0_maxKills(@test);
SELECT @test AS 'maxKills greater0';

CALL test_greater0_maxPowersUp(@test);
SELECT @test AS 'maxPowersUps greater0';

CALL test_greater0_maxPoints(@test);
SELECT @test AS 'maxPoints greater0';
*/

/*--------------------------------*/

SELECT 'Procedures' AS 'Testing';

CALL test_clean_tables();

/*--------------------------------*/
SELECT 'Triggers' AS 'Testing';

CALL test_trigger_newUser();

CALL test_trigger_dateToken(@test);
SELECT @test AS 'dateToken insert';

CALL test_trigger_dateBan_insert(@test);
SELECT @test AS 'dateBan insert';

CALL test_trigger_dateBan_update(@test);
SELECT @test AS 'dateBan update';

CALL test_trigger_stats_update();

SELECT 'Test process ' AS 'Ending';
