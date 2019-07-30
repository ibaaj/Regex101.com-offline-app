#!/bin/bash

trap ctrl_c SIGINT;

tempdir=`mktemp -d`

pushd $tempdir

wget -r --no-host-directories --no-parent https://regex101.com;
wget --output-document ./static/golangWorker.js https://regex101.com/static/golangWorker.js;
wget --output-document ./static/pcreWorker.js https://regex101.com/static/pcreWorker.js;
wget --output-document ./static/javascriptWorker.js https://regex101.com/static/javascriptWorker.js;
wget --output-document ./static/pcrelib.js https://regex101.com/static/pcrelib.js;
wget --output-document ./static/golang.js https://regex101.com/static/golang.js;
wget --output-document ./static/bundle.js https://regex101.com/static/bundle.js;
wget --output-document ./static/vendor.71600b0e.chunk.js https://regex101.com/static/vendor.71600b0e.chunk.js;
wget --output-document ./static/sw.js https://regex101.com/static/sw.js;

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
