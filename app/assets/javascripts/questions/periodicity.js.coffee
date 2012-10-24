jQuery ->
  $periodicities = $('div.periodicity')

  SelectHandler = window.SueGlobal.SelectHandler

  $periodicities.each (idx, el) ->
    $el = $(el)
    toggler = new SelectHandler $el.find('select'), $el.find('div.other'), 'other'

    toggler.setUp()
