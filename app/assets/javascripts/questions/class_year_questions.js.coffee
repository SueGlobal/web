jQuery ->
  # Other option
  $classYear = $('fieldset.class_year')
  $other = $classYear.find('div.other')
  $other.hide()

  $classYear.find('select').on 'change', (evt) ->
    value = $(this).find('option:selected').val()
    $other.hide()
    if value is 'other'
      $other.show()

  # Add fields
  $classYear.on 'click', '.add_fields', (evt) ->
    $this = $(this)
    time = new Date().getTime()
    regexp = new RegExp($this.data('id'), 'g')
    $this.before($this.data('fields').replace(regexp, time))
    event.preventDefault()

  # Remove fields
  $classYear.on 'click', '.remove_fields', (evt) ->
    $this = $(this)
    $this.prev('input[type=hidden]').val('1')
    $this.closest('div.class_year').hide()
    evt.preventDefault()
