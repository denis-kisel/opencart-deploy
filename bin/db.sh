for oc_v in ${oc_vs[*]}
do
	echo "Create DB $oc_v"

	# Fix sql bugs
	sed -i "s/----/-- --/" $oc_v/install/opencart.sql


	mysql -u $DB_USER -p$DB_PASS <<CREATE_DB
	DROP DATABASE IF EXISTS $PREFIX_DB$oc_v;
	CREATE DATABASE $PREFIX_DB$oc_v;
	USE $PREFIX_DB$oc_v
	source $oc_v/install/opencart.sql
	INSERT INTO oc_user (user_id, user_group_id, username, password, salt, firstname, lastname, email, image, code, ip, status, date_added) VALUES (1, 1, 'admin', '21232f297a57a5a743894a0e4a801fc3', '', '', '', '', '', '', '', 1, '2018-06-05 09:32:05');
CREATE_DB

	echo "DB for $oc_v is created!"
done