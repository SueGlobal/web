{CheckboxHandler, SelectHandler} = window.SueGlobal

jQuery ->

  $('input.js-other-change[type=checkbox]').each (idx, el) ->
    do (idx, el) =>
      $el = $(el)
      $collapsable = $el.parent().siblings('.js-other-collapsable')
      toggler = new CheckboxHandler $el, $collapsable
      toggler.setUp()
