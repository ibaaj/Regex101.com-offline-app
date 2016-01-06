# kill already running python server
kill -9 $(ps aux | grep '[S]impleHTTPServer' | awk '{print $2}')

python -m SimpleHTTPServer $@;
