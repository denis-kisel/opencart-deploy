for oc_v in ${oc_vs[*]}
do
	echo set configs for $oc_v
	cp resources/configs/catalog_config.txt $oc_v/config.php
	cp resources/configs/admin_config.txt $oc_v/admin/config.php
	cp resources/configs/htaccess.txt $oc_v/.htaccess

	# Catalog
	sed -i "s/{oc_v}/$oc_v/g" $oc_v/config.php
	sed -i "s/{domain}/${DOMAIN//\//\\/}/g" $oc_v/config.php
	sed -i "s/{dir_route}/${DIR_ROOT//\//\\/}/g" $oc_v/config.php

	sed -i "s/{db_driver}/$DB_DRIVER/g" $oc_v/config.php
	sed -i "s/{db_host}/$DB_HOSTNAME/g" $oc_v/config.php
	sed -i "s/{db_user}/$DB_USER/g" $oc_v/config.php
	sed -i "s/{db_pass}/$DB_PASS/g" $oc_v/config.php
	sed -i "s/{db_db}/$PREFIX_DB$oc_v/g" $oc_v/config.php
	sed -i "s/{db_port}/$DB_PORT/g" $oc_v/config.php

	# Admin
	sed -i "s/{oc_v}/$oc_v/g" $oc_v/admin/config.php
	sed -i "s/{domain}/${DOMAIN//\//\\/}/g" $oc_v/admin/config.php
	sed -i "s/{dir_route}/${DIR_ROOT//\//\\/}/g" $oc_v/admin/config.php

	sed -i "s/{db_driver}/$DB_DRIVER/g" $oc_v/admin/config.php
	sed -i "s/{db_host}/$DB_HOSTNAME/g" $oc_v/admin/config.php
	sed -i "s/{db_user}/$DB_USER/g" $oc_v/admin/config.php
	sed -i "s/{db_pass}/$DB_PASS/g" $oc_v/admin/config.php
	sed -i "s/{db_db}/$PREFIX_DB$oc_v/g" $oc_v/admin/config.php
	sed -i "s/{db_port}/$DB_PORT/g" $oc_v/admin/config.php

	# Htaccess
	sed -i "s/{rewrite_base}/${REWRITE_BASE//\//\\/}$oc_v\//g" $oc_v/.htaccess


	if [[ $oc_v = 2000 ]]; then
    	mysql -u $DB_USER -p$DB_PASS <<SET_FTP
    	USE $PREFIX_DB$oc_v
		DELETE FROM oc_setting WHERE \`key\` LIKE 'config_ftp%';
		INSERT INTO oc_setting (store_id, \`group\`, \`key\`, \`value\`, serialized) VALUES (0, 'config', 'config_ftp_status', '$FTP_STATUS', 0);
		INSERT INTO oc_setting (store_id, \`group\`, \`key\`, \`value\`, serialized) VALUES (0, 'config', 'config_ftp_root', '${DIR_ROOT//\//\\/}/$oc_v', 0);
		INSERT INTO oc_setting (store_id, \`group\`, \`key\`, \`value\`, serialized) VALUES (0, 'config', 'config_ftp_password', '$FTP_PASSWORD', 0);
		INSERT INTO oc_setting (store_id, \`group\`, \`key\`, \`value\`, serialized) VALUES (0, 'config', 'config_ftp_username', '$FTP_USERNAME', 0);
		INSERT INTO oc_setting (store_id, \`group\`, \`key\`, \`value\`, serialized) VALUES (0, 'config', 'config_ftp_port', '$FTP_PORT', 0);
		INSERT INTO oc_setting (store_id, \`group\`, \`key\`, \`value\`, serialized) VALUES (0, 'config', 'config_ftp_hostname', '${FTP_HOSTNAME//\//\\/}', 0);
SET_FTP
    else
    	mysql -u $DB_USER -p$DB_PASS <<SET_FTP
    	USE $PREFIX_DB$oc_v
		DELETE FROM oc_setting WHERE \`key\` LIKE 'config_ftp%';
		INSERT INTO oc_setting (store_id, \`code\`, \`key\`, \`value\`, serialized) VALUES (0, 'config', 'config_ftp_status', '$FTP_STATUS', 0);
		INSERT INTO oc_setting (store_id, \`code\`, \`key\`, \`value\`, serialized) VALUES (0, 'config', 'config_ftp_root', '${DIR_ROOT//\//\\/}/$oc_v', 0);
		INSERT INTO oc_setting (store_id, \`code\`, \`key\`, \`value\`, serialized) VALUES (0, 'config', 'config_ftp_password', '$FTP_PASSWORD', 0);
		INSERT INTO oc_setting (store_id, \`code\`, \`key\`, \`value\`, serialized) VALUES (0, 'config', 'config_ftp_username', '$FTP_USERNAME', 0);
		INSERT INTO oc_setting (store_id, \`code\`, \`key\`, \`value\`, serialized) VALUES (0, 'config', 'config_ftp_port', '$FTP_PORT', 0);
		INSERT INTO oc_setting (store_id, \`code\`, \`key\`, \`value\`, serialized) VALUES (0, 'config', 'config_ftp_hostname', '${FTP_HOSTNAME//\//\\/}', 0);
SET_FTP
    fi

	echo config is settings $oc_v
done