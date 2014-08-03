Regex101.com-offline-app
========================

Use regex101.com offline

# Introduction

I'm not affiliated with regex101.com.

It requires Python 2.x and wget.

## OSX

```
brew install wget
```

## Linux

``` 
apt-get install wget
```


# How to do ?

Open a Terminal : 

```
wget -r -np http://regex101.com
````

It lacks 3 files : javascript-regex101.js, pcre.regex101.js, pcrelib16.js

``` 
wget --output-document ./regex101.com/js/javascript.regex101.js http://regex101.com/js/javascript.regex101.js
wget --output-document ./regex101.com/js/pcre.regex101.js http://regex101.com/js/pcre.regex101.js
wget --output-document ./regex101.com/js/pcrelib16.js http://regex101.com/js/pcrelib16.js

```

Then run a SimpleHTTPServer with python in the directory : 

```
cd regex101.com
python -m SimpleHTTPServer 8080
```

Open a browser, and go to [http://localhost:8080/](http://localhost:8080/) and it works ! ;)




