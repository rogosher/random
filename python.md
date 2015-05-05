# Building Python #

## Links
*   https://www.python.org/downloads/source/
*   https://hg.python.org/

## Download and Extract
Download and extract the source into its own directory.

    $ wget https://www.python.org/ftp/python/3.4.3/Python-3.4.3.tgz
    $ tar -zxvf Python-3.4.3.tgz
## Build Instructions

Note: If you are going to have multiple versions of Python on the same system use

    $ sudo make altinstall

For Unix like systems:

    $ ./configure
    $ make
    $ make test
    $ sudo make install

## Required and Optional Libraries
Install the required packages as well as any option desired.

    $ sudo apt-get install build-essential
### Required
    build-essential
### Optional
    libz-dev
    libc6-dev
    libssl-dev
    libbz2-dev
    libncursesw5-dev
    libgdbm-dev
    liblzma-dev
    libsqlite3-dev
    libreadline6-dev
    libdb-dev
    tk-dev
### All in One
    $ sudo apt-get install build-essential libc6-dev libssl-dev libbz2-dev libncursesw5-dev libqdbm-dev libgdbm-dev liblzma-dev libsqlite3-dev libreadline6-dev tk-dev libz-dev libdb-dev

## Building Missing Modules
At the end of the make process, if libraries were missing, a list of modules not
built will be displayed.

The output may look something like this:

    The necessary bits to build these optional modules were not found
    _bz2                  _curses               _curses_panel      
    _dbm                  _gdbm                 _lzma              
    _sqlite3              _tkinter              readline           

In order for these to be successfuly built a developer package will need to be
installed on the system.

Example

    $ sudo apt-get install foo-dev

To search for a package on Debian like sytems:

    $ sudo apt-cache search foo
Where foo is the string to search the repository for.

## Installing Multiple Versions
On Unix and Mac systems if you intend to install multiple versions of Python
using the same installation prefix (`--prefix` argument to the configure script)
you must take care that your primary python executable is not overwritten by the
installation of a different version.  All files and directories installed using
`make altinstall` contain the major and minor version and can thus live
side-by-side.  `make install` also creates `${prefix}/bin/python3` which refers to
`${prefix}/bin/pythonX.Y`.  If you intend to install multiple versions using the
same prefix you must decide which version (if any) is your "primary" version.
Install that version using `make install`.  Install all other versions using
`make altinstall`.

For example, if you want to install Python 2.6, 2.7 and 3.4 with 2.7 being the
primary version, you would execute `make install` in your 2.7 build directory
and `make altinstall` in the others.

