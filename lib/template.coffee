fs    = require 'fs'
path  = require 'path'

class Template
  @getText: (template) =>
    current = __dirname
    fs.readFileSync path.join(current, template), encoding: 'utf-8'

  @get: (template) =>
    html = @getText(template)
    wrapper = document.createElement('div')
    wrapper.innerHTML = html
    wrapper.firstChild

module.exports = Template
