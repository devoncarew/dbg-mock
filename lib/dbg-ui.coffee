DebuggerUiView = require './debugger-ui-view'
ConsoleUiView = require './console-ui-view'
{CompositeDisposable} = require 'atom'

module.exports = DbgUi =
  debuggerUiView: null
  debuggerPanel: null

  consoleUiView: null
  consolePanel: null

  subscriptions: null

  activate: (state) ->
    console.log('dbg-ui activate')
    @debuggerUiView = new DebuggerUiView(state.debuggerUiViewState)
    @debuggerPanel = atom.workspace.addRightPanel(
      item: @debuggerUiView.getElement(), visible: true)

    @consoleUiView = new ConsoleUiView(state.consoleUiViewState)
    @consolePanel = atom.workspace.addBottomPanel(
      item: @consoleUiView.getElement(), visible: true)

    @subscriptions = new CompositeDisposable
    @subscriptions.add atom.commands.add 'atom-workspace', 'dbg-ui:debugger-ui': =>
      @toggleDebugger()
    @subscriptions.add atom.commands.add 'atom-workspace', 'dbg-ui:console-ui': =>
      @toggleConsole()

  deactivate: ->
    @debuggerPanel.destroy()
    @consolePanel.destroy()
    @subscriptions.dispose()
    @debuggerUiView.destroy()

  serialize: ->
    debuggerUiViewState: @debuggerUiView.serialize(),
    consoleUiViewState: @consoleUiView.serialize()

  toggleDebugger: ->
    if @debuggerPanel.isVisible()
      @debuggerPanel.hide()
    else
      @debuggerPanel.show()

  toggleConsole: ->
    if @consolePanel.isVisible()
      @consolePanel.hide()
    else
      @consolePanel.show()
