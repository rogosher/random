/* 
  Author: rogosher

  Description: Ruby on Rails mysql setup. Script adds development, production,
  and test databases to mysql server. Add a basic and admin user with related
  permissions.

  Executing:
      `$ mysql -u root -p < bootstrap_mysql.sh`
*/

SET @dbname = 'simplesite';
SET @username = 'simplesite';

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

-- Create or grant user @username and @username_admin permission on created
-- databases.

-- production user
SET @user_perms = "Select,Insert,Update,Delete,Lock Tables";
SET @s = CONCAT("GRANT ", @user_perms," ON ", @dbname, "_development.* TO '",
	@username, "'@'localhost' IDENTIFIED BY 'word'");
PREPARE stmt_user FROM @s;
EXECUTE stmt_user;
DEALLOCATE PREPARE stmt_user;

SET @user_perms = "Select,Insert,Update,Delete,Lock Tables";
SET @s = CONCAT("GRANT ", @user_perms," ON ", @dbname, "_production.* TO '",
	@username, "'@'localhost' IDENTIFIED BY 'word'");
PREPARE stmt_user FROM @s;
EXECUTE stmt_user;
DEALLOCATE PREPARE stmt_user;

SET @user_perms = "Select,Insert,Update,Delete,Lock Tables";
SET @s = CONCAT("GRANT ", @user_perms," ON ", @dbname, "._test* TO '",
	@username, "'@'localhost' IDENTIFIED BY 'word'");
PREPARE stmt_user FROM @s;
EXECUTE stmt_user;
DEALLOCATE PREPARE stmt_user;

-- administrative user
SET @user_perms = "Select,Insert,Update,Delete,Create,Drop,Index,Alter,Lock Tables";
SET @s = CONCAT("GRANT ", @user_perms," ON ", @dbname, "_development.* TO '",
	@username, "_admin'@'localhost' IDENTIFIED BY 'word'");
PREPARE stmt_admin_user FROM @s;
EXECUTE stmt_admin_user;
DEALLOCATE PREPARE stmt_admin_user;

SET @user_perms = "Select,Insert,Update,Delete,Create,Drop,Index,Alter,Lock Tables";
SET @s = CONCAT("GRANT ", @user_perms," ON ", @dbname, "_production.* TO '",
	@username, "_admin'@'localhost' IDENTIFIED BY 'word'");
PREPARE stmt_admin_user FROM @s;
EXECUTE stmt_admin_user;
DEALLOCATE PREPARE stmt_admin_user;

SET @user_perms = "Select,Insert,Update,Delete,Create,Drop,Index,Alter,Lock Tables";
SET @s = CONCAT("GRANT ", @user_perms," ON ", @dbname, "_test.* TO '",
	@username, "_admin'@'localhost' IDENTIFIED BY 'word'");
PREPARE stmt_admin_user FROM @s;
EXECUTE stmt_admin_user;
DEALLOCATE PREPARE stmt_admin_user;
