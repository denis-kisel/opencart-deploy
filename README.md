# Opencart-testplace
Rapid deployment of all versions of opencart for testing extensions

# Install
$ cd /path/to/root-server-directory

$ git clone https://github.com/denis-kisel/opencart-testplace oc.testplace

# Settings

$ cd oc.testplace

Create config file

$ cp conf.EXAMPLE.sh conf.sh

Change configs for your environtment:

$ nano conf.sh

# Create/update projects:

$ ./init.sh #Will create/update all versions of opencart

$ ./init.sh v:2000,2200,3000 #Will create/update the specified versions of opencart

$ ./init.sh odb #Will create/update only DB

$ ./init.sh of #Will create/update only files

# Example:

Create/update datebases for opencart versions 2200, 2302, 3000

$ ./init.sh v:2200,2302,3000 odb

# Test
Open the link http://yourhost/oc.testplace/ in your browser and select version.

Access to the admin panel: admin/admin
