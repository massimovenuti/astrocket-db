/*** Utilisateur de test ***/

insert into users (idUser, username, pwd, email, role)
values (NEXTVAL(s_users), 'test', 'pwd', 'email@email.email', 'U');

/* idUser NULL */
insert into bans (idUser, banEnd)
values (NULL,"2022-02-06");

/* banEnd NULL */
insert into bans (idUser, banEnd)
values ((select idUser from users where username='test'), NULL);
/*** Le select permet de retrouver dynamiquement la valeur de l'utilisateur test, afin de ne pas avoir à changer manuellement cette valeur ***/

/* banEnd invalid */
insert into bans (idUser, banEnd)
values ((select idUser from users where username='test'), "2020-02-06");

/*** Suppression utilisateur de test ***/
delete from users where username='test';