jQuery ->
  $software = $('fieldset.software')
  $description = $software.find('div.js-description')
  $description.hide()

  $software.find('input[type="checkbox"]').on 'change', (evt) ->
    if $(this).attr('checked')
      $description.show()
    else
      $description.hide()
