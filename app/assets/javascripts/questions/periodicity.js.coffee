jQuery ->
  $periodicities = $('div.periodicity')

  $periodicities.each (idx, el) ->
    $el = $(el)
    $other = $el.find('div.other')
    $other.hide()

    $el.find('select').on 'change', (evt) ->
      $other.hide()
      value = $(this).children('option:selected').val()
      if value is 'other'
        $other.show()
