#!/bin/bash

trap ctrl_c SIGINT;

tempdir=`mktemp -d`

pushd $tempdir

wget -r --no-host-directories --no-parent https://regex101.com;
wget --output-document ./pcreWorker.js https://regex101.com/pcreWorker.js;
wget --output-document ./pcrelib.js https://regex101.com/pcrelib.js;

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
