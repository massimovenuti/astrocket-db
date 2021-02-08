/* idToken NULL */
insert into users (idUser, username, pwd, email, role)
values (NEXTVAL(s_users), 'test', 'pwd', 'email@email.email', 'U');

insert into tokens (idToken , idUser ,strToken, expirationDate)
values (NULL, 1,'eyJuYW1lIjoiV2lraXBlZGlhIiwiaWF0IjoxNTI1Nzc3OTM4fQ', "2022-02-06");

delete from users where username='test';


/* idUser NULL */
insert into tokens (idToken, idUser, strToken, expirationDate)
values (NEXTVAL(s_tokens), NULL,'fyJuYW1lIjoiV2lraXBlZGlhIiwiaWF0IjoxNTI1Nzc3OTM4fQ', "2022-02-06");

/*** INSERT pour tester les conditions suivantes ***/
insert into users (idUser, username, pwd, email, role)
values (NEXTVAL(s_users), 'test', 'pwd', 'email@email.email', 'U');


/* strToken not unique */
insert into tokens (idToken, idUser, strToken, expirationDate)
values (NEXTVAL(s_tokens), (select idUser from users where username='test'),'gyJuYW1lIjoiV2lraXBlZGlhIiwiaWF0IjoxNTI1Nzc3OTM4fQ', "2022-02-06");
/*** Le select permet de retrouver dynamiquement la valeur de l'utilisateur test, afin de ne pas avoir à changer manuellement cette valeur ***/

insert into tokens (idToken, idUser, strToken, expirationDate)
values (NEXTVAL(s_tokens), (select idUser from users where username='test'),'gyJuYW1lIjoiV2lraXBlZGlhIiwiaWF0IjoxNTI1Nzc3OTM4fQ', "2022-02-06");


delete from tokens where strToken='gyJuYW1lIjoiV2lraXBlZGlhIiwiaWF0IjoxNTI1Nzc3OTM4fQ';


/* expirationDate NULL */
insert into tokens (idToken, idUser, strToken, expirationDate)
values (NEXTVAL(s_tokens), (select idUser from users where username='test'),'gyJuYW1lIjoiV2lraXBlZGlhIiwiaWF0IjoxNTI1Nzc3OTM4fQ', NULL); 

/* strToken NULL */
insert into tokens (idToken, idUser, strToken, expirationDate)
values (NEXTVAL(s_tokens), (select idUser from users where username='test'), NULL, "2022-02-06");

/* Expiration date not valid */
insert into tokens (idToken, idUser, strToken, expirationDate)
values (NEXTVAL(s_tokens), (select idUser from users where username='test'), 'hyJuYW1lIjoiV2lraXBlZGlhIiwiaWF0IjoxNTI1Nzc3OTM4fQ', "2020-02-06");


delete from users where username='test';