#USER_PASSWORD=$1
#ADMIN_PASSWORD=$2

# \function gen_pass
# \description generate a random password of 30 characters
function gen_pass()
{
	openssl rand -base64 45 | tr -d /=+ | cut -c -30
}

DATABASE_NAME="dbname"
DATABASE_USER="dbuser"
USER_PASSWORD=$(gen_pass)
ADMIN_PASSWORD=$(gen_pass)
DEVISE_PASSWORD=$(gen_pass)

mysql -v -u root -p -e"SET @dbname='$DATABASE_NAME';SET @username='$DATABASE_USER';"\
"SET @user_password='$USER_PASSWORD';SET @admin_password='$ADMIN_PASSWORD';"\
" `cat rails_bootstrap.sql`"

#printf "[uwsgi]\nenv = ARDUBOY_DATABASE_PASSWORD=$USER_PASSWORD\n" > arduboy_spree.ini
#printf "passwords:\n  user_pass: $USER_PASSWORD\n  admin_pass: $ADMIN_PASSWORD\n"\
#"  devise_password: $DEVISE_PASSWORD\n" > database.yml
