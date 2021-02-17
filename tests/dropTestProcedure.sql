DROP PROCEDURE IF EXISTS test_null_username();
DROP PROCEDURE IF EXISTS test_notunique_username();
DROP PROCEDURE IF EXISTS test_startnumber_username();
DROP PROCEDURE IF EXISTS test_null_pwd();
DROP PROCEDURE IF EXISTS test_null_email();
DROP PROCEDURE IF EXISTS test_notunique_email();
DROP PROCEDURE IF EXISTS test_notlike_email();
DROP PROCEDURE IF EXISTS test_null_role();

DROP PROCEDURE IF EXISTS test_null_serverName();
DROP PROCEDURE IF EXISTS test_notunique_serverName();
DROP PROCEDURE IF EXISTS test_null_serverToken();
DROP PROCEDURE IF EXISTS test_notunique_serverToken();

DROP PROCEDURE IF EXISTS test_null_idUser();
DROP PROCEDURE IF EXISTS test_null_idToken();
DROP PROCEDURE IF EXISTS test_notunique_strToken();
DROP PROCEDURE IF EXISTS test_null_expirationDate();
DROP PROCEDURE IF EXISTS test_null_strToken();

DROP PROCEDURE IF EXISTS test_null_idUserBan();
DROP PROCEDURE IF EXISTS test_null_banEnd();

DROP PROCEDURE IF EXISTS test_trigger_newUser();
DROP PROCEDURE IF EXISTS test_trigger_dateToken();
DROP PROCEDURE IF EXISTS test_trigger_dateBan_insert();
DROP PROCEDURE IF EXISTS test_trigger_dateBan_update();
DROP PROCEDURE IF EXISTS test_trigger_stats_update();
