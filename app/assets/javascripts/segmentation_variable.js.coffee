jQuery ->
  $form = $('form.new_segmentation_variable')
  reorder = ->
    $('.segmentation_variable_value:visible input[type=number]').each (idx) ->
      $(this).val(idx + 1)
  reorder()
  $form.on 'click', '.add_fields', (evt) ->
    $this = $(this)
    time = new Date().getTime()
    regexp = new RegExp($this.data('id'), 'g')
    $this.before($this.data('fields').replace(regexp, time))
    reorder()
    evt.preventDefault()

  $form.on 'click', '.remove_fields', (evt) ->
    $this = $(this)
    $this.prev('input[type=hidden]').val('1')
    $this.closest('div.segmentation_variable_value').hide()
    reorder()
    evt.preventDefault()
