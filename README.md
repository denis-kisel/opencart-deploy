# Opencart Quick Deploy
Quick deploy some or all versions opencart.  
`Only for linux systems!`

Functional include:
* Create/Update files
* Create/Update DBs
* Automate config files, ftp, htaccess
* Specify opencart version(s) and optional settings

## Supported versions
|  2.0.x  |  2.1.x  | 2.2.x  | 2.3.x  | 3.0.x | 3.1.x |
|----------|----------|----------|----------|----------|----------|
| 2000 | 2101 | 2200| 2302 | 3000 | 3100
| 2010 |2102 | | | 3011 |
| 2011 | | | | 3012 |
| 2020 | | | | 3020 |
| 2031 | | | | 3032 |

## Demo
```bash
$ cd proj_dir

# Create all versions
$ oc-deploy

# Create/Update only files
$ oc-deploy skip_db skip_config

# Create/Update only db
$ oc-deploy skip_file skip_config

# Create/Update only config
$ oc-deploy skip_file skip_db

# Create/Update only specify version
$ oc-deploy v:2000

# Create/Update only specify versions
$ oc-deploy v:2000,2200,2302
```

## Install&Settings
``` bash
# Install
$ mkdir -p ~/Download/opencart-deploy && git clone https://github.com/denis-kisel/opencart-deploy ~/Download/opencart-deploy
$ cd ~/Download/opencart-deploy && sudo bash install.sh

# Settings
$ cd proj_dir
$ oc-mk-deploy-conf
$ nano oc_deploy.conf

# Use!
$ oc-deploy
```

## Available Params
|  Param  |  Description |
|----------|----------|
| `v` | Versions separated by comma. Example v:2000,2302,3000 |
| `skip_db` | Skip DB |
| `skip_file` | Skip file |
| `skip_config` | Skip config: config files(catalog, admin), ftp, htaccess |

## Testing
Open the link http://domain/{oc_version} in your browser.  
Ex: http://domain/3020.
Access to the admin panel: `admin/admin`

## Concrete Example
We have a module. We need to test&integrate this module on specify versions on OC. Call this module - `filter`  

We have the site dir:  
/var/www/filter.loc

We have the domain:  
http://localhost/filter.loc  

First of all we need to make deploy config:
```
# Go to site dir
$ cd /var/www/filter.loc

# Mk config
$ oc-mk-deploy-conf
```

Open config by editor and configure  
`/var/www/filter.loc/oc_deploy.conf`

```
# Versions we need to test&integrate
OC_VS=(2000 2010 2101 2200 2302 3000)

# Connection to mysql
DB_DRIVER=mysqli
DB_HOSTNAME=localhost
DB_USER=homestead
DB_PASS=secret
DB_PORT=3306

# Prefix for database name. Not table prefix!
PREFIX_DB=filter_

DOMAIN=http://localhost/filter.loc  
REWRITE_BASE=/filter.loc/
```

Deploy
```
# Go to site dir
$ cd /var/www/filter.loc

# Deploy
$ oc-deploy
```

Open Specify site with specify version OC:  
http://localhost/filter.loc/2000  
...  
http://localhost/filter.loc/3020

Open admin panel:  
http://localhost/filter.loc/2000/admin  
Access: `admin/admin`

# Licence
The MIT License (MIT)

# Donation
If this project help you reduce time to develop, you can give me a cup of coffee :)

WebMoney:  
USD: Z379807461542  
RUB: R540812684383   

YandexMoney(YooMoney): denis.kisel92@gmail.com
