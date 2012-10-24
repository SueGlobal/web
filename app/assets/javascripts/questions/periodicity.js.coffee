jQuery ->
  $periodicities = $('div.periodicity')

  $periodicities.each (idx, el) ->
    $el = $(el)
    $select = $el.find('select')
    $other = $el.find('div.other')
    callback = do ($select, $other) ->
      (evt) ->
        $other.hide()
        value = $select.children('option:selected').val()
        if value is 'other'
          $other.show()

    callback()
    $el.find('select').on 'change', callback
