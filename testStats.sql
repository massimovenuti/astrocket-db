/*** Utilisateur de test ***/
insert into users (idUser, username, pwd, email, role)
values (NEXTVAL(s_users), 'test', 'pwd', 'email@email.email', 'U');
    
/* idUser not null */
insert into stats values (NULL,0,0,0,0,0,0,0,0,0,0,0);

/* nbPoints >= 0 */
insert into stats values ((select idUser from users where username='test'),-1,0,0,0,0,0,0,0,0,0,0);
/*** Le select permet de retrouver dynamiquement la valeur de l'utilisateur test, afin de ne pas avoir à changer manuellement cette valeur ***/
    
/* nbKills >= 0 */
insert into stats values ((select idUser from users where username='test'),0,-1,0,0,0,0,0,0,0,0,0);
    
/* nbAsteroids >= 0 */
insert into stats values ((select idUser from users where username='test'),0,0,-1,0,0,0,0,0,0,0,0);
    
/* nbDeaths >= 0 */
insert into stats values ((select idUser from users where username='test'),0,0,0,-1,0,0,0,0,0,0,0);
    
/* nbPowerUps >= 0 */
insert into stats values ((select idUser from users where username='test'),0,0,0,0,-1,0,0,0,0,0,0);
    
/* nbGames >= 0 */
insert into stats values ((select idUser from users where username='test'),0,0,0,0,0,-1,0,0,0,0,0);
    
/* nbWins >= 0 */
insert into stats values ((select idUser from users where username='test'),0,0,0,0,0,0,-1,0,0,0,0);

/* maxKills >= 0 */
insert into stats values ((select idUser from users where username='test'),0,0,0,0,0,0,0,-1,0,0,0);

/* maxPoints >= 0 */
insert into stats values ((select idUser from users where username='test'),0,0,0,0,0,0,0,0,-1,0,0);
    
/* maxPowersUps >= 0 */
insert into stats values ((select idUser from users where username='test'),0,0,0,0,0,0,0,0,0,-1,0);
    
/* maxDeaths >= 0 */
insert into stats values ((select idUser from users where username='test'),0,0,0,0,0,0,0,0,0,0,-1);

/* nbPoints >= NULL */
insert into stats values ((select idUser from users where username='test'),NULL,0,0,0,0,0,0,0,0,0,0);
    
/* nbKills >= NULL */
insert into stats values ((select idUser from users where username='test'),0,NULL,0,0,0,0,0,0,0,0,0);
    
/* nbAsteroids >= NULL */
insert into stats values ((select idUser from users where username='test'),0,0,NULL,0,0,0,0,0,0,0,0);
    
/* nbDeaths >= NULL */
insert into stats values ((select idUser from users where username='test'),0,0,0,NULL,0,0,0,0,0,0,0);
    
/* nbPowerUps >= NULL */
insert into stats values ((select idUser from users where username='test'),0,0,0,0,NULL,0,0,0,0,0,0);
    
/* nbGames >= NULL */
insert into stats values ((select idUser from users where username='test'),0,0,0,0,0,NULL,0,0,0,0,0);
    
/* nbWins >= NULL */
insert into stats values ((select idUser from users where username='test'),0,0,0,0,0,0,NULL,0,0,0,0);

/* maxKills >= NULL */
insert into stats values ((select idUser from users where username='test'),0,0,0,0,0,0,0,NULL,0,0,0);

/* maxPoints >= NULL */
insert into stats values ((select idUser from users where username='test'),0,0,0,0,0,0,0,0,NULL,0,0);
    
/* maxPowersUps >= NULL */
insert into stats values ((select idUser from users where username='test'),0,0,0,0,0,0,0,0,0,NULL,0);
    
/* maxDeaths >= NULL */
insert into stats values ((select idUser from users where username='test'),0,0,0,0,0,0,0,0,0,0,NULL);

/*** Suppression utilisateur de test ***/
delete from users where username='test';
    