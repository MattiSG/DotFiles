# https://bugzilla.mozilla.org/show_bug.cgi?id=693450

function join_by { local IFS="$1"; shift; echo "$*"; }


echo "Installing French government certificates"

echo "Downloading list of already emitted certificates…"
certificates=$(curl -# https://www.ssi.gouv.fr/administration/services-securises/igca/certificats-emis-par-ligca-rsa-4096/ | grep '.crt' | cut -d '"' -f 4)
certificates=$(join_by , $certificates /uploads/2014/11/igcaRSA4096-072011.crt)

tmp_dir=$(mktemp -d)
cd $tmp_dir

echo "Downloading certificates…"
curl --remote-name -# https://www.ssi.gouv.fr{$certificates}

for cert in *.crt
do
	echo "Adding $cert"
	security add-certificates $cert
done

echo $tmp_dir
cd
rm -rf $tmp_dir
