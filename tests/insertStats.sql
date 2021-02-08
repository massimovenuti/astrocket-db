/*
 * Ce fichier permet de réaliser différentes insertions, en vue du futur test de l'API de Statistiques
*/

/* Insertion d'utilisateurs */
insert into users (idUser, username, pwd, email, role)
values (1, 'stats1', 'pwd', 'email@email.email', 'U');

insert into users (idUser, username, pwd, email, role)
values (2, 'stats2', 'pwd', 'email2@email.email', 'U');

insert into users (idUser, username, pwd, email, role)
values (3, 'stats3', 'pwd', 'email3@email.email', 'U');

insert into users (idUser, username, pwd, email, role)
values (4, 'stats4', 'pwd', 'email4@email.email', 'U');

insert into users (idUser, username, pwd, email, role)
values (5, 'stats5', 'pwd', 'email5@email.email', 'U');

insert into users (idUser, username, pwd, email, role)
values (6, 'stats6', 'pwd', 'email6@email.email', 'U');

insert into users (idUser, username, pwd, email, role)
values (7, 'stats7', 'pwd', 'email7@email.email', 'U');

insert into users (idUser, username, pwd, email, role)
values (8, 'stats8', 'pwd', 'email8@email.email', 'U');

insert into users (idUser, username, pwd, email, role)
values (9, 'stats9', 'pwd', 'email9@email.email', 'U');

insert into users (idUser, username, pwd, email, role)
values (10, 'stats10', 'pwd', 'email10@email.email', 'U');

/* Insertion de statistiques pour chaque utilisateur */

-- User : stats1
insert into stats values (1,10000,100,1000,100,10,100,10,10,1000,1,10);

-- User : stats2
insert into stats values (2,20000,200,2000,200,20,200,20,20,2000,2,20);

-- User : stats3
insert into stats values (3,30000,300,3000,300,30,300,30,30,3000,3,30);

-- User : stats4
insert into stats values (4,40000,400,4000,400,40,400,40,40,4000,4,40);

-- User : stats5
insert into stats values (5,50000,500,5000,500,50,500,50,50,5000,5,50);

-- User : stats6
insert into stats values (6,60000,600,6000,600,60,600,60,60,6000,6,60);

-- User : stats7
insert into stats values (7,70000,700,7000,700,70,700,70,70,7000,7,70);

-- User : stats8
insert into stats values (8,80000,800,8000,800,80,800,80,80,8000,8,80);

-- User : stats9
insert into stats values (9,90000,900,9000,900,90,900,90,90,9000,9,90);

-- User : stats10
insert into stats values (10,100000,1000,10000,1000,100,1000,100,100,10000,10,100);
