jQuery ->
  SelectHandler = window.SueGlobal.SelectHandler
  # Other option
  $classYear = $('fieldset.class_year')
  $other = $classYear.find('div.other')
  $other.hide()

  toggler = new SelectHandler $classYear.find('select'), $other, 'other'
  toggler.setUp()

  # Add fields
  $classYear.on 'click', '.add_fields', (evt) ->
    $this = $(this)
    time = new Date().getTime()
    regexp = new RegExp($this.data('id'), 'g')
    $this.before($this.data('fields').replace(regexp, time))
    evt.preventDefault()

  # Remove fields
  $classYear.on 'click', '.remove_fields', (evt) ->
    $this = $(this)
    $this.prev('input[type=hidden]').val('1')
    $this.closest('div.class_year').hide()
    evt.preventDefault()
