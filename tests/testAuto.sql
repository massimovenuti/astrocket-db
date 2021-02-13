select '--| Début du processus de test |--' as '';
select '--- Test sur la table users ---' as '';

select ' Username null : ' as '';
call test_null_username();

select ' Username not unique : ' as '';
call test_notunique_username();

/*select ' Username start with a number : ' as '';
call test_startnumber_username();*/

select ' Pwd null : ' as '';
call test_null_pwd();

select ' Email null : ' as '';
call test_null_email();

select ' Email not unique : ' as '';
call test_notunique_email();

/*select ' Email regex : ' as '';
call test_notlike_email();*/

select ' Role null : ' as '';
call test_null_role();

select '--- Test sur la table servers ---' as '';

select ' servName null : ' as '';
call test_null_serverName();

select ' servName not unique : ' as '';
call test_notunique_serverName();

select ' serverToken null : ' as '';
call test_null_serverToken();

select ' serverToken not unique : ' as '';
call test_notunique_serverToken();


select '--- Test sur la table tokens ---' as '';

/*** INSERT pour tester les conditions suivantes ***/
insert into users (idUser, username, pwd, email, role)
values (1, 'test', 'pwd', 'email@email.email', 'U');

select ' idUser null : ' as '';
call test_null_idUser();

select ' idToken null : ' as '';
call test_null_idToken();

select ' strToken not unique : ' as '';
call test_notunique_strToken();

select ' expirationDate null : ' as '';
call test_null_expirationDate();

select ' strToken null : ' as '';
call test_null_strToken();

/*** Suppression utilisateur de test ***/
delete
from users
where username = 'test';

select '--| Fin de processus de test |--' as '';
