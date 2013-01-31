jQuery ->
  $form = $('form.select_year')
  year = $form.data('year')
  $select = $form.find('select')
  $input = $form.find('input.btn').on 'click', (evt) ->
    evt.preventDefault()
    evt.stopPropagation()
    window.location.href = $form.attr('action').replace(year, $select.val())
