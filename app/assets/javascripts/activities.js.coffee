jQuery ->
  $form = $('form.new_activity_query')
  $submit = $form.find("input[type=submit]")
  handler = (evt) ->
    $submit.attr('disabled', $form.find('input.boolean:checked').length is 0)

  handler()
  $form.find('input.boolean').on 'change', handler
