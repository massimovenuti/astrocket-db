select 'Test process' as 'Starting';

/*--------------------------------*/

select 'Table users' as 'Testing';

call test_null_username(@test);
select @test as 'Username null';

call test_notunique_username(@test);
select @test as 'Username not unique';

/*select ' Username start with a number : ' as '';
call test_startnumber_username();*/

call test_null_pwd(@test);
select @test as 'Password null';

call test_null_email(@test);
select @test as 'Email null';

call test_notunique_email(@test);
select @test as 'Email not unique';
delete from users where username = 'username';

/*select ' Email regex : ' as '';
call test_notlike_email();*/

call test_null_role(@test);
select @test as 'Role null';

/*--------------------------------*/

select 'Table servers' as 'Testing';

call test_null_serverName(@test);
select @test as 'ServerName null';

call test_notunique_serverName(@test);
select @test as 'ServerName not unique';

call test_null_serverToken(@test);
select @test as 'ServerToken null';

call test_notunique_serverToken(@test);
select @test as 'ServerToken not unique';

/*--------------------------------*/

select 'Table tokens' as 'Testing';

/*** INSERT pour tester les conditions suivantes ***/
insert into users (idUser, username, pwd, email, role)
values (1, 'test', 'pwd', 'email@email.email', 'U');

call test_null_idUser(@test);
select @test as 'idUser null';

call test_null_idToken(@test);
select @test as 'idToken null';

call test_notunique_strToken(@test);
select @test as 'strToken not unique';

call test_null_expirationDate(@test);
select @test as 'ExpirationDate null';

call test_null_strToken(@test);
select @test as 'strToken null';

/*--------------------------------*/

select 'Table bans' as 'Testing';

call test_null_idUserBan(@test);
select @test as 'idUser ban null';

call test_null_banEnd(@test);
select @test as 'banEnd null';

/*** Suppression utilisateur de test ***/
delete
from users
where username = 'test';

/*--------------------------------*/
select 'Table stats' as 'Testing';
/*
call test_null_idUserStats(@test);
select @test as 'idUser stats null';
delete from stats where idUser = 1;

call test_null_nbKills(@test);
select @test as 'nbKills null';
delete from stats where idUser = 1;

call test_null_nbGames(@test);
select @test as 'nbGames null';
delete from stats where idUser = 1;

call test_null_nbAsteroids(@test);
select @test as 'nbAsteroids null';
delete from stats where idUser = 1;

call test_null_nbPoints(@test);
select @test as 'nbPoints null';
delete from stats where idUser = 1;

call test_null_nbPowersUps(@test);
select @test as 'nbPowersUps null';
delete from stats where idUser = 1;

call test_null_nbWins(@test);
select @test as 'nbWins null';
delete from stats where idUser = 1;

call test_null_maxDeaths(@test);
select @test as 'maxDeaths null';
delete from stats where idUser = 1;

call test_null_maxKills(@test);
select @test as 'maxKills null';
delete from stats where idUser = 1;

call test_null_maxPowersUp(@test);
select @test as 'maxPowersUps null';
delete from stats where idUser = 1;

call test_null_maxPoints(@test);
select @test as 'maxPoints null';
delete from stats where idUser = 1;

call test_greater0_nbKills(@test);
select @test as 'nbKills greater0';
delete from stats where idUser = 1;

call test_greater0_nbGames(@test);
select @test as 'nbGames greater0';
delete from stats where idUser = 1;

call test_greater0_nbAsteroids(@test);
select @test as 'nbAsteroids greater0';
delete from stats where idUser = 1;

call test_greater0_nbPoints(@test);
select @test as 'nbPoints greater0';
delete from stats where idUser = 1;

call test_greater0_nbPowersUps(@test);
select @test as 'nbPowersUps greater0';
delete from stats where idUser = 1;

call test_greater0_nbWins(@test);
select @test as 'nbWins greater0';
delete from stats where idUser = 1;

call test_greater0_maxDeaths(@test);
select @test as 'maxDeaths greater0';
delete from stats where idUser = 1;

call test_greater0_maxKills(@test);
select @test as 'maxKills greater0';
delete from stats where idUser = 1;

call test_greater0_maxPowersUp(@test);
select @test as 'maxPowersUps greater0';
delete from stats where idUser = 1;

call test_greater0_maxPoints(@test);
select @test as 'maxPoints greater0';
delete from stats where idUser = 1;
*/

/*--------------------------------*/

select 'Procedures' as 'Testing';

call test_clean_tables();

/*--------------------------------*/
delete from users where idUser = 1;
select 'Triggers' as 'Testing';

/* Utilisateur de test */
insert into users (idUser, username, pwd, email, role)
values (1, 'username', 'pwd', 'email@email.email', 'U');

call test_trigger_newUser();

call test_trigger_dateToken(@test);
select @test as 'dateToken insert';

call test_trigger_dateBan_insert(@test);
select @test as 'dateBan insert';

/* Ban de test */
insert into bans (idUser, banEnd)
values (1, ADDDATE(NOW(), INTERVAL 1 DAY));

call test_trigger_dateBan_update(@test);
select @test as 'dateBan update';

/* Suppression ban de test */
DELETE
FROM bans
where idUser = 1;

/*** Suppression utilisateur de test ***/
delete from users where idUser = 1;

call test_trigger_stats_update();



select 'Test process ' as 'Ending';
