#!/bin/bash

dir=./regex101/
mkdir -p $dir
pushd $dir

# check for largest file is already existed
if [ ! -f ./js/pcrelib16.js ]; then

    echo "Donwnloading html & js...";
    wget -r --no-host-directories --no-parent http://regex101.com
    wget --output-document ./js/javascript.regex101.js http://regex101.com/js/javascript.regex101.js;
    wget --output-document ./js/pcre.regex101.js http://regex101.com/js/pcre.regex101.js;
    wget --output-document ./js/pcrelib16.js http://regex101.com/js/pcrelib16.js;

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
    wget --output-document fa-4.5.0.zip https://github.com/FortAwesome/Font-Awesome/archive/v4.5.0.zip;
    unzip fa-4.5.0.zip -d ./css/;
    rm fa-4.5.0.zip;
    sed -i -- '9s/\/\/maxcdn.bootstrapcdn.com\/font-awesome\/4.2.0\/css\//.\/css\/font-awesome-4.5.0\/css\//g' index.html;
fi

function server {

 # kill already running python server
 kill $(ps aux | grep '[S]impleHTTPServer' | awk '{print $2}')

 python -m SimpleHTTPServer $@;
}

server $@;
