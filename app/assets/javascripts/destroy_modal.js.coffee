jQuery ->
  $ = jQuery

  $modal = $('#destroy-modal')

  createDestroyCallback = (href,msg) ->
    (evt)->
      $modal.find('.message').text(msg)
      $modal.find('a.destroy').attr('href', href).on 'click', (evt) ->
        $modal.modal('hide')
      $modal.modal('show')
      evt.preventDefault()
      evt.stopPropagation()

  $('.container a.destroy:not(.remove_fields)').each ->
    $this = $(this)
    href = $this.attr('href')
    msg = $this.data('confirm')
    $this.on 'click', createDestroyCallback(href, msg)

