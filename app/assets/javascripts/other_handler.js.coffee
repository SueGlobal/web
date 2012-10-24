class OtherHandler

  constructor: (@toggler, @extendedInfo) ->

  mustShow: ->

  setUp: ->
    @callback()
    @toggler.on 'change', @callback

  callback: (evt) =>
    if @mustShow()
      @extendedInfo.show()
    else
      @extendedInfo.hide()

class CheckboxHandler extends OtherHandler

  mustShow: ->
    @toggler.is(':checked')

class SelectHandler extends OtherHandler

  constructor: (@toggler, @extendedInfo, @valueForShow) ->
    super @toggler, @extendedInfo

  mustShow: ->
    @toggler.find('option:selected').val() is @valueForShow

window.SueGlobal.OtherHandler = OtherHandler
window.SueGlobal.CheckboxHandler = CheckboxHandler
window.SueGlobal.SelectHandler = SelectHandler
