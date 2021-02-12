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

select '--| Fin de processus de test |--' as '';
