#!/bin/bash

trap ctrl_c SIGINT;

tempdir=`mktemp -d`

pushd $tempdir

echo "Donwnloading html & js...";
wget -r --no-host-directories --no-parent https://regex101.com;
wget --output-document ./pcreWorker.js https://regex101.com/pcreWorker.js;
wget --output-document ./pcrelib.js https://regex101.com/pcrelib.js;

echo "Downloading Open Sans font... ";
wget --output-document ./css/open-sans-font.css "http://fonts.googleapis.com/css?family=Open+Sans:400,700,300&subset=latin";
fontsUrl=$(sed -ne 's/.*\(http[^"]*\).*/\1/p' < ./css/open-sans-font.css | cut -d ')' -f 1);
mkdir fonts;
for font in "${fontsUrl[@]}"
do
  wget --directory-prefix=./fonts/ $font;
done
sed -i -- 's/http\:\/\/fonts.gstatic.com\/s\/opensans\/v13\//..\/fonts\//g' ./css/open-sans-font.css;
sed -i -- '5s/\/\/fonts.googleapis.com\/css?family=Open+Sans:400,700,300&amp;subset=latin/.\/css\/open-sans-font.css/g' index.html;


echo "FontAwesome work...";
wget --output-document fa-4.4.0.zip https://fortawesome.github.io/Font-Awesome/assets/font-awesome-4.4.0.zip;
unzip fa-4.4.0.zip -d ./css/;
rm fa-4.4.0.zip;
sed -i -- '9s/\/\/maxcdn.bootstrapcdn.com\/font-awesome\/4.2.0\/css\//.\/css\/font-awesome-4.4.0\/css\//g' index.html;



function server {
 python -m SimpleHTTPServer $@;
}

function cleanup {
 echo "Cleaning up downloaded files...";
 popd;
 rm -rf ${tempdir};
}

function ctrl_c {
 cleanup;
 exit $?;
}

server $@;
