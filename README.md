# Opencart Quick Deploy

## Supported versions
|  2.0.x  |  2.1.x  | 2.2.x  | 2.3.x  | 3.0.x | 3.1.x |
|----------|----------|----------|----------|----------|----------|
| 2000 | 2101 | 2200| 2302 | 3000 | 3100
| 2010 |2102 | | | 3011 |
| 2011 | | | | 3012 |
| 2020 | | | | 3020 |
| 2031 |

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
$ cp deploy.conf.EXAMPLE deploy.conf

# Set deploy versions by default, db connecion, domain and fpt(optional)
$ nano deploy.conf
```

## Testing
Open the link http://domain/ in your browser and select version.

Access to the admin panel: `admin/admin`
