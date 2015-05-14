#PyVenv

##On Ubuntu

###Install

    $ apt-get install python3-pyvenv
### Creating a VENV
    $ pyvenv-3.4 /path/to/env/

### Using the pyvenv
Make an environment variable pointing to the environment

    $ export VENV=/home/user/venv/path/
Now it is possible to access the environment without activating it.

    $ $VENV/bin/python myscript.py

### Errors regarding ensure pip
If you see an error when creating the environment such as follows,

    Error: Command '['/home/user/venv/env34/bin/python3.4', '-Im', 'ensurepip', '--upgrade', '--default-pip']' returned non-zero exit status 1
Create the environment without pip and install pip afterwards.
### VENV without pip

    $ pyvenv-3.4 --without-pip

### Installing Pip in a VENV
    $ source /path/to/venv/bin/activate
    $ wget https://bootstrap.pypa.io/get-pip.py
    $ python get-pip.py

### Installing easy_install
    $ wget https://bitbucket.org/pypa/setuptools/raw/bootstrap/ez_setup.py
    $ $VENV/bin/python ez_setup.py
