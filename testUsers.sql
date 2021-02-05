/*
 username NULL
 */
insert into users (idUser, username, pwd, email, role)
values (NEXTVAL(s_users), NULL, 'pwd', 'email@email.email', 'U');

/*
 username not unique
 */
insert into users (idUser, username, pwd, email, role)
values (NEXTVAL(s_users), 'username', 'pwd', 'email@email.email1', 'U');
insert into users (idUser, username, pwd, email, role)
values (NEXTVAL(s_users), 'username', 'pwd', 'email@email.email2', 'U');
delete
from users
where username = 'username';

/*
 username starts with number
 */
insert into users (idUser, username, pwd, email, role)
values (NEXTVAL(s_users), '1username', 'pwd', 'email@email.email', 'U');

/*
 pwd NULL
 */
insert into users (idUser, username, pwd, email, role)
values (NEXTVAL(s_users), 'username', NULL, 'email@email.email', 'U');

/*
 email NULL
 */
insert into users (idUser, username, pwd, email, role)
values (NEXTVAL(s_users), 'username', 'pwd', NULL, 'U');

/*
 email not unique
 */
insert into users (idUser, username, pwd, email, role)
values (NEXTVAL(s_users), 'username1', 'pwd', 'email@email.email', 'U');
insert into users (idUser, username, pwd, email, role)
values (NEXTVAL(s_users), 'username2', 'pwd', 'email@email.email', 'U');
delete
from users
where username = 'username1';

/*
 email not like ‘%@%.%’
 */
insert into users (idUser, username, pwd, email, role)
values (NEXTVAL(s_users), 'username', 'pwd', 'email', 'U');

/*
 role NULL
 */
insert into users (idUser, username, pwd, email, role)
values (NEXTVAL(s_users), 'username', 'pwd', 'email@email.email', NULL);
