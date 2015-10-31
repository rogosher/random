# Starting a Ruby on Rails project

## Starting
Create a user and switch to user.

```bash
$ adduser railsdeploy
```

Login as the new user.
## Install RVM

Install mpapis public key

```bash
$ gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
```

Install RVM stable.

```
$ \curl -sSL https://get.rvm.io | bash -s stable
```

Activate it.

```
$ source /home/railsdeploy/.rvm/scripts/rvm
```

Install Ruby and use it.

```
$ rvm install 2.2.1
$ rvm use 2.2.1
```

Create a gemset, then activate it.

```
$ rvm gemset create mygemset
$ rvm 2.2.1@mygemset
```

Update the rubygems

```
$ rvm rubygems current
```

Install Rails

```
$ gem install rails -v 4.2.2
```

## MySQL

Create a new user and database, then grant access to database for the user.

```sql
$ CREATE DATABASE simplesite_development;
$ CREATE USER 'simplesite'@'localhost';
$ GRANT ALL ON simplesite_development.* TO 'simplesite'@'localhost';
```

## Bootstrap

```bash
$ cd `bundle show bootstrap-sass`
$ find assets/stylesheets
```

## Notes

### Changing site directory

In the file `config/routes`, changing '/' in the line below will change Spree's
root.

```
mount Spree::Core::Engine, :at => '/'
```

When assets are recompiled, there exists a bug which is resolved via.

>I've just come across this issue and I think the problem might be in the case where you've initially mounted to / (Spree default install) and afterward change it to /store or a different path. I inadvertently fixed the issue when I attempted to debug the @mountedAt function, which is taken into account when generating the API paths. By editing the file I caused the ERB to re-compile which picked up my new mount path. I think it probably compiled the ERB once, when it was still mounted at /, and doesn't re-compile unless the ERB file changes. So after changing your mount point you should make a small change to spree.js.coffee.erb, which will cause the asset pipeline to re-compile it with the correct mount path.
>
>You can find this file by running:
>
>```
>echo "`bundle show spree_core`/app/assets/javascripts/spree.js.coffee.erb"
>```
>
>Hope this helps someone in the future who stumbles across this issue!

### Installing gems without documentation
```
$ echo "gem: --no-ri --no-rdoc" > ~/.gemrc
```
[1]: https://github.com/spree/spree 
