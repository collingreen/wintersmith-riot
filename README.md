# wintersmith-riot

[riot js](https://muut.com/riotjs) plugin for [wintersmith](https://github.com/jnordberg/wintersmith)

### Installation:

`npm install wintersmith-riot -g`
Add `wintersmith-riot` to your package.json file under dependencies:

~~~
  "dependencies": {
    ...
    "wintersmith-riot": "*"
  }
~~~

then add `wintersmith-riot` to your plugins in the wintersmith config


### Configuration

By default, the wintersmith-riot plugin matches any .tag file in the scripts
folder. You can modify this by setting the `fileGlob` key in the `riot` section
of your config.json.

Defaults:
~~~
  "riot": {
      "fileGlob": "**/*.*(tag)",
      "outExtension": ".js"
  }
~~~


### Usage

Any .tag file in your contents folder (matching the fileGlob setting) will be
run through the riot compiler and converted to a .js file.


### TODO:
- inject all the converted tag files and all stores as html script tags
      <script src='file.js'></script>
