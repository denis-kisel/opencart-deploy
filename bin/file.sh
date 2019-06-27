for oc_v in ${oc_vs[*]}
do
	echo Copy files for opencart $oc_v
	rm -fR $oc_v
	mkdir $oc_v
	mkdir tmp
	unzip -qq resources/archives/$oc_v.zip -d tmp

	mv tmp/*upload/* $oc_v 2>/dev/null
	mv tmp/*/upload/* $oc_v 2>/dev/null

	mkdir -p $oc_v/system/storage/cache
	mkdir -p $oc_v/system/storage/download
	mkdir -p $oc_v/system/storage/logs

	echo Files for opencart $oc_v is copied!
	rm -R tmp
done