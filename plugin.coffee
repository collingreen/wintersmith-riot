riot = require 'riot'
fs = require 'fs'

module.exports = (env, callback) ->
  options = env.config.riot or {}
  options.fileGlob ?= '**/*.*(tag)'
  options.outExtension ?= '.js'

  class RiotPlugin extends env.ContentPlugin

    constructor: (@_filepath, @_text) ->

    getFilename: ->
      @_filepath.relative.replace /(tag)$/, 'js'

    getView: ->
      return (env, locals, contents, templates, callback) ->
        try
          js = riot.compile @_text
          callback null, new Buffer js
        catch error
          callback error

  RiotPlugin.fromFile = (filepath, callback) ->
    fs.readFile filepath.full, (error, buffer) ->
      if error
        callback error
      else
        callback null, new RiotPlugin filepath, buffer.toString()

  env.registerContentPlugin 'riot', options.fileGlob, RiotPlugin
  callback()
