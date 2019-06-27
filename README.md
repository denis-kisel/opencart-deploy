# Opencart Quick Deploy
Quick deploy some or all versions opencart. 

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
$ bash deploy.sh

# Create/Update only files
$ bash deploy.sh skip_db skip_config

# Create/Update only db
$ bash deploy.sh skip_file skip_config

# Create/Update only config
$ bash deploy.sh skip_file skip_db

# Create/Update only specify version
$ bash deploy.sh v:2000

# Create/Update only specify versions
$ bash deploy.sh v:2000,2200,2302
```

## Install
``` bash
$ cd proj_dir
$ git clone https://github.com/denis-kisel/opencart-deploy .
```

## Settings

```bash
$ cd proj_dir

# Create config file
$ cp oc_deploy.conf.EXAMPLE oc_deploy.conf

# Set deploy versions by default, db connecion, domain and fpt(optional)
$ nano oc_deploy.conf
```

## Available Params
|  Param  |  Description |
|----------|----------|
| `v` | Versions separated by comma. Example v:2000,2302,3000 |
| `skip_db` | Skip DB |
| `skip_file` | Skip file |
| `skip_config` | Skip config: config files(catalog, admin), ftp, htaccess |

## Testing
Open the link http://domain/ in your browser and select version.

Access to the admin panel: `admin/admin`
