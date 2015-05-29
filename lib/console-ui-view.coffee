rivets = require 'rivets'
Template = require './template'

module.exports =
class ConsoleUiView
  constructor: (serializedState) ->
    @element = Template.get('console-ui-view.html')
    rivets.bind(@element, {it: this})

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @element.remove()

  getElement: ->
    @element
