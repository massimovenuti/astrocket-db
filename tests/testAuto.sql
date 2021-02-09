select '--| Début du processus de test |--';
select '--- Test sur la table users ---'

select ' Username null : '
call test_null_username();

select ' Username not unique : '
call test_notunique_username();

select ' Username start with a number : '
call test_startnumber_username();

select ' Pwd null : '
call test_null_pwd();

select ' Email null : '
call test_null_email();

select ' Email not unique : '
call test_notunique_email();

select ' Email regex : '
call test_notlike_email();

select ' Role null : '
call test_null_role();

select '--| Fin de processus de test |--'
