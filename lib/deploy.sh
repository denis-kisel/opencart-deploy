#!/bin/bash

read -p "Are you sure? [y/n]" -n 1 -r
echo    # (optional) move to a new line
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    exit 1
fi

if [ ! -f oc_deploy.conf ]; then
    echo "oc_deploy.conf does not exists!"
    echo "Use command to generate config: [oc-mk-deploy-conf]"
    exit 1
fi

sudo chmod -R 777 .

source oc_deploy.conf
source /usr/local/lib/oc-deploy/default.conf

DIR_ROOT=$(pwd)

create_db=yes
create_files=yes
create_configs=yes
oc_vs=${OC_VS[@]}

args=$@
for arg in ${args[*]}
do
	if [[ $arg = skip_db ]]; then
		create_db=no
	fi

	if [[ $arg = skip_file ]]; then
		create_files=no
	fi

	if [[ $arg = skip_config ]]; then
		create_configs=no
	fi

	if [[ $arg = v:* ]]; then
		oc_vs_str=${arg//v:/}
		IFS=',' read -r -a oc_vs <<< $oc_vs_str
	fi
done

if [[ $create_files = yes ]]; then
	source $LIB_PATH/file.sh
	sudo chmod -R 777 .
fi

if [[ $create_db = yes ]]; then
	source $LIB_PATH/db.sh
fi

if [[ $create_configs = yes ]]; then
	source $LIB_PATH/config.sh
fi