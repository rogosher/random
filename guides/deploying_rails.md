# Deploying Rails
## Make source available via Git
Create a git repository on your system
```
$ mkdir /var/cache/git/mysite.git
$ git init --bare
```
On the system holding the source, create a repository and push.
```
$ git init
$ git add .
$ git remote add origin user@domain.net:/var/cache/git/mysite.git
$ git commit -m 'first commit'
$ git push origin master
```
If this is a cloned project, try:
```
$ git remote set-url origin user@domain.net:/var/cache/git/mysite.git
```

Create a new user.
```
myuser@home:~$ sudo adduser rails-deploy
```
Switch to user.
```
myuser@home:~$ su rails-deploy
```
Install RVM
```
rails_user@home:~$ \curl -sSL get.rvm.io | bash -s stable
```
Activate RVM
```
rails_user@home:~$ source /home/rails_deploy/.rvm/scripts/rvm
```
Install a Ruby version and use it.
```
rails_user@home:~$ rvm install 2.2.2
rails_user@home:~$ rvm use 2.2.2 --default
```
Install uwsgi.
```
rails_user@home:~$ gem install uwsgi -V --no-ri --no-rdoc
```

Create a gemset and use it.
```
rails_user@home:~$ rvm gemset create site_gemset
rails_user@home:~$ rvm 2.2.2@site_gemset
```
Install Rails and bundler, skipping RDoc and Ri Documentation.
```
rails_user@home:~$ gem install rails -V --no-ri --no-rdoc
rails_user@home:~$ gem install bundler -V --no-ri --no-rdoc
```
## Precompiling assets
```
$ RAILS_ENV=production bundle exec rake assets:precompile
```
Share assets with nginx
## RVM and Systemd
A wrapper for uwsgi can be found at
```
/path/to/rvm/wrappers/ruby-2.2.2
```

When configuring the .ini scripts for a vassal, set the `rvm-path` field to the
location of rvm.
