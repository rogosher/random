# Variable wrapper for setting up MySQL tables for Rails 4
# author: rogosher

# gen_pass
#   generate a random password of 30 characters
function gen_pass()
{
	openssl rand -base64 45 | tr -d /=+ | cut -c -30
}

DATABASE_NAME="dbname"
DATABASE_USER="dbuser"
USER_PASSWORD=$(gen_pass)
ADMIN_PASSWORD=$(gen_pass)
DEVISE_KEY_BASE=$(gen_pass)
SECRET_KEY_BASE=$(gen_pass)

mysql -v -u root -p -e"SET @dbname='$DATABASE_NAME';SET @username='$DATABASE_USER';"\
"SET @user_password='$USER_PASSWORD';SET @admin_password='$ADMIN_PASSWORD';"\
" `cat rails_bootstrap.sql`"

printf "passwords:\n  user_pass: $USER_PASSWORD\n  admin_pass: $ADMIN_PASSWORD\n"\
"  devise_key_base: $DEVISE_KEY_BASE\n  secret_key_base: $SECRET_KEY_BASE\n" > database.yml
