/*
 serverToken NULL
 */
INSERT INTO servers (idServer, serverName, serverToken)
VALUES (0, 'serverName', NULL);


/*
 serverToken not unique
 */
INSERT INTO servers (idServer, serverName, serverToken)
VALUES (0, 'serverName1', 'serverToken');

INSERT INTO servers (idServer, serverName, serverToken)
VALUES (1, 'serverName2', 'serverToken');

DELETE
FROM servers
WHERE idServer = 0;


/*
 serverName NULL
 */
INSERT INTO servers (idServer, serverName, serverToken)
VALUES (0, NULL, 'serverToken');


/*
 serverName not unique
 */
INSERT INTO servers (idServer, serverName, serverToken)
VALUES (0, 'serverName', 'serverToken1');

INSERT INTO servers (idServer, serverName, serverToken)
VALUES (1, 'serverName', 'serverToken2');

DELETE
FROM servers
WHERE idServer = 0;
