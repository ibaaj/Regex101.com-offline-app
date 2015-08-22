#!/bin/bash

trap ctrl_c SIGINT;

tempdir=`mktemp -d`

pushd $tempdir

wget -r --no-host-directories --no-parent http://regex101.com
wget --output-document ./js/javascript.regex101.js http://regex101.com/js/javascript.regex101.js;
wget --output-document ./js/pcre.regex101.js http://regex101.com/js/pcre.regex101.js;
wget --output-document ./js/pcrelib16.js http://regex101.com/js/pcrelib16.js;

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
