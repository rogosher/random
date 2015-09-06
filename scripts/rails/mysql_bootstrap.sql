--
--  Author: rogosher
--
--  Description: Ruby on Rails mysql setup. Script adds development, production,
--  and test databases to mysql server. Add a basic and admin user with related
--  permissions.
--
--  Executing:
--      `$ mysql -u root -p < mysql_bootstrap.sh`
--

-- Uncomment if not setting variables via command line.
-- Example:
--     mysql -u root -p -e
--       "set @dbname='';set @username='';set @user_password='';set @admin_password='';`cat mysql_bootstrap.sql`"

-- SET @dbname = 'mydb';
-- SET @username = 'mydbuser';
-- SET @user_password = 'passuser';
-- SET @admin_password = 'passadmin';

------------------------
-- *Create Databases* --
------------------------

-- create development database
SET @s = CONCAT('CREATE DATABASE IF NOT EXISTS ', @dbname, '_development');
PREPARE stmt_create FROM @s;
EXECUTE stmt_create;
DEALLOCATE PREPARE stmt_create;

-- create production database
SET @s = CONCAT('CREATE DATABASE IF NOT EXISTS ', @dbname, '_production');
PREPARE stmt_create FROM @s;
EXECUTE stmt_create;
DEALLOCATE PREPARE stmt_create;

-- create test database
SET @s = CONCAT('CREATE DATABASE IF NOT EXISTS ', @dbname, '_test');
PREPARE stmt_create FROM @s;
EXECUTE stmt_create;
DEALLOCATE PREPARE stmt_create;

----------------------------------------
-- *Create Users and Set Permissions* --
----------------------------------------

----------------------
-- User permissions --
----------------------

-- production database
SET @user_perms = "Select,Insert,Update,Delete,Lock Tables";
SET @s = CONCAT("GRANT ", @user_perms," ON ", @dbname, "_production.* TO '",
	@username, "'@'localhost' IDENTIFIED BY '", @user_password, "'");
PREPARE stmt_user FROM @s;
EXECUTE stmt_user;
DEALLOCATE PREPARE stmt_user;

-- development database
SET @user_perms = "Select,Insert,Update,Delete,Lock Tables";
SET @s = CONCAT("GRANT ", @user_perms," ON ", @dbname, "_development.* TO '",
	@username, "'@'localhost' IDENTIFIED BY '", @user_password, "'");
PREPARE stmt_user FROM @s;
EXECUTE stmt_user;
DEALLOCATE PREPARE stmt_user;

-- test database
SET @user_perms = "Select,Insert,Update,Delete,Lock Tables";
SET @s = CONCAT("GRANT ", @user_perms," ON ", @dbname, "_test.* TO '",
	@username, "'@'localhost' IDENTIFIED BY '", @user_password, "'");
PREPARE stmt_user FROM @s;
EXECUTE stmt_user;
DEALLOCATE PREPARE stmt_user;

-----------------------
-- Admin permissions --
-----------------------

-- production
SET @user_perms = "Select,Insert,Update,Delete,Create,Drop,Index,Alter,Lock Tables";
SET @s = CONCAT("GRANT ", @user_perms," ON ", @dbname, "_production.* TO '",
	@username, "_admin'@'localhost' IDENTIFIED BY '", @admin_password, "'");
PREPARE stmt_admin_user FROM @s;
EXECUTE stmt_admin_user;
DEALLOCATE PREPARE stmt_admin_user;

-- development
SET @user_perms = "Select,Insert,Update,Delete,Create,Drop,Index,Alter,Lock Tables";
SET @s = CONCAT("GRANT ", @user_perms," ON ", @dbname, "_development.* TO '",
	@username, "_admin'@'localhost' IDENTIFIED BY '", @admin_password, "'");
PREPARE stmt_admin_user FROM @s;
EXECUTE stmt_admin_user;
DEALLOCATE PREPARE stmt_admin_user;

-- test
SET @user_perms = "Select,Insert,Update,Delete,Create,Drop,Index,Alter,Lock Tables";
SET @s = CONCAT("GRANT ", @user_perms," ON ", @dbname, "_test.* TO '",
	@username, "_admin'@'localhost' IDENTIFIED BY '", @admin_password, "'");
PREPARE stmt_admin_user FROM @s;
EXECUTE stmt_admin_user;
DEALLOCATE PREPARE stmt_admin_user;
