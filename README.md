Regex101.com-offline-app
========================

Use regex101.com offline

# Introduction

I'm not affiliated with regex101.com.

It requires wget and to create a http-server.

## OSX

```
brew install wget
```

## Linux

``` 
apt-get install wget
```


# How to do ?

## Recover files

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

## Http Server

Here is a [https://gist.github.com/willurd/5720255](big list of http static server) and how to use them.

I suggest you to use python or nodejs.

```
cd regex101.com
`````
### python 2.x natively
```
python -m SimpleHTTPServer 8080
```

### nodejs
```
npm install -g http-server
http-server -p 8080
````


Open a browser, and go to [http://localhost:8080/](http://localhost:8080/) and it works ! ;)




